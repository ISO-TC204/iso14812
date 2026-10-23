[Home](../index.md) · [Core Terms](groups/Core Terms.md) · [Data Concept Type Terms](patterns/Data Concept Type Terms.md) · data element

# data element

<div class="draft4-watermark" aria-hidden="true"></div>

unit of data that is considered in a given context to be indivisible and which includes an unambiguous representational form

<object type="image/svg+xml" data="../../diagrams/data element.dot.svg">
    <img alt="data element Diagram" src="../../diagrams/data element.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.1.11.1

Note 1 to entry: This definition states that a data element is "indivisible" in a given context. This means it is possible for a data element considered indivisible in one context [e.g. [location](location.md)] to be divisible in another context (e.g. latitude, longitude, and elevation).

History note: Introduced in ISO/TS 14812:2022

## Relationships for data element

| Property | Constraint |
| --- | --- |
| describes | exactly 1 owl::Thing |
| representedBy | exactly 1 owl::Thing |
| subClassOf | dataConcept |

## References to data element

| Referencing Term | Type of Reference |
| --- | --- |
| [message](message.md) | contains |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+data+element&page-title=data+element&page-path=terms%2Fdata+element.md)

