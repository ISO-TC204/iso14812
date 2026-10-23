[Home](../index.md) · [Infrastructure Terms](groups/Infrastructure Terms.md) · [Road Network Terms](patterns/Road Network Terms.md) · link

# link

<div class="draft4-watermark" aria-hidden="true"></div>

<road network> component of a [road model](road model.md) that represents a connection between two [nodes](node.md)

<object type="image/svg+xml" data="../../diagrams/link.dot.svg">
    <img alt="link Diagram" src="../../diagrams/link.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.3.5.5

Note 1 to entry: A link can be curvilinear and can have various attributes such as width.

History note: Introduced in ISO/TS 14812:2022

## Specializations of link

| Class | Description |
| --- | --- |
| [lane link](lane link.md) | [link](link.md) that represents a [lane](lane.md) of a [road link](road link.md) |
| [lane segment](lane segment.md) | [link](link.md) that represents a contiguous length of a [lane link](lane link.md) characterized by the same physical characteristics |
| [road link](road link.md) | [link](link.md) representing a contiguous length of a [road](road.md) between two [nodes](node.md) of operational or managerial significance |
| [road segment](road segment.md) | [link](link.md) that represents a contiguous length of a [road link](road link.md) characterized by the same physical characteristics |

## Relationships for link

| Property | Constraint |
| --- | --- |
| connects | exactly 2 owl::Thing |

## References to link

| Referencing Term | Type of Reference |
| --- | --- |
| [lane link](lane link.md) | subClassOf |
| [lane segment](lane segment.md) | subClassOf |
| [road link](road link.md) | subClassOf |
| [road segment](road segment.md) | subClassOf |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+link&page-title=link&page-path=terms%2Flink.md)

