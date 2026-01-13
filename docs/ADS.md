# ADS

driving automation system (3.7.3.6) that is able to perform the entire DDT
            (3.7.3.1) on a sustained basis

NOTE: The abbreviated form ("ADS") is the most preferred form and the
            alternative form ("Automated Driving System") uses initial capitals to avoid confusion
            with the more general "driving automation system".

<object type="image/svg+xml" data="../diagrams/ADS.dot.svg">
    <img alt="ADS Diagram" src="../diagrams/ADS.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for ADS

| Property | Constraint |
|----------|------------|
| canControl | some ads-equippedVehicle |
| performsAllOf | some dynamicDrivingTask |
| subClassOf | drivingAutomationSystem |

## Other annotations

| Annotation | Value |
|------------|-------|
| altPrefLabel | Automated Driving System |
| clause | 3.7.3.10 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | ADS |

