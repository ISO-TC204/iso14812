# ITS-S unit

instance (3.1.15.3) of an physical unit produced by an ITS station
            (3.2.7.3) implementation (3.1.15.2)

NOTE: This is a clarification of the definition provided in ISO
            21217:2020. While the definition for ITS station unit in ISO 21217:2020 refers to an
            implementation, the full text interchangeably describes it as an implementation or a
            physical instantiation, but does not define those terms explicitly.

<object type="image/svg+xml" data="../diagrams/ITS-S unit.dot.svg">
    <img alt="ITS-S unit Diagram" src="../diagrams/ITS-S unit.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for ITS-S unit

| Property | Constraint |
|----------|------------|
| comprises | some its-sCommunicationUnit |
| instantiationOf | some itsStation |

## Other annotations

| Annotation | Value |
|------------|-------|
| altPrefLabel | ITS station unit |
| altPrefLabel | ITS-SU |
| clause | 3.2.7.4 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | ITS-S unit |

