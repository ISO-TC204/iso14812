[Home](../index.md) · [Vehicle Terms](groups/Vehicle Terms.md) · [Vehicle Automation Terms](patterns/Vehicle Automation Terms.md) · level 5 ADS

# level 5 ADS

<div class="draft4-watermark" aria-hidden="true"></div>

[ADS](ADS.md) that is capable of unconditional (i.e. not [operational design domain](operational design domain.md)-specific) operation and providing its own [fallback](fallback.md), without any expectation that a human [driver](driver.md) will respond to a request to intervene

<object type="image/svg+xml" data="../../diagrams/level 5 ADS.dot.svg">
    <img alt="level 5 ADS Diagram" src="../../diagrams/level 5 ADS.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.7.3.13

Alternative preferred term: full driving automation

Alternative preferred term: level 5 Automated Driving System

Note 1 to entry: Other driving automation levels include [level 1 driving automation](level 1 driving automation.md), [level 2 driving automation](level 2 driving automation.md), [level 3 ADS](level 3 ADS.md), and [level 4 ADS](level 4 ADS.md).

History note: Introduced in ISO/TS 14812:2022

## Relationships for level 5 ADS

| Property | Constraint |
| --- | --- |
| operatesWithinA | some operationalDesignDomain |
| providesItsOwn | some fallback |
| subClassOf | ads |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+level+5+ADS&page-title=level+5+ADS&page-path=terms%2Flevel+5+ADS.md)

