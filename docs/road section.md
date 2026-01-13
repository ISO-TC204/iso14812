# road section

aggregation of one or more road links (3.3.5.6) that represents a
            contiguous length of a road (3.3.5.1) that shares the same management and operational
            strategies

NOTE: Different road models (3.3.5.3) can divide the same road into
            different road sections.

EXAMPLE: 1 A traffic signal timing plan is applied to one road section.

<object type="image/svg+xml" data="../diagrams/road section.dot.svg">
    <img alt="road section Diagram" src="../diagrams/road section.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for road section

| Property | Constraint |
|----------|------------|
| aggregates | some roadLink |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.3.5.7 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | road section |

