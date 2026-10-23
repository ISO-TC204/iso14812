[Home](../index.md) · [Vehicle Terms](groups/Vehicle Terms.md) · [Vehicle Automation Terms](patterns/Vehicle Automation Terms.md) · driving automation system

# driving automation system

<div class="draft4-watermark" aria-hidden="true"></div>

hardware and software [system](system.md) that is able to perform part or all of the [dynamic driving task](dynamic driving task.md) on a sustained basis

<object type="image/svg+xml" data="../../diagrams/driving automation system.dot.svg">
    <img alt="driving automation system Diagram" src="../../diagrams/driving automation system.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.7.3.6

Note 1 to entry: A driving automation system includes any system capable of level 1-5 driving automation.

Note 2 to entry: Driving automation levels are defined in ISO/SAE 22736, which is also known as SAE J3016.

Note 3 to entry: Driving automation levels include [level 1 driving automation](level 1 driving automation.md), [level 2 driving automation](level 2 driving automation.md), [level 3 ADS](level 3 ADS.md), [level 4 ADS](level 4 ADS.md), and [level 5 ADS](level 5 ADS.md).

Note 4 to entry: In contrast to this generic term for any level 1-5 system, the specific term for a level 3-5 system is "Automated Driving System (ADS)." Given the similarity between the generic term, "driving automation system," and the level 3-5-specific term, "Automated Driving System," the latter term is intentionally capitalized when spelled out and reduced to its acronym, "ADS", as much as possible, while "driving automation system" should not be.

History note: Introduced in ISO/TS 14812:2022

## Specializations of driving automation system

| Class | Description |
| --- | --- |
| [ADS](ADS.md) | [driving automation system](driving automation system.md) that is able to perform the entire [dynamic driving task](dynamic driving task.md) on a sustained basis |
| [driver support system](driver support system.md) | [driving automation system](driving automation system.md) that is only able to perform part of the [dynamic driving task](dynamic driving task.md) |
| [level 1 driving automation](level 1 driving automation.md) | [driver support system](driver support system.md) that provides either sustained lateral or sustained longitudinal [vehicle](vehicle.md) motion control within a specific [operational design domain](operational design domain.md) with the expectation that a conventional [driver](driver.md) completes the [dynamic driving task](dynamic driving task.md) |
| [level 2 driving automation](level 2 driving automation.md) | [driver support system](driver support system.md) that provides sustained lateral and longitudinal [vehicle](vehicle.md) motion control within a specific [operational design domain](operational design domain.md) with the expectation that a conventional [driver](driver.md) completes the object and event detection and response |
| [level 3 ADS](level 3 ADS.md) | [ADS](ADS.md) designed with the expectation that the [fallback-ready user](fallback-ready user.md) is available to intervene |
| [level 4 ADS](level 4 ADS.md) | [ADS](ADS.md) that is capable of operating within a specific [operational design domain](operational design domain.md) and providing its own [fallback](fallback.md), without any expectation that a human [driver](driver.md) will respond to a request to intervene |
| [level 5 ADS](level 5 ADS.md) | [ADS](ADS.md) that is capable of unconditional (i.e. not [operational design domain](operational design domain.md)-specific) operation and providing its own [fallback](fallback.md), without any expectation that a human [driver](driver.md) will respond to a request to intervene |

## Relationships for driving automation system

| Property | Constraint |
| --- | --- |
| performsPartOrAllOf | some dynamicDrivingTask |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+driving+automation+system&page-title=driving+automation+system&page-path=terms%2Fdriving+automation+system.md)

