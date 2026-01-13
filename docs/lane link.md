# lane link

link (3.3.5.5) that represents a lane (3.3.1.12) of a road link (3.3.5.6)

NOTE: A lane segment (3.3.5.10) can start or end at locations
            (3.4.1.1) other than the start or end of the corresponding road segment (3.3.5.8) (e.g.
            a lane can start mid-block).

<object type="image/svg+xml" data="../diagrams/lane link.dot.svg">
    <img alt="lane link Diagram" src="../diagrams/lane link.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for lane link

| Property | Constraint |
|----------|------------|
| constitutes | some laneSegment |
| subClassOf | link |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.3.5.9 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | lane link |

