# level 5 ADS

ADS (3.7.3.10) that is capable of unconditional (i.e. not ODD
            (3.7.3.2)-specific) operation and providing its own fallback (3.7.3.3), without any
            expectation that a human driver (3.6.2.3) will respond to a request to intervene

NOTE: Other driving automation levels include "level 1 driving
            automation" (3.7.3.8), "level 2 driving automation" (3.7.3.9), "level 3 ADS" (3.7.3.11)
            and "level 4 ADS" (3.7.3.12).

<object type="image/svg+xml" data="../diagrams/level 5 ADS.dot.svg">
    <img alt="level 5 ADS Diagram" src="../diagrams/level 5 ADS.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for level 5 ADS

| Property | Constraint |
|----------|------------|
| operatesWithinA | some operationalDesignDomain |
| providesItsOwn | some fallback |
| subClassOf | ads |

## Other annotations

| Annotation | Value |
|------------|-------|
| altPrefLabel | full driving automation |
| altPrefLabel | level 5 Automated Driving System |
| clause | 3.7.3.13 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | level 5 ADS |

