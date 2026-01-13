# information transfer

information flow (3.1.8.4) from a physical object (3.1.8.1) acting as an
            information provider and sent to another physical object acting as an information
            consumer

NOTE: The term "information flow triple" is used extensively in the
            Architecture Reference for Cooperative and Intelligent Transportation (ARC-IT; see
            Reference [25]).

<object type="image/svg+xml" data="../diagrams/information transfer.dot.svg">
    <img alt="information transfer Diagram" src="../diagrams/information transfer.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for information transfer

| Property | Constraint |
|----------|------------|
| contentsOf | some informationFlow |
| sentFrom | some physicalObject |
| sentTo | some physicalObject |

## Other annotations

| Annotation | Value |
|------------|-------|
| clause | 3.1.8.5 |
| skos::altLabel | information flow triple |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | information transfer |

