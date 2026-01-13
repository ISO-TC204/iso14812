# ITS component

physical object (3.1.8.1) that has been assigned one or more functional
            objects (3.1.8.6) in the provision of one or more ITS services (3.5.3.1)

NOTE: Physical objects are ITS components if they are an integral part
            of the system (3.1.2.1); otherwise they are terminators (3.1.8.3).

<object type="image/svg+xml" data="../diagrams/ITS component.dot.svg">
    <img alt="ITS component Diagram" src="../diagrams/ITS component.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for ITS component

| Property | Constraint |
|----------|------------|
| aggregates | some functionalObject |
| subClassOf | physicalObject |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.1.8.2 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | ITS component |

