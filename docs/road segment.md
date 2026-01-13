# road segment

link (3.3.5.5) that represents a contiguous length of a road link (3.3.5.6)
            characterized by the same physical characteristics

NOTE: The definition of road segments is highly dependent on which
            characteristics are modelled by the implementation. Characteristics that can result in a
            new road segment include addition or subtraction of a lane (3.3.1.12), a change in
            roadway (3.3.1.3) width, the change of road (3.3.5.1) type (e.g. start/end of a bridge),
            etc.

<object type="image/svg+xml" data="../diagrams/road segment.dot.svg">
    <img alt="road segment Diagram" src="../diagrams/road segment.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for road segment

| Property | Constraint |
|----------|------------|
| subClassOf | link |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.3.5.8 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | road segment |

