# gazetteer

register of spatial references (3.4.2.2) of one or more location (3.4.1.1)
            sub-types containing some information regarding position

NOTE: The positional information need not be coordinates but could be
            descriptive.

<object type="image/svg+xml" data="../diagrams/gazetteer.dot.svg">
    <img alt="gazetteer Diagram" src="../diagrams/gazetteer.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for gazetteer

| Property | Constraint |
|----------|------------|
| aggregates | some spatialReference |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.4.2.7 |
| dcterms::source | ISO 19112:2019, 3.1.1, modified - "register of location
            instances..." changed to "register of spatial references..." in order to fit the
            relevant concept model. |
| skos::altLabel | location table |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | gazetteer |

