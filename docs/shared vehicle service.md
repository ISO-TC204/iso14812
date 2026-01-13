# shared vehicle service

transport service (3.5.2.1) that sequentially (3.5.9.2) provides the same
            vehicles (3.7.1.1) to multiple unrelated transport users (3.5.2.3) and where the
            transport user has the primary responsibility for the operation of the vehicle

NOTE: As there should only be one operator of a vehicle at any time, a
            shared vehicle service should use a sequential operational model.

<object type="image/svg+xml" data="../diagrams/shared vehicle service.dot.svg">
    <img alt="shared vehicle service Diagram" src="../diagrams/shared vehicle service.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for shared vehicle service

| Property | Constraint |
|----------|------------|
| subClassOf | transportService |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.5.6.3 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | shared vehicle service |

