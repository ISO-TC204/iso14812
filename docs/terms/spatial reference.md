[Home](../index.md) · [Location Terms](groups/Location Terms.md) · [Location Referencing Terms](patterns/Location Referencing Terms.md) · spatial reference

# spatial reference

<div class="draft4-watermark" aria-hidden="true"></div>

description of a [spatial location](spatial location.md) in the real world according to a defined reference system

<object type="image/svg+xml" data="../../diagrams/spatial reference.dot.svg">
    <img alt="spatial reference Diagram" src="../../diagrams/spatial reference.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.4.2.2

Alternative preferred term: ITS spatial reference

Admitted term: location reference

EXAMPLE: Coordinate tuple: 51.476852, -0.000500.

Note 1 to entry: It is not necessary for the rules be formal coordinates but they could be descriptive.

Note 2 to entry: The term "location reference" has been used within ITS, but the term "spatial reference" is preferred to better align with the activities of ISO/TC 211.

History note: Introduced in ISO/TS 14812:2022

## Specializations of spatial reference

| Class | Description |
| --- | --- |
| [dynamic spatial reference](dynamic spatial reference.md) | [spatial reference](spatial reference.md) generated on-the-fly based on geographic properties in a digital map database |
| [link location](link location.md) | [pre-coded spatial reference](pre-coded spatial reference.md) defined within the [road network](road network.md) database |
| [pre-coded spatial reference](pre-coded spatial reference.md) | [spatial reference](spatial reference.md) using a unique identifier that is agreed upon in both the sender and receiver [system](system.md) to select a [location](location.md) from a set of pre-coded locations |

## Relationships for spatial reference

| Property | Constraint |
| --- | --- |
| specificationOf | some spatialLocation |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+spatial+reference&page-title=spatial+reference&page-path=terms%2Fspatial+reference.md)

