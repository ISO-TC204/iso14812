# vehicle

material entity (3.1.1.3) designed to transport people or physical goods by
            changing its physical position

<object type="image/svg+xml" data="../diagrams/vehicle.dot.svg">
    <img alt="vehicle Diagram" src="../diagrams/vehicle.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for vehicle

| Property | Constraint |
|----------|------------|
| canBe | min 1 owl::Thing |
| ddtControlledBy | exactly 1 owl::Thing |
| has | min 0 owl::Thing |
| has | min 0 owl::Thing |
| has | some vehicleInputDevice |
| subClassOf | materialEntity |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.7.1.1 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | vehicle |

