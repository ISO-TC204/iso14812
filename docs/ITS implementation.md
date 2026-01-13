# ITS implementation

integration of each physical object (3.1.8.1) necessary to implement one or
            more ITS applications (3.2.8.1)

NOTE: An ITS application typically requires multiple components (e.g.
            an ITS-S acting as a user and another ITS-S acting as a provider). An ITS implementation
            includes a sample of each component necessary for the service but often does not
            represent a complete deployment.

<object type="image/svg+xml" data="../diagrams/ITS implementation.dot.svg">
    <img alt="ITS implementation Diagram" src="../diagrams/ITS implementation.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for ITS implementation

| Property | Constraint |
|----------|------------|
| implements | some itsApplication |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.2.8.5 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | ITS implementation |

