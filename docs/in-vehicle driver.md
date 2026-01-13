# in-vehicle driver

driver (3.6.2.3) that performs the dynamic driving task (3.7.3.1) using the
            vehicle's (3.7.1.1) built-in input devices (3.7.1.5) to control the longitudinal and
            lateral movement of the vehicle

<object type="image/svg+xml" data="../diagrams/in-vehicle driver.dot.svg">
    <img alt="in-vehicle driver Diagram" src="../diagrams/in-vehicle driver.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for in-vehicle driver

| Property | Constraint |
|----------|------------|
| subClassOf | driver |
| uses | some built-inVehicleInputDevice |

## Other annotations

| Annotation | Value |
|------------|-------|
| altPrefLabel | conventional driver |
| clause | 3.6.2.4 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | in-vehicle driver |

