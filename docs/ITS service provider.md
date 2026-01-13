# ITS service provider

entity (3.1.1.1) that delivers one or more ITS services (3.5.3.1)

NOTE: Cooperative ITS (3.1.2.5) services often require multiple
            entities cooperatively working together to provide a unified service (3.5.1.1) where the
            individual entities are simultaneously ITS service providers and ITS users.

<object type="image/svg+xml" data="../diagrams/ITS service provider.dot.svg">
    <img alt="ITS service provider Diagram" src="../diagrams/ITS service provider.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for ITS service provider

| Property | Constraint |
|----------|------------|
| delivers | some itsService |
| subClassOf | serviceProvider |

## Other annotations

| Annotation | Value |
|------------|-------|
| altPrefLabel | service provider |
| clause | 3.5.3.2 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | ITS service provider |

