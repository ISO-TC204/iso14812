# transport service

service (3.5.1.1) that transports one or more material entities (3.1.1.3)
            from one location (3.4.1.1) to another

NOTE: The material entities transported can be people and/or goods.

<object type="image/svg+xml" data="../diagrams/transport service.dot.svg">
    <img alt="transport service Diagram" src="../diagrams/transport service.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for transport service

| Property | Constraint |
|----------|------------|
| for | some transportUser |
| fulfils | some transportUserNeed |
| subClassOf | service |
| transports | some materialEntity |

## Other annotations

| Annotation | Value |
|------------|-------|
| altPrefLabel | service |
| clause | 3.5.2.1 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | transport service |

