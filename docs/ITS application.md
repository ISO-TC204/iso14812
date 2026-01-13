# ITS application

requirements for an ITS service (3.5.3.1) that involves an association of
            two or more complementary ITS-S application processes (3.2.9.2)

NOTE: An ITS application can also involve associations with nodes that
            are not ITS stations.

<object type="image/svg+xml" data="../diagrams/ITS application.dot.svg">
    <img alt="ITS application Diagram" src="../diagrams/ITS application.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for ITS application

| Property | Constraint |
|----------|------------|
| involves | min 2 owl::Thing |
| realizationOf | some itsService |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.2.8.1 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | ITS application |

