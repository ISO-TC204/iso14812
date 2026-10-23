[Home](../index.md) · [Vehicle Terms](groups/Vehicle Terms.md) · [Vehicle Automation Terms](patterns/Vehicle Automation Terms.md) · driver support system

# driver support system

<div class="draft4-watermark" aria-hidden="true"></div>

[driving automation system](driving automation system.md) that is only able to perform part of the [dynamic driving task](dynamic driving task.md)

<object type="image/svg+xml" data="../../diagrams/driver support system.dot.svg">
    <img alt="driver support system Diagram" src="../../diagrams/driver support system.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.7.3.7

Note 1 to entry: Driver support systems include [level 1 driving automation](level 1 driving automation.md) and [level 2 driving automation](level 2 driving automation.md).

History note: Introduced in ISO/TS 14812:2022

## Specializations of driver support system

| Class | Description |
| --- | --- |
| [level 1 driving automation](level 1 driving automation.md) | [driver support system](driver support system.md) that provides either sustained lateral or sustained longitudinal [vehicle](vehicle.md) motion control within a specific [operational design domain](operational design domain.md) with the expectation that a conventional [driver](driver.md) completes the [dynamic driving task](dynamic driving task.md) |
| [level 2 driving automation](level 2 driving automation.md) | [driver support system](driver support system.md) that provides sustained lateral and longitudinal [vehicle](vehicle.md) motion control within a specific [operational design domain](operational design domain.md) with the expectation that a conventional [driver](driver.md) completes the object and event detection and response |

## Relationships for driver support system

| Property | Constraint |
| --- | --- |
| performsPartOf | some dynamicDrivingTask |
| subClassOf | drivingAutomationSystem |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+driver+support+system&page-title=driver+support+system&page-path=terms%2Fdriver+support+system.md)

