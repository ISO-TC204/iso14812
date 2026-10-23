[Home](../index.md) · [Service Terms](groups/Service Terms.md) · [Transport-related Sharing Terms](patterns/Transport-related Sharing Terms.md) · shared transport service

# shared transport service

<div class="draft4-watermark" aria-hidden="true"></div>

[transport service](transport service.md) that relies upon the same [resources](resource.md) to fulfil the [transport user needs](transport user need.md) of multiple unrelated [transport users](transport user.md) and where the [transport provider](transport provider.md) has the primary responsibility for the operation of the transport mode

<object type="image/svg+xml" data="../../diagrams/shared transport service.dot.svg">
    <img alt="shared transport service Diagram" src="../../diagrams/shared transport service.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.5.6.2

Note 1 to entry: A shared transport service might not be dependent upon a vehicle and/or could be multi-modal. For example, a letter courier service could rely on walking and [public transport](public transport.md).

Note 2 to entry: Responsibilities of the transport service can be further delegated to others. For example, a courier service relying on public transport would delegate the operation of the transport mode to the public transport operator.

History note: Introduced in ISO/TS 14812:2022

## Specializations of shared transport service

| Class | Description |
| --- | --- |
| [courier network service](courier network service.md) | [commercial](commercial.md), [peer-to-peer](peer-to-peer.md) [shared transport service](shared transport service.md) that transports goods |
| [rideshare service](rideshare service.md) | [cooperative](cooperative.md) [shared transport service](shared transport service.md) that transports [passengers](passenger.md) [concurrently](concurrent.md) |
| [ridesourced service](ridesourced service.md) | [commercial](commercial.md), [peer-to-peer](peer-to-peer.md) [shared transport service](shared transport service.md) that transports [passengers](passenger.md) |
| [ridesplit service](ridesplit service.md) | [ridesourced service](ridesourced service.md) that serves [passengers](passenger.md) [concurrently](concurrent.md) |
| [shuttle service](shuttle service.md) | [shared transport service](shared transport service.md) that transports [passengers](passenger.md) between two specified [spatial locations](spatial location.md) |
| [taxi service](taxi service.md) | [commercial](commercial.md) [shared transport service](shared transport service.md) that transports [passengers](passenger.md) [sequentially](sequential.md) |
| [taxi-share service](taxi-share service.md) | [commercial](commercial.md) [shared transport service](shared transport service.md) that transports [passengers](passenger.md) [concurrently](concurrent.md) |

## Relationships for shared transport service

| Property | Constraint |
| --- | --- |
| attrVehicleOperator | has transport provider |
| subClassOf | transportService |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+shared+transport+service&page-title=shared+transport+service&page-path=terms%2Fshared+transport+service.md)

