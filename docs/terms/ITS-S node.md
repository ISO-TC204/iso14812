[Home](../index.md) · [Technology Terms](groups/Technology Terms.md) · [Its Station Terms](patterns/Its Station Terms.md) · ITS-S node

# ITS-S node

<div class="draft4-watermark" aria-hidden="true"></div>

node comprised of a set of functionalities in an [ITS-S unit](ITS-S unit.md) that is [connected](connected.md) to the [ITS station](ITS station.md)-internal network or comprises an entire ITS-S unit

<object type="image/svg+xml" data="../../diagrams/ITS-S node.dot.svg">
    <img alt="ITS-S node Diagram" src="../../diagrams/ITS-S node.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.2.7.8

History note: Introduced in ISO/TS 14812:2022

## Specializations of ITS-S node

| Class | Description |
| --- | --- |
| [ITS-S host](ITS-S host.md) | [ITS-S node](ITS-S node.md) comprised of [ITS-S](ITS station.md) functionalities other than the functionalities of an [ITS-S router](ITS-S router.md), ITS-S border router, ITS-S mobile router or an ITS-S gateway |
| [ITS-S router](ITS-S router.md) | [ITS-S node](ITS-S node.md) comprised of routing functionalities of an [ITS station unit](ITS-S unit.md) used to connect two networks and to forward packets not explicitly addressed to itself |

## Relationships for ITS-S node

| Property | Constraint |
| --- | --- |
| comprises | some functionality |
| containedIn | some its-sUnit |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+ITS-S+node&page-title=ITS-S+node&page-path=terms%2FITS-S+node.md)

