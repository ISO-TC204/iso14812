[Home](../index.md) · [User Terms](groups/User Terms.md) · [Vehicle Occupant Terms](patterns/Vehicle Occupant Terms.md) · driver

# driver

<div class="draft4-watermark" aria-hidden="true"></div>

[person](person.md) that is currently responsible for the [dynamic driving task](dynamic driving task.md) for the [vehicle](vehicle.md)

<object type="image/svg+xml" data="../../diagrams/driver.dot.svg">
    <img alt="driver Diagram" src="../../diagrams/driver.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.6.2.3

Note 1 to entry: The driver is typically on-board the vehicle but could be remote from the vehicle or automated logic.

History note: Introduced in ISO/TS 14812:2022

## Specializations of driver

| Class | Description |
| --- | --- |
| [in-vehicle driver](in-vehicle driver.md) | [driver](driver.md) that performs the [dynamic driving task](dynamic driving task.md) using the [vehicle's](vehicle.md) built-in [input devices](built-in vehicle input device.md) to control the longitudinal and lateral movement of the vehicle |
| [remote driver](remote driver.md) | [driver](driver.md) that performs the [dynamic driving task](dynamic driving task.md) without using the [vehicle's](vehicle.md) built-in [input devices](built-in vehicle input device.md) to control the longitudinal and lateral movement of the vehicle |

## Relationships for driver

| Property | Constraint |
| --- | --- |
| isA | some person |

## References to driver

| Referencing Term | Type of Reference |
| --- | --- |
| [in-vehicle driver](in-vehicle driver.md) | subClassOf |
| [remote driver](remote driver.md) | subClassOf |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+driver&page-title=driver&page-path=terms%2Fdriver.md)

