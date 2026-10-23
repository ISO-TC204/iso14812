[Home](../index.md) · [Core Terms](groups/Core Terms.md) · [General Architecture Terms](patterns/General Architecture Terms.md) · architecture viewpoint

# architecture viewpoint

<div class="draft4-watermark" aria-hidden="true"></div>

work product establishing the conventions for the construction, interpretation and use of [architecture views](architecture view.md) to frame specific system [concerns](concern.md)

<object type="image/svg+xml" data="../../diagrams/architecture viewpoint.dot.svg">
    <img alt="architecture viewpoint Diagram" src="../../diagrams/architecture viewpoint.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.1.3.6

Source: ISO/IEC/IEEE 42010:2011, 3.6

History note: Introduced in ISO/TS 14812:2022

## Specializations of architecture viewpoint

| Class | Description |
| --- | --- |
| [communications viewpoint](communications viewpoint.md) | [architecture viewpoint](architecture viewpoint.md) used to frame [concerns](concern.md) related to all layers of the Open Systems Interconnection (OSI) stack and related management and security issues |
| [enterprise viewpoint](enterprise viewpoint.md) | [architecture viewpoint](architecture viewpoint.md) used to frame the policies, funding incentives, working arrangements and jurisdictional structure that support the technical layers of the [architecture](architecture.md) |
| [functional viewpoint](functional viewpoint.md) | [architecture viewpoint](architecture viewpoint.md) used to frame [concerns](concern.md) related to the definition of [processes](process.md) that perform surface transport functions and [data flows](data flow.md) shared between these processes |
| [physical viewpoint](physical viewpoint.md) | [architecture viewpoint](architecture viewpoint.md) used to frame [concerns](concern.md) related to the assignment of functionality to [physical objects](physical object.md) and the interfaces among these physical objects |

## Relationships for architecture viewpoint

| Property | Constraint |
| --- | --- |
| aggregates | some modelKind |
| frames | some concern |
| governs | some architectureView |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+architecture+viewpoint&page-title=architecture+viewpoint&page-path=terms%2Farchitecture+viewpoint.md)

