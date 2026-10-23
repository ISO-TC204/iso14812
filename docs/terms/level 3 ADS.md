[Home](../index.md) · [Vehicle Terms](groups/Vehicle Terms.md) · [Vehicle Automation Terms](patterns/Vehicle Automation Terms.md) · level 3 ADS

# level 3 ADS

<div class="draft4-watermark" aria-hidden="true"></div>

[ADS](ADS.md) designed with the expectation that the [fallback-ready user](fallback-ready user.md) is available to intervene

<object type="image/svg+xml" data="../../diagrams/level 3 ADS.dot.svg">
    <img alt="level 3 ADS Diagram" src="../../diagrams/level 3 ADS.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.7.3.11

Alternative preferred term: conditional driving automation

Alternative preferred term: level 3 Automated Driving System

Note 1 to entry: Level 3 ADSs are restricted to operating within a specific [operational design domain](operational design domain.md).

Note 2 to entry: Other driving automation levels include [level 1 driving automation](level 1 driving automation.md), [level 2 driving automation](level 2 driving automation.md), [level 4 ADS](level 4 ADS.md), and [level 5 ADS](level 5 ADS.md).

Note 3 to entry: The user can intervene due to an ADS-issued request, a [dynamic driving task](dynamic driving task.md) performance-relevant system failure, or other reasons.

History note: Introduced in ISO/TS 14812:2022

## Relationships for level 3 ADS

| Property | Constraint |
| --- | --- |
| designedWithExpectationOf | some fallback-readyUser |
| operatesWithinA | some operationalDesignDomain |
| subClassOf | ads |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+level+3+ADS&page-title=level+3+ADS&page-path=terms%2Flevel+3+ADS.md)

