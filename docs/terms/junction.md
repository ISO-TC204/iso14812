[Home](../index.md) · [Infrastructure Terms](groups/Infrastructure Terms.md) · [Junction Terms](patterns/Junction Terms.md) · junction

# junction

<div class="draft4-watermark" aria-hidden="true"></div>

<object type="image/svg+xml" data="../../diagrams/junction.dot.svg">
    <img alt="junction Diagram" src="../../diagrams/junction.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.3.6.2

Admitted term: 

Admitted term: [intersection](intersection.md) that allows [travellers](traveller.md) to change [roads](road.md)

History note: Introduced in ISO/TS 14812:2022

## Specializations of junction

| Class | Description |
| --- | --- |
| [interchange](interchange.md) | [junction](junction.md) with at least one [grade separated manoeuvre](grade separated manoeuvre.md) |
| [junction at grade](junction at grade.md) | [junction](junction.md) without any [grade separated manoeuvres](grade separated manoeuvre.md) |

## Relationships for junction

| Property | Constraint |
| --- | --- |
| aggregates | some egressLane |
| aggregates | some ingressLane |
| subClassOf | intersection |

## References to junction

| Referencing Term | Type of Reference |
| --- | --- |
| [interchange](interchange.md) | subClassOf |
| [junction at grade](junction at grade.md) | subClassOf |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+junction&page-title=junction&page-path=terms%2Fjunction.md)

