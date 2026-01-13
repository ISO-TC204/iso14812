# ITS station

bounded secured managed domain (3.2.7.1) that is able to meet requirements
            of the ITS trust domain (3.2.7.2) within which it is designed to participate

NOTE: The ITS station reference architecture is defined in ISO 21217.

<object type="image/svg+xml" data="../diagrams/ITS station.dot.svg">
    <img alt="ITS station Diagram" src="../diagrams/ITS station.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for ITS station

| Property | Constraint |
|----------|------------|
| describedBy | some its-sReferenceArchitecture |
| meetsRequirementsOf | some itsTrustDomain |
| subClassOf | boundedSecuredManagedDomain |

## Other annotations

| Annotation | Value |
|------------|-------|
| altPrefLabel | ITS-S |
| clause | 3.2.7.3 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | ITS station |

