# owl2mkdocs.py
import os
import sys
import logging
import traceback
from collections import defaultdict
from ontology_processor_owl import process_ontology
from diagram_generator import generate_diagram
from markdown_generator import generate_markdown, update_mkdocs_nav, generate_index
from utils import get_qname, get_label, is_abstract, get_id, fauxClass
from rdflib import Graph, RDF, XSD, URIRef, Literal
from rdflib.namespace import RDFS, OWL, SKOS

# -------------------- logging --------------------
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(filename)s:%(lineno)d - %(message)s")
log = logging.getLogger("owl2mkdocs")

def get_namespace_uri(uri: str) -> str:
    """Extract the namespace URI from a full URI."""
    if '#' in uri:
        return uri.rsplit('#', 1)[0] + '#'
    else:
        return uri.rsplit('/', 1)[0] + '/'

def main():
    log.info("Starting owl2mkdocs.py")
    # Check if script is called without arguments
    if len(sys.argv) != 1:
        print("Usage: python owl2mkdocs.py")
        sys.exit(1)

    # Check for mkdocs.yml in current directory
    root_dir = os.getcwd()
    mkdocs_path = os.path.join(root_dir, "mkdocs.yml")
    if not os.path.exists(mkdocs_path):
        print("Error: mkdocs.yml not found in current directory")
        sys.exit(1)

    # Check for docs directory
    docs_dir = os.path.join(root_dir, "docs")
    if not os.path.isdir(docs_dir):
        print("Error: docs directory not found")
        sys.exit(1)

    # Create classes directory if it doesn't exist
    classes_dir = os.path.join(docs_dir, "classes")
    if not os.path.exists(classes_dir):
        os.makedirs(classes_dir)
        log.info(f"Created classes directory: {classes_dir}")

    # Find all .owl files in docs directory (refined to also support .ttl if needed, but focused on .owl for now)
    owl_file = next((os.path.join(docs_dir, f) for f in os.listdir(docs_dir) if f.lower() == 'itsvocabulary.owl'), None)
    if owl_file is None:
        log.error("Error: itsVocabulary.owl not found in docs/")
        sys.exit(1)

    # Initialize global collections
    global_patterns = {}
    global_all_classes = set()
    abstract_map = {}
    ontology_info = {}
    errors = []
    processed_count = 0
    ns_to_ontology = {}
    class_to_onts = defaultdict(list)

    ontology_name = os.path.splitext(os.path.basename(owl_file))[0]
    log.info("########## Processing ontology file: %s", owl_file)
    # Initialize ontology_info for this file
    ontology_info[owl_file] = {
        "title": "Untitled Ontology",
        "description": "",
        "patterns": set(),
        "non_pattern_classes": set(),
        "ontology_name": ontology_name
    }
    try:
        # Process ontology (format auto-detected, but refined for TTL support)
        format = 'turtle' if owl_file.lower().endswith('.ttl') else 'xml'
        g, ns, prefix_map, classes, local_classes, prop_map = process_ontology(owl_file, errors, ontology_info[owl_file])
        if g is None:
            log.error("Error: No graph returned")
            sys.exit(1)
        ns_to_ontology[ns] = ontology_name
        # Update global collections
        for cls in classes:
            cls_qname = get_qname(g, cls, ns, prefix_map)
            abstract_map[cls_qname] = is_abstract(cls, g, ns)
            if cls_qname != 'ITSThing':
                global_all_classes.add(cls_qname)
            if ':' not in cls_qname:
                class_to_onts[cls_qname].append(ontology_name)
        # Collect patterns
        patterned_classes_set = set()
        for coll in g.subjects(RDF.type, SKOS.Collection):
            coll_str = str(coll)
            pattern_name = get_label(g, coll)
            order_lit = g.value(coll, URIRef(ns + "order"))
            order_val = int(str(order_lit)) if order_lit else 99999
            if coll_str not in global_patterns:
                global_patterns[coll_str] = {"name": pattern_name, "order": order_val, "subcollections": [], "classes": []}
            ontology_info[owl_file]["patterns"].add(pattern_name)
            for member in g.objects(coll, SKOS.member):
                mem_str = str(member)
                if (member, RDF.type, SKOS.Collection) in g:
                    global_patterns[coll_str]["subcollections"].append(mem_str)
                elif (member, RDF.type, OWL.Class) in g or (member, RDF.type, RDFS.Class) in g:
                    cls_name = get_label(g, member)
                    if cls_name == 'ITSThing':
                        continue
                    cls_order_lit = g.value(member, URIRef(ns + "order"))
                    cls_order = int(str(cls_order_lit)) if cls_order_lit else 99999
                    member_uri = str(member)
                    member_ns = get_namespace_uri(member_uri)
                    member_ont = ns_to_ontology.get(member_ns, ontology_name)
                    global_patterns[coll_str]["classes"].append((mem_str, cls_name, member_ont, cls_order))
                    if member in local_classes:
                        patterned_classes_set.add(cls_name)
        log.debug("Total patterns collected so far: %d, %s", len(global_patterns), global_patterns)
        for cls in local_classes:
            cls_name = get_label(g, cls)
            global_all_classes.add(cls_name)
            if cls_name == 'ITSThing' or fauxClass(cls_name):
                continue
            class_to_onts[cls_name].append(ontology_name)
            ontology_info[owl_file]["non_pattern_classes"] = {get_label(g, cls) for cls in local_classes if get_label(g, cls) not in patterned_classes_set and get_label(g, cls) != 'ITSThing'}
        # Process classes for diagrams and Markdown
        for cls in sorted(local_classes, key=lambda u: get_label(g, u).lower()):
            cls_name = get_label(g, cls)
            if cls_name == 'ITSThing' or fauxClass(cls_name):
                continue
            cls_id = get_id(cls_name)
            log.debug("Processing class: %s from %s", cls_name, owl_file)
            try:
                # Generate diagram (core to the strategy: convert to DOT for GraphViz rendering)
                generate_diagram(g, cls, cls_name, cls_id, ns, global_all_classes, abstract_map, owl_file, errors, prefix_map, ontology_name, ns_to_ontology)
                # Generate Markdown
                generate_markdown(g, cls, cls_name, global_patterns, global_all_classes, ns, owl_file, errors, prefix_map, prop_map, ontology_name, ns_to_ontology, class_to_onts)
                processed_count += 1
            except Exception as e:
                error_msg = f"Error processing class {cls_name} from {owl_file}: {str(e)}\n{traceback.format_exc()}"
                errors.append(error_msg)
                log.error(error_msg)
    except Exception as e:
        error_msg = f"Error processing ontology {owl_file}: {str(e)}\n{traceback.format_exc()}"
        errors.append(error_msg)
        log.error(error_msg)

    # Update mkdocs.yml navigation
    try:
        log.info("Total patterns for nav: %d", len(global_patterns))
        update_mkdocs_nav(mkdocs_path, global_patterns, errors, class_to_onts, ontology_info, owl_file, local_classes, g, ns)
    except Exception as e:
        error_msg = f"Error updating mkdocs.yml: {str(e)}\n{traceback.format_exc()}"
        errors.append(error_msg)
        log.error(error_msg)

    # Generate index.md
    try:
        generate_index(docs_dir, owl_file, ontology_info, global_patterns, errors, class_to_onts)
    except Exception as e:
        error_msg = f"Error generating index.md: {str(e)}\n{traceback.format_exc()}"
        errors.append(error_msg)
        log.error(error_msg)

    log.info("Total processed classes: %d", processed_count)
    if errors:
        log.error("Errors occurred:")
        for err in errors:
            log.error(err)

if __name__ == "__main__":
    main()