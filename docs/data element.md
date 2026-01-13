# data element

unit of data that is considered in a given context to be indivisible and
            which includes an unambiguous representational form

NOTE: This definition states that a data element is "indivisible" in a
            given context. This means it is possible for a data element considered indivisible in
            one context [e.g. location (3.4.1.1)] to be divisible in another context (e.g. latitude,
            longitude, and elevation).

<object type="image/svg+xml" data="../diagrams/data element.dot.svg">
    <img alt="data element Diagram" src="../diagrams/data element.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for data element

| Property | Constraint |
|----------|------------|
| describes | exactly 1 owl::Thing |
| representedBy | exactly 1 owl::Thing |
| subClassOf | dataConcept |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.1.11.1 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | data element |

