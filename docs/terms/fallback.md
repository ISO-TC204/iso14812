[Home](../index.md) · [Vehicle Terms](groups/Vehicle Terms.md) · [Vehicle Automation Terms](patterns/Vehicle Automation Terms.md) · fallback

# fallback

<div class="draft4-watermark" aria-hidden="true"></div>

<driving automation> response by a [person](person.md) to perform the [dynamic driving task](dynamic driving task.md) or by an [ADS](ADS.md) to achieve a minimal risk condition when the response is triggered upon violation of the defined [operational design domain](operational design domain.md) constraints or in response to a [dynamic driving task](dynamic driving task.md) performance-relevant [driving automation system](driving automation system.md) failure

<object type="image/svg+xml" data="../../diagrams/fallback.dot.svg">
    <img alt="fallback Diagram" src="../../diagrams/fallback.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.7.3.3

Alternative preferred term: driving automation fallback

Note 1 to entry: This term includes the response of a person to perform the DDT in a manner to quickly achieve a minimal risk condition.

History note: Introduced in ISO/TS 14812:2022

## Relationships for fallback

| Property | Constraint |
| --- | --- |
| mayBeCausedBy | some ddtPerformance-relevantSystemFailure |
| mayBeCausedByAViolationOf | some operationalDesignDomain |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+fallback&page-title=fallback&page-path=terms%2Ffallback.md)

