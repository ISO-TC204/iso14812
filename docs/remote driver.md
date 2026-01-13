# remote driver

driver (3.6.2.3) that performs the dynamic driving task (3.7.3.1) without
            using the vehicle's (3.7.1.1) built-in input devices (3.7.1.5) to control the
            longitudinal and lateral movement of the vehicle

NOTE: A remote driver can use a variety of physical input devices, but
            none that are built into the vehicle.

<object type="image/svg+xml" data="../diagrams/remote driver.dot.svg">
    <img alt="remote driver Diagram" src="../diagrams/remote driver.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for remote driver

| Property | Constraint |
|----------|------------|
| subClassOf | driver |
| uses | min 1 owl::Thing |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.6.2.5 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | remote driver |

