# geographic identifier

spatial reference (3.4.2.2) in the form of a label or code that identifies
            a location (3.4.1.1)

NOTE: The term "location code" has been used previously in ISO/TC 204
            documents, but "geographic identifier" is preferred to better align with the activities
            of ISO/TC 211.

EXAMPLE: "Spain" is an example of a label (country name); "SW1P 3AD" is an
            example of a code (postcode).

<object type="image/svg+xml" data="../diagrams/geographic identifier.dot.svg">
    <img alt="geographic identifier Diagram" src="../diagrams/geographic identifier.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for geographic identifier

| Property | Constraint |
|----------|------------|
| referenceUsedBy | some spatialReference |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.4.2.6 |
| dcterms::source | ISO 19112:2019, 3.1.2, modified - Note 1 to entry and deprecated
            term added. |
| skos::hiddenLabel | location code |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | geographic identifier |

