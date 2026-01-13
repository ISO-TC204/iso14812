# ITS-S reference architecture

reference architecture (3.1.9.1) for handling communications within a
            physical object (3.1.8.1) as defined in ISO 21217

NOTE: The ITS-S reference architecture provides a model for describing
            communication.

<object type="image/svg+xml" data="../diagrams/ITS-S reference architecture.dot.svg">
    <img alt="ITS-S reference architecture Diagram" src="../diagrams/ITS-S reference architecture.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for ITS-S reference architecture

| Property | Constraint |
|----------|------------|
| aggregates | some applicationEntity |
| aggregates | some its-sAccessLayer |
| aggregates | some transnetLayer |
| aggregates | some facilitiesLayer |
| aggregates | some managementEntity |
| aggregates | some securityEntity |
| subClassOf | referenceArchitecture |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.1.9.4 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | ITS-S reference architecture |

