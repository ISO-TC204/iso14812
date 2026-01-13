# ITS-S application process

information manipulation within an ITS station (3.2.7.3) for an ITS-SU
            service (3.5.4.1)

NOTE: ITS-S application processes use ITS-S services to communicate
            with other nodes.

<object type="image/svg+xml" data="../diagrams/ITS-S application process.dot.svg">
    <img alt="ITS-S application process Diagram" src="../diagrams/ITS-S application process.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for ITS-S application process

| Property | Constraint |
|----------|------------|
| elementIn | some itsStation |
| performsInformationProcessingFor | some its-sService |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.2.9.2 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | ITS-S application process |

