import os
import logging
import yaml
import re
import traceback
from collections import defaultdict
from rdflib import Graph, XSD, Literal, URIRef, OWL, RDFS, RDF
from rdflib.namespace import DCTERMS, SKOS
from utils import get_label, get_qname, get_first_literal, hyperlink_class, insert_spaces, class_restrictions, iter_annotations, DESC_PROPS, get_ontology_for_uri, fauxClass, get_filename

log = logging.getLogger("owl2mkdocs")

class SafeMkDocsLoader(yaml.SafeLoader):
    """Custom YAML loader to handle MkDocs-specific python/name tags."""
    def ignore_python_name(self, node):
        """Treat python/name tags as strings."""
        return self.construct_scalar(node)

yaml.SafeLoader.add_constructor('tag:yaml.org,2002:python/name:material.extensions.emoji.twemoji', SafeMkDocsLoader.ignore_python_name)
yaml.SafeLoader.add_constructor('tag:yaml.org,2002:python/name:pymdownx.superfences.fence_code_format', SafeMkDocsLoader.ignore_python_name)
yaml.SafeLoader.add_constructor('tag:yaml.org,2002:python/name:material.extensions.emoji.to_svg', SafeMkDocsLoader.ignore_python_name)

def get_specializations(g: Graph, cls: URIRef, global_all_classes: set, ns: str, prefix_map: dict, ns_to_ontology: dict) -> list:
    """Find all subclasses (direct and indirect) of the given class."""
    specializations = []
    visited = set()
    def collect_subclasses(c):
        if c in visited:
            return
        visited.add(c)
        for s in g.subjects(RDFS.subClassOf, c):
            if isinstance(s, URIRef) and s != c:
                cls_name = get_first_literal(g, s, [RDFS.label]) or str(s).split('/')[-1].split('#')[-1]
                ont = get_ontology_for_uri(str(s), ns_to_ontology)
                if cls_name in global_all_classes and ont:
                    desc = get_first_literal(g, s, [DCTERMS.description]) or ""
                    specializations.append((cls_name, desc, ont))
                collect_subclasses(s)
    collect_subclasses(cls)
    log.debug(f"Specializations for {cls}: {specializations}")
    return sorted(specializations, key=lambda x: x[0].lower())

def get_used_by(g: Graph, cls: URIRef, global_all_classes: set, ns: str, prefix_map: dict, ns_to_ontology: dict) -> list:
    """Find classes and their properties that reference this class via object property restrictions."""
    used_by = []
    for s in g.subjects(RDF.type, OWL.Restriction):
        prop = g.value(s, OWL.onProperty)
        for predicate in [OWL.allValuesFrom, OWL.someValuesFrom, OWL.hasValue]:
            target = g.value(s, predicate)
            if target == cls and prop:
                prop_name = get_qname(g, prop, ns, prefix_map)
                for cls_sub in g.subjects(RDFS.subClassOf, s):
                    if isinstance(cls_sub, URIRef):
                        cls_name = get_first_literal(g, cls_sub, [RDFS.label]) or str(cls_sub).split('/')[-1].split('#')[-1]
                        ont = get_ontology_for_uri(str(cls_sub), ns_to_ontology)
                        if cls_name in global_all_classes and ont:
                            used_by.append((cls_name, prop_name, ont))
                cls_name = get_first_literal(g, s, [RDFS.label]) or str(s).split('/')[-1].split('#')[-1]
                ont = get_ontology_for_uri(str(s), ns_to_ontology)
                if cls_name in global_all_classes and ont:
                    used_by.append((cls_name, prop_name, ont))
    log.debug(f"Used by for {cls}: {used_by}")
    return sorted(used_by, key=lambda x: x[0].lower())

def generate_markdown(g: Graph, cls: URIRef, cls_name: str, global_patterns: dict, global_all_classes: set, ns: str, file_path: str, errors: list, prefix_map: dict, prop_map: dict, ontology_name: str, ns_to_ontology: dict, class_to_onts: dict):
    """Generate Markdown file for a class, including all superclasses and disjoint statements in Formalization."""
    filename = os.path.join(os.path.dirname(file_path), f"{get_filename(cls_name)}.md")
    
    log.debug(f"Writing {filename} for class {cls_name} ({cls})")
    
    # Check if this is a pattern class
    is_pattern = cls_name in global_patterns

    if is_pattern:
        # Pattern class Markdown
        title = f"# {insert_spaces(cls_name)}\n\n"
        desc = get_first_literal(g, cls, [SKOS.definition]) or ""
        log.info(f"Pattern {cls_name} description: {desc}")
        top_desc = f"{desc}\n\n" if desc else ""
        members_md = "It consists of the following classes:\n\n"
        member_tuples = global_patterns[cls_name]["classes"]
        for mem_cls, mem_ont in sorted(member_tuples, key=lambda x: x[0].lower()):
            if mem_cls == 'ITSThing':
                continue
            display_mem = insert_spaces(mem_cls)
            if len(class_to_onts[mem_cls]) > 1:
                display_mem += f" ({mem_ont})"
            members_md += f"- [{display_mem}]({mem_ont}__{mem_cls}.md)\n"
        content = title + top_desc + members_md
    else:
        # Non-pattern class Markdown
        title = f"# {cls_name}\n\n"
        desc = get_first_literal(g, cls, [SKOS.definition]) or ""
        log.debug(f"Class {cls_name} description: {desc}")
        top_desc = f"{desc}\n\n" if desc else ""
        note = get_first_literal(g, cls, [SKOS.note]) or ""
        note_md = f"NOTE: {note}\n\n" if note else ""
        example = get_first_literal(g, cls, [SKOS.example]) or ""
        example_md = f"EXAMPLE: {example}\n\n" if example else ""
        diagram_line = f"<object type=\"image/svg+xml\" data=\"../diagrams/{cls_name}.dot.svg\">\n"
        diagram_line += f"    <img alt=\"{cls_name} Diagram\" src=\"../diagrams/{cls_name}.dot.png\" /> <!-- Fallback for non-SVG browsers -->\n"
        diagram_line += "</object>"
        # f"![{cls_name} Diagram](../diagrams/{ontology_name}__{cls_name}.dot.svg)\n\n<a href=\"../../diagrams/{ontology_name}__{cls_name}.dot.svg\">Open interactive {cls_name} diagram</a>\n\n"
        
        # Specializations section
        specializations = get_specializations(g, cls, global_all_classes, ns, prefix_map, ns_to_ontology)
        specializations_md = ""
        if specializations:
            specializations_md += f"## Specializations of {cls_name}\n\n"
            specializations_md += "| Class | Description |\n"
            specializations_md += "|-------|-------------|\n"
            for spec_cls, spec_desc, spec_ont in specializations:
                display_spec = insert_spaces(spec_cls)
                if len(class_to_onts[spec_cls]) > 1:
                    display_spec += f" ({spec_ont})"
                link = f"{spec_ont}__{spec_cls}.md"
                specializations_md += f"| [{display_spec}]({link}) | {spec_desc} |\n"
            specializations_md += "\n"
        else:
            log.debug(f"No specializations found for {cls_name}")
        
        # Formalization section with superclasses and disjoints
        restr_rows = class_restrictions(g, cls, ns, prefix_map)
        # Collect direct superclasses
        superclasses = []
        for super_cls in g.objects(cls, RDFS.subClassOf):
            if isinstance(super_cls, URIRef) and super_cls != OWL.Thing:
                super_name = get_qname(g, super_cls, ns, prefix_map)
                superclasses.append(("subClassOf", super_name))
        # Collect disjoint classes
        disjoints = []
        for disjoint_cls in g.objects(cls, OWL.disjointWith):
            if isinstance(disjoint_cls, URIRef):
                disjoint_name = get_qname(g, disjoint_cls, ns, prefix_map)
                disjoints.append(("disjointWith", disjoint_name))
        # Combine with restrictions from class_restrictions
        formalization_rows = sorted(restr_rows + superclasses + disjoints, key=lambda x: x[0].lower())
        formalization_md = ""
        if formalization_rows:
            formalization_md += f"## Formalization for {cls_name}\n\n"
            formalization_md += "| Property | Constraint |\n"
            formalization_md += "|----------|------------|\n"
            for prop, constr in formalization_rows:
                log.debug(f"Restriction for {cls_name}: ({prop}, '{constr}')")
                formalization_md += f"| {prop} | {constr} |\n"
            formalization_md += "\n"
        
        # Used by section
        used_by = get_used_by(g, cls, global_all_classes, ns, prefix_map, ns_to_ontology)
        used_by_md = ""
        if used_by:
            used_by_md += f"## Used by classes\n\n"
            used_by_md += "| Class | Property |\n"
            used_by_md += "|-------|----------|\n"
            for used_cls, used_prop, used_ont in used_by:
                display_used = insert_spaces(used_cls)
                if len(class_to_onts[used_cls]) > 1:
                    display_used += f" ({used_ont})"
                link = f"{used_ont}__{used_cls}.md"
                used_by_md += f"| [{display_used}]({link}) | {used_prop} |\n"
            used_by_md += "\n"
        
        # Other annotations
        other_annot_md = ""
        annotations = list(iter_annotations(g, cls, ns, prefix_map))
        if annotations:
            other_annot_md += "## Other annotations\n\n"
            other_annot_md += "| Annotation | Value |\n"
            other_annot_md += "|------------|-------|\n"
            for pred, val in sorted(annotations):
                other_annot_md += f"| {pred} | {val} |\n"
            other_annot_md += "\n"
        
        content = title + top_desc + note_md + example_md + diagram_line + specializations_md + formalization_md + used_by_md + other_annot_md

    # Write Markdown file
    try:
        with open(filename, "w", encoding="utf-8") as f:
            f.write(content)
        log.debug("Generated Markdown file: %s", filename)
    except Exception as e:
        error_msg = f"Error writing Markdown for {cls_name} from {file_path}: {str(e)}\n{traceback.format_exc()}"
        errors.append(error_msg)
        log.error(error_msg)
        raise

def update_mkdocs_nav(mkdocs_path: str, global_patterns: dict, errors: list, class_to_onts: dict, ontology_info: dict, input_file: str, local_classes: set, g: Graph, ns: str):
    """Update mkdocs.yml navigation with file > pattern > class or file > class structure."""
    try:
        with open(mkdocs_path, 'r', encoding="utf-8") as f:
            config = yaml.load(f, Loader=SafeMkDocsLoader)
    except Exception as e:
        error_msg = f"Error reading mkdocs.yml: {str(e)}\n{traceback.format_exc()}"
        errors.append(error_msg)
        log.error(error_msg)
        raise

    new_nav = [{"Home": "index.md", "Alphabetical Listing": "concept_registry.md"}]
    new_nav.extend(top_level_items)
    
    file_path = input_file
    ontology_name = ontology_info[file_path]["ontology_name"]
    # Find the "Terms" top-level collection (adjust IRI if needed)
    terms_coll_str = None
    for coll_str, gp in global_patterns.items():
        if gp["name"].lower() == "terms":  # or exact match: gp["name"] == "Terms"
            terms_coll_str = coll_str
            break

    if terms_coll_str:
        # Get direct members of "Terms" (sub-collections + classes)
        terms_gp = global_patterns[terms_coll_str]

        # Build the nav directly from Terms' children (skip showing "Terms")
        top_level_items = []

        # 1. Sub-collections of Terms
        for sub_coll_str in terms_gp.get("subcollections", []):
            if sub_coll_str in global_patterns:
                sub_gp = global_patterns[sub_coll_str]
                display_name = insert_spaces(sub_gp["name"])
                sub_nav = build_sub_nav(sub_coll_str, global_patterns, class_to_onts, ontology_name)
                if sub_nav:
                    top_level_items.append({display_name: sub_nav})

        # 2. Direct classes that are members of Terms (not in any sub-collection)
        direct_classes = []
        for cls_data in terms_gp.get("classes", []):
            cls_str, cls_name, ont, cls_order = cls_data
            # Only include classes that are not members of any sub-collection
            is_in_sub = False
            for sub_coll_str in terms_gp["subcollections"]:
                sub_gp = global_patterns.get(sub_coll_str, {})
                if any(c[0] == cls_str for c in sub_gp.get("classes", [])):
                    is_in_sub = True
                    break
            if not is_in_sub and not fauxClass(cls_name):
                direct_classes.append((cls_name, ont, cls_order))

        # Sort direct classes by order, then name
        direct_classes.sort(key=lambda x: (x[2], x[0].lower()))
        for cls_name, ont, _ in direct_classes:
            display_cls = insert_spaces(cls_name)
            top_level_items.append({display_cls: f"{get_filename(cls_name)}.md"})

        # Add all top-level items to nav
        new_nav.extend(top_level_items)
        config["nav"] = new_nav

    else:
        log.warning("Top-level 'Terms' collection not found – falling back to all patterns")    

    try:
        with open(mkdocs_path, 'w', encoding="utf-8") as f:
            yaml.safe_dump(config, f, sort_keys=False, allow_unicode=True)
    except Exception as e:
        error_msg = f"Error writing mkdocs.yml: {str(e)}\n{traceback.format_exc()}"
        errors.append(error_msg)
        log.error(error_msg)
        raise

def generate_index(docs_dir: str, input_file: str, ontology_info: dict, global_patterns: dict, errors: list, class_to_onts: dict):
    """Generate index.md file."""
    index_path = os.path.join(docs_dir, "index.md")
    index_content = ""

    file_path = input_file
    if file_path not in ontology_info:
        error_msg = f"Skipping index.md generation for {file_path} due to earlier processing failure"
        errors.append(error_msg)
        log.error(error_msg)
        return
    filename = os.path.basename(file_path)
    title = ontology_info[file_path]["title"]
    description = ontology_info[file_path]["description"]
    patterns = sorted(ontology_info[file_path]["patterns"], key=str.lower)
    non_pattern_classes = sorted(ontology_info[file_path]["non_pattern_classes"], key=str.lower)
    index_content += f"# {title}\n\n"
    if description:
        index_content += f"{description}\n\n"
    index_content += f"\nThe formal definition of the terms is available in [{os.path.splitext(filename)[1][1:].upper()} Syntax]({filename}).\n"

    # Write index.md
    try:
        with open(index_path, "w", encoding="utf-8") as f:
            f.write(index_content)
        log.info("Generated index.md at %s", index_path)
    except Exception as e:
        error_msg = f"Error writing index.md: {str(e)}\n{traceback.format_exc()}"
        errors.append(error_msg)
        log.error(error_msg)
        raise

def build_sub_nav(coll_str: str, global_patterns: dict, class_to_onts: dict, ontology_name: str) -> list:
    if coll_str not in global_patterns:
        return []
    gp = global_patterns[coll_str]
    sub_nav = []
    items = []
    for sub_coll in gp["subcollections"]:
        sub_gp = global_patterns.get(sub_coll, {})
        sub_order = sub_gp.get("order", 99999)
        items.append(("coll", sub_coll, sub_order))
    for cls_data in gp["classes"]:
        cls_str, cls_name, ont, cls_order = cls_data
        items.append(("cls", (cls_name, ont), cls_order))
    # Sort by order, then name
    items.sort(key=lambda x: (x[2], global_patterns[x[1]]["name"].lower() if x[0] == "coll" else x[1][0].lower()))
    for it_type, it_val, _ in items:
        if it_type == "coll":
            sub_coll_str = it_val
            sub_gp = global_patterns[sub_coll_str]
            display_pat = insert_spaces(sub_gp["name"])
            sub_sub_nav = build_sub_nav(sub_coll_str, global_patterns, class_to_onts, ontology_name)
            if sub_sub_nav:
                sub_nav.append({display_pat: sub_sub_nav})
        else:
            cls_name, ont = it_val
            display_mem = insert_spaces(cls_name)
            sub_nav.append({display_mem: f"{cls_name}.md"})
    return sub_nav