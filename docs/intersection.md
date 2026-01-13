# intersection

space where two or more roads (3.3.5.1) meet or cross

NOTE: Intersections can be associated with zero junctions (3.3.6.2),
            such as a motorway crossing a road without any connecting ramps, or can be associated
            with one or more junctions, such as a diamond interchange (3.3.6.9).

<object type="image/svg+xml" data="../diagrams/intersection.dot.svg">
    <img alt="intersection Diagram" src="../diagrams/intersection.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for intersection

| Property | Constraint |
|----------|------------|
| meetingOrCrossing | min 2 owl::Thing |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.3.6.1 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | intersection |

