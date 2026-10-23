[Home](../index.md) · [Vehicle Terms](groups/Vehicle Terms.md) · [Vehicle Automation Terms](patterns/Vehicle Automation Terms.md) · ADS

# ADS

<div class="draft4-watermark" aria-hidden="true"></div>

[driving automation system](driving automation system.md) that is able to perform the entire [dynamic driving task](dynamic driving task.md) on a sustained basis

<object type="image/svg+xml" data="../../diagrams/ADS.dot.svg">
    <img alt="ADS Diagram" src="../../diagrams/ADS.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.7.3.10

Alternative preferred term: Automated Driving System

Note 1 to entry: The abbreviated form ("ADS") is the most preferred form and the alternative form ("Automated Driving System") uses initial capitals to avoid confusion with the more general "driving automation system".

History note: Introduced in ISO/TS 14812:2022

## Specializations of ADS

| Class | Description |
| --- | --- |
| [level 3 ADS](level 3 ADS.md) | [ADS](ADS.md) designed with the expectation that the [fallback-ready user](fallback-ready user.md) is available to intervene |
| [level 4 ADS](level 4 ADS.md) | [ADS](ADS.md) that is capable of operating within a specific [operational design domain](operational design domain.md) and providing its own [fallback](fallback.md), without any expectation that a human [driver](driver.md) will respond to a request to intervene |
| [level 5 ADS](level 5 ADS.md) | [ADS](ADS.md) that is capable of unconditional (i.e. not [operational design domain](operational design domain.md)-specific) operation and providing its own [fallback](fallback.md), without any expectation that a human [driver](driver.md) will respond to a request to intervene |

## Relationships for ADS

| Property | Constraint |
| --- | --- |
| canControl | some ads-equippedVehicle |
| performsAllOf | some dynamicDrivingTask |
| subClassOf | drivingAutomationSystem |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+ADS&page-title=ADS&page-path=terms%2FADS.md)

