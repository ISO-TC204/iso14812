# physical view

architecture view (3.1.3.7) from the physical viewpoint (3.1.4.8)

NOTE: The term "deployment view" is sometimes used within the broader
            ICT community, but the term "physical view" is preferred to prevent confusion between
            the physical view of a reference architecture and any part of a deployment architecture
            (3.1.9.3).

<object type="image/svg+xml" data="../diagrams/physical view.dot.svg">
    <img alt="physical view Diagram" src="../diagrams/physical view.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for physical view

| Property | Constraint |
|----------|------------|
| aggregates | some physicalObject |
| aggregates | some informationTransfer |
| aggregates | some functionalObject |
| subClassOf | architectureView |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.1.4.7 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | physical view |

