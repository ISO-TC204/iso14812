[Home](../index.md) · [Vehicle Terms](groups/Vehicle Terms.md) · [Vehicle Automation Terms](patterns/Vehicle Automation Terms.md) · ADS-equipped vehicle

# ADS-equipped vehicle

<div class="draft4-watermark" aria-hidden="true"></div>

[vehicle](vehicle.md) integrated with an [ADS](ADS.md)

<object type="image/svg+xml" data="../../diagrams/ADS-equipped vehicle.dot.svg">
    <img alt="ADS-equipped vehicle Diagram" src="../../diagrams/ADS-equipped vehicle.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.7.3.15

Admitted term: AV

Admitted term: automated vehicle

Deprecated term: autonomous vehicle

Note 1 to entry: The term "autonomous vehicle" is also often used in a colloquial form and is even less well defined. The term is particularly problematic because the word "autonomous" has been used for a long time in the robotics and artificial intelligence research communities to signify [systems](system.md) that have the ability and authority to make decisions independently and self-sufficiently. Due to its imprecise and overly broad meaning, use of the term "autonomous vehicle" is discouraged.

Note 2 to entry: The terms "automated vehicle" and "AV" are often used in a colloquial form. However, these terms can be used to mean either an "ADS-equipped vehicle" or a "vehicle with an engaged ADS". The term "ADS-equipped vehicle" is preferred since it is more precise and descriptive in its meaning.

Note 3 to entry: This term can be, and when possible should be, refined by identifying the level of automation. For example, the terms "level 5 ADS-equipped vehicle" and "level 5 automated vehicle" should be interpreted as "ADS-equipped vehicle where the ADS is a [level 5 ADS](level 5 ADS.md)."

Note 4 to entry: This term only describes the capabilities of the vehicle, not its operational state. In other words, the term applies as long as the ADS is a component of the vehicle, independent of whether the [dynamic driving task](dynamic driving task.md) is actively engaged or not.

History note: Introduced in ISO/TS 14812:2022

## Specializations of ADS-equipped vehicle

| Class | Description |
| --- | --- |
| [ADS-dedicated vehicle](ADS-dedicated vehicle.md) | [ADS-equipped vehicle](ADS-equipped vehicle.md) designed for only driverless operation for complete trips |
| [dual-mode vehicle](dual-mode vehicle.md) | <driving automation> [ADS-equipped vehicle](ADS-equipped vehicle.md) designed for both driverless operation and operation by a conventional [driver](driver.md) for complete trips |

## Relationships for ADS-equipped vehicle

| Property | Constraint |
| --- | --- |
| comprises | some ads |
| subClassOf | vehicle |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+ADS-equipped+vehicle&page-title=ADS-equipped+vehicle&page-path=terms%2FADS-equipped+vehicle.md)

