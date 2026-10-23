[Home](../index.md) · [Service Terms](groups/Service Terms.md) · [Transport-related Sharing Terms](patterns/Transport-related Sharing Terms.md) · shared vehicle service

# shared vehicle service

<div class="draft4-watermark" aria-hidden="true"></div>

[transport service](transport service.md) that [sequentially](sequential.md) provides the same [vehicles](vehicle.md) to multiple unrelated [transport users](transport user.md) and where the transport user has the primary responsibility for the operation of the vehicle

<object type="image/svg+xml" data="../../diagrams/shared vehicle service.dot.svg">
    <img alt="shared vehicle service Diagram" src="../../diagrams/shared vehicle service.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.5.6.3

Note 1 to entry: As there should only be one operator of a vehicle at any time, a shared vehicle service should use a sequential operational model.

Note 2 to entry: This term can be specialized by replacing "vehicle" with any defined vehicle type (e.g. "automated vehicle sharing").

History note: Introduced in ISO/TS 14812:2022

## Specializations of shared vehicle service

| Class | Description |
| --- | --- |
| [bikesharing service](bikesharing service.md) | [shared vehicle service](shared vehicle service.md) that shares bicycles |
| [carsharing service](carsharing service.md) | [shared vehicle service](shared vehicle service.md) that shares [passenger](passenger.md) cars |

## Relationships for shared vehicle service

| Property | Constraint |
| --- | --- |
| attrOperationalModel | has sequential |
| attrVehicleOperator | has transport consumer |
| subClassOf | transportService |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+shared+vehicle+service&page-title=shared+vehicle+service&page-path=terms%2Fshared+vehicle+service.md)

