# connected vehicle roadside equipment

ITS roadside equipment (3.2.3.2) that perform ITS services (3.5.3.1) by
            exchanging electronic messages (3.1.11.5) with nearby connected vehicles (3.2.3.7) and/or
            personal systems (3.2.1.3) via short-range wireless technologies

NOTE: Connected roadside equipment typically provides ITS-related
            functionality but the term includes roadside equipment that only provide the ITS service
            of routing for short-range wireless technologies.

<object type="image/svg+xml" data="../diagrams/connected vehicle roadside equipment.dot.svg">
    <img alt="connected vehicle roadside equipment Diagram" src="../diagrams/connected vehicle roadside equipment.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for connected vehicle roadside equipment

| Property | Constraint |
|----------|------------|
| aggregates | min 0 owl::Thing |
| subClassOf | itsRoadsideEquipment |

## Other annotations

| Annotation | Value |
|------------|-------|
| altPrefLabel | CV-RSE |
| clause | 3.2.3.3 |
| skos::historyNote | Introduced in ISO/TS 14812:2022. Revised in 2025 to 1. add "vehicle" to term 
            (i.e., from connected roadside equipment to connected vehicle roadside equipment), 2.  
            Replace "ITS connected roadside equipment" and "RSE" with "CV-RSE", and 3. change 
            reference to "vehicle systems" to "connected vehicles".  |
| skos::prefLabel | connected vehicle roadside equipment |

