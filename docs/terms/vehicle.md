[Home](../index.md) · [Vehicle Terms](groups/Vehicle Terms.md) · [Vehicle Component Terms](patterns/Vehicle Component Terms.md) · vehicle

# vehicle

<div class="draft4-watermark" aria-hidden="true"></div>

[material entity](material entity.md) designed to transport people or physical goods by changing its physical position

<object type="image/svg+xml" data="../../diagrams/vehicle.dot.svg">
    <img alt="vehicle Diagram" src="../../diagrams/vehicle.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.7.1.1

History note: Introduced in ISO/TS 14812:2022

## Specializations of vehicle

| Class | Description |
| --- | --- |
| [ADS-dedicated vehicle](ADS-dedicated vehicle.md) | [ADS-equipped vehicle](ADS-equipped vehicle.md) designed for only driverless operation for complete trips |
| [ADS-equipped vehicle](ADS-equipped vehicle.md) | [vehicle](vehicle.md) integrated with an [ADS](ADS.md) |
| [connected vehicle](connected vehicle.md) | [vehicle](vehicle.md) that is [connected](connected.md) using one or more communication media |
| [conventional vehicle](conventional vehicle.md) | <driving automation> [vehicle](vehicle.md) designed to be operated by a [person](person.md) during part or all of every trip. |
| [dual-mode vehicle](dual-mode vehicle.md) | <driving automation> [ADS-equipped vehicle](ADS-equipped vehicle.md) designed for both driverless operation and operation by a conventional [driver](driver.md) for complete trips |
| [high-speed vehicle](high-speed vehicle.md) | [vehicle](vehicle.md) with a [design speed](design speed.md) in the range of [high vehicle speeds](high vehicle speed.md) |
| [low-speed vehicle](low-speed vehicle.md) | [vehicle](vehicle.md) with a [design speed](design speed.md) in the range of [low vehicle speeds](low vehicle speed.md) |
| [moderate-speed vehicle](moderate-speed vehicle.md) | [vehicle](vehicle.md) with a [design speed](design speed.md) in the range of [moderate vehicle speeds](moderate vehicle speed.md) |
| [moderately high-speed vehicle](moderately high-speed vehicle.md) | [vehicle](vehicle.md) with a [design speed](design speed.md) in the range of [moderately-high vehicle speeds](moderately-high vehicle speed.md) |
| [moderately low-speed vehicle](moderately low-speed vehicle.md) | [vehicle](vehicle.md) with a [design speed](design speed.md) in the range of [moderately-low vehicle speeds](moderately-low vehicle speed.md) |
| [motor vehicle](motor vehicle.md) | [motorized](motorized vehicle.md) [road vehicle](road vehicle.md) allowed to operate in the same [driving spaces](driving space.md) as motorized [passenger](passenger.md) cars |
| [motor vehicle](motor vehicle.md) | [motorized](motorized vehicle.md) [road vehicle](road vehicle.md) allowed to operate in the same [driving spaces](driving space.md) as motorized [passenger](passenger.md) cars |
| [motorized vehicle](motorized vehicle.md) | self-propelled [vehicle](vehicle.md) |
| [non-road cycle](non-road cycle.md) | human-powered [vehicle](vehicle.md) not meeting the legal requirements to be driven in [cycle lanes](cycle lane.md) |
| [non-road vehicle](non-road vehicle.md) | [vehicle](vehicle.md) not meeting the legal requirements to be driven in [traffic lanes](traffic lane.md) or [cycle lanes](cycle lane.md) of a [road network](road network.md) |
| [road cycle](road cycle.md) | [vehicle](vehicle.md) meeting the legal requirements to operate in [cycle lanes](cycle lane.md) and [cycleways](cycleway.md) |
| [road vehicle](road vehicle.md) | [vehicle](vehicle.md) meeting the requirements to operate within the [driving space](driving space.md) of a [road](road.md) |
| [ultra-low-speed vehicle](ultra-low-speed vehicle.md) | [vehicle](vehicle.md) with a [design speed](design speed.md) that does not exceed [ultra-low vehicle speeds](ultra-low vehicle speed.md) |

## Relationships for vehicle

| Property | Constraint |
| --- | --- |
| attrPurpose | has transport ppl/goods |
| canBe | min 1 owl::Thing |
| ddtControlledBy | exactly 1 owl::Thing |
| has | some vehicleInputDevice |
| subClassOf | materialEntity |

## References to vehicle

| Referencing Term | Type of Reference |
| --- | --- |
| [ADS-equipped vehicle](ADS-equipped vehicle.md) | subClassOf |
| [anonymized vehicle reference](anonymized vehicle reference.md) | encodedReferenceFor |
| [connected vehicle](connected vehicle.md) | subClassOf |
| [conventional vehicle](conventional vehicle.md) | subClassOf |
| [design speed](design speed.md) | maximumSustainedSpeedOf |
| [gross vehicle mass](gross vehicle mass.md) | operatingMassOf |
| [gross vehicle mass rating](gross vehicle mass rating.md) | maxOperatingWeightFor |
| [high-speed vehicle](high-speed vehicle.md) | subClassOf |
| [low-speed vehicle](low-speed vehicle.md) | subClassOf |
| [moderate-speed vehicle](moderate-speed vehicle.md) | subClassOf |
| [moderately high-speed vehicle](moderately high-speed vehicle.md) | subClassOf |
| [moderately low-speed vehicle](moderately low-speed vehicle.md) | subClassOf |
| [motorized vehicle](motorized vehicle.md) | subClassOf |
| [non-road cycle](non-road cycle.md) | subClassOf |
| [non-road vehicle](non-road vehicle.md) | subClassOf |
| [parking space](parking space.md) | store |
| [road cycle](road cycle.md) | subClassOf |
| [road vehicle](road vehicle.md) | subClassOf |
| [ultra-low-speed vehicle](ultra-low-speed vehicle.md) | subClassOf |
| [vehicle equipment](vehicle equipment.md) | inUseOrOnBoard |
| [vehicle fuel type](vehicle fuel type.md) | fuelUsedBy |
| [vehicle identifier](vehicle identifier.md) | globallyUniqueIdentifierFor |
| [vehicle load type](vehicle load type.md) | loadCarriedBy |
| [vehicle registration plate identifier](vehicle registration plate identifier.md) | identifierUniqueWithinRegionFor |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+vehicle&page-title=vehicle&page-path=terms%2Fvehicle.md)

