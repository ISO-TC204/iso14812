# data concept

data element (3.1.11.1), class (3.1.11.2), value domain (3.1.11.3), data
            frame (3.1.11.4), message (3.1.11.5) or interface dialogue (3.1.11.6) defined, at a
            minimum, with an unambiguous identifier and a definition

NOTE: In order to exchange a value corresponding to a data concept,
            more information than an identifier, a name and a definition can be needed. For a
            property, a data type is needed. Depending on the kind of property, other data elements
            such as unit of measure, and language, can be needed as well. The additional information
            can be given in the data dictionary (3.1.10.3), in a data specification that references
            the data concept or associated with the data themselves.

<object type="image/svg+xml" data="../diagrams/data concept.dot.svg">
    <img alt="data concept Diagram" src="../diagrams/data concept.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for data concept

| Property | Constraint |
|----------|------------|
| describes | some entity |
| storedIn | some dataDictionary |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.1.10.1 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | data concept |

