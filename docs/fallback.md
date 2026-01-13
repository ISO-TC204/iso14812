# fallback

<driving automation> response by a person (3.1.1.6) to perform the
            DDT (3.7.3.1) or by an ADS (3.7.3.10) to achieve a minimal risk condition when the
            response is triggered upon violation of the defined operational design domain (3.7.3.2)
            constraints or in response to a DDT performance-relevant driving automation system
            (3.7.3.6) failure

NOTE: This term includes the response of a person to perform the DDT
            in a manner to quickly achieve a minimal risk condition.

<object type="image/svg+xml" data="../diagrams/fallback.dot.svg">
    <img alt="fallback Diagram" src="../diagrams/fallback.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>## Formalization for fallback

| Property | Constraint |
|----------|------------|
| mayBeCausedBy | some ddtPerformance-relevantSystemFailure |
| mayBeCausedByAViolationOf | some operationalDesignDomain |

## Other annotations

| Annotation | Value |
|------------|-------|
| altPrefLabel | driving automation fallback |
| clause | 3.7.3.3 |
| skos::historyNote | Introduced in ISO/TS 14812:2022 |
| skos::prefLabel | fallback |

