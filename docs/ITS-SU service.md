# ITS-SU service

provision of functionality to fulfil an ITS-SU user need (3.5.4.4)

NOTE: An ITS-SU service refers to the services provided by
            realizations of ITS-S application processes while an ITS-S service refers to the
            communication services that these processes use to communicate to other nodes.

<object type="image/svg+xml" data="../diagrams/ITS-SU service.dot.svg">
    <img alt="ITS-SU service Diagram" src="../diagrams/ITS-SU service.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for ITS-SU service

| Property | Constraint |
|----------|------------|
| for | some its-suUser |
| fulfils | some its-suUserNeed |
| subClassOf | service |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.5.4.1 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | ITS-SU service |

