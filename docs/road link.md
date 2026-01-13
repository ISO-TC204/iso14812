# road link

link (3.3.5.5) representing a contiguous length of a road (3.3.5.1) between
            two nodes (3.3.5.4) of operational or managerial significance

NOTE: The operational characteristics of the nodes would relate to the
            type of road model (3.3.5.3). For example, a traffic system (3.1.2.1) can base its road
            links on nodes that represent junctions (3.3.6.2) and road terminators (3.1.8.3).

<object type="image/svg+xml" data="../diagrams/road link.dot.svg">
    <img alt="road link Diagram" src="../diagrams/road link.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for road link

| Property | Constraint |
|----------|------------|
| aggregates | some laneLink |
| constitutes | some roadSegment |
| subClassOf | link |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.3.5.6 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | road link |

