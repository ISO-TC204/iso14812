# carriageway

contiguous area of paved roadway (3.3.1.3) designed for the use of vehicles
            along a road segment (3.3.5.8)

NOTE: A carriageway is comprised of one or more traffic lanes
            (3.3.1.13) [i.e. the usable width (3.3.1.15)] and could include shoulders (3.3.1.18) and
            lay-bys (3.3.1.16).

<object type="image/svg+xml" data="../diagrams/carriageway.dot.svg">
    <img alt="carriageway Diagram" src="../diagrams/carriageway.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for carriageway

| Property | Constraint |
|----------|------------|
| comprises | min 0 owl::Thing |
| comprises | min 0 owl::Thing |
| comprises | min 0 owl::Thing |
| comprises | some usableWidth |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.3.1.5 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | carriageway |

