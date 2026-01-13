# road model

representation of a road network (3.3.5.2)

NOTE: Road models for different systems (3.1.2.1) will often define
            different models. For example, a public transport system (3.1.2.2) can define road links
            (3.3.5.6) based on the location (3.4.1.1) of bus stops while a traffic system can define
            road links based on the location of junctions (3.3.6.2).

<object type="image/svg+xml" data="../diagrams/road model.dot.svg">
    <img alt="road model Diagram" src="../diagrams/road model.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for road model

| Property | Constraint |
|----------|------------|
| constitutes | some node |
| constitutes | some link |
| represents | some roadNetwork |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.3.5.3 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | road model |

