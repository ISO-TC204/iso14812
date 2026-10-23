[Home](../index.md) · [Service Terms](groups/Service Terms.md) · [Operational Model Terms](patterns/Operational Model Terms.md) · concurrent

# concurrent

<div class="draft4-watermark" aria-hidden="true"></div>

[operational model](operational model.md) where [services](service.md) can be provided to multiple [users](user.md) at any one time

<object type="image/svg+xml" data="../../diagrams/concurrent.dot.svg">
    <img alt="concurrent Diagram" src="../../diagrams/concurrent.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.5.9.3

History note: Introduced in ISO/TS 14812:2022

## Specializations of concurrent

| Class | Description |
| --- | --- |
| [dynamic route](dynamic route.md) | <transport service> [concurrent](concurrent.md) operation where transported items can only be received or delivered at stopping points within a pre-defined [service](service.md) corridor |
| [fixed route](fixed route.md) | <transport service> [concurrent](concurrent.md) operation where transported items can only be received or delivered at stopping points contained in a pre-defined sequence |
| [paired on-demand](paired on-demand.md) | <transport service> [concurrent](concurrent.md) operation where the [transport provider](transport provider.md) may choose to divert from its path to service a new request from another [transport users](transport user.md) while servicing an earlier transport user |

## Relationships for concurrent

| Property | Constraint |
| --- | --- |
| subClassOf | operationalModel |

## References to concurrent

| Referencing Term | Type of Reference |
| --- | --- |
| [dynamic route](dynamic route.md) | subClassOf |
| [fixed route](fixed route.md) | subClassOf |
| [paired on-demand](paired on-demand.md) | subClassOf |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+concurrent&page-title=concurrent&page-path=terms%2Fconcurrent.md)

