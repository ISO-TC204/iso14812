[Home](../index.md) · [Service Terms](groups/Service Terms.md) · [Transport Service Terms](patterns/Transport Service Terms.md) · transport service

# transport service

<div class="draft4-watermark" aria-hidden="true"></div>

[service](service.md) that transports one or more [material entities](material entity.md) from one [spatial location](spatial location.md) to another

<object type="image/svg+xml" data="../../diagrams/transport service.dot.svg">
    <img alt="transport service Diagram" src="../../diagrams/transport service.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.5.2.1

Alternative preferred term: service

Note 1 to entry: The material entities transported can be people and/or goods.

History note: 2025: Revised to eliminate circular reference with transport need and to use "transport" rather than "deliver" to be more clear.

History note: Introduced in ISO/TS 14812:2022

## Specializations of transport service

| Class | Description |
| --- | --- |
| [bikesharing service](bikesharing service.md) | [shared vehicle service](shared vehicle service.md) that shares bicycles |
| [carsharing service](carsharing service.md) | [shared vehicle service](shared vehicle service.md) that shares [passenger](passenger.md) cars |
| [courier network service](courier network service.md) | [commercial](commercial.md), [peer-to-peer](peer-to-peer.md) [shared transport service](shared transport service.md) that transports goods |
| [public transport](public transport.md) | [transport service](transport service.md) that is publicly accessible enabling the movement of one or more [persons](person.md) |
| [rideshare service](rideshare service.md) | [cooperative](cooperative.md) [shared transport service](shared transport service.md) that transports [passengers](passenger.md) [concurrently](concurrent.md) |
| [ridesourced service](ridesourced service.md) | [commercial](commercial.md), [peer-to-peer](peer-to-peer.md) [shared transport service](shared transport service.md) that transports [passengers](passenger.md) |
| [ridesplit service](ridesplit service.md) | [ridesourced service](ridesourced service.md) that serves [passengers](passenger.md) [concurrently](concurrent.md) |
| [shared transport service](shared transport service.md) | [transport service](transport service.md) that relies upon the same [resources](resource.md) to fulfil the [transport user needs](transport user need.md) of multiple unrelated [transport users](transport user.md) and where the [transport provider](transport provider.md) has the primary responsibility for the operation of the transport mode |
| [shared vehicle service](shared vehicle service.md) | [transport service](transport service.md) that [sequentially](sequential.md) provides the same [vehicles](vehicle.md) to multiple unrelated [transport users](transport user.md) and where the transport user has the primary responsibility for the operation of the vehicle |
| [shuttle service](shuttle service.md) | [shared transport service](shared transport service.md) that transports [passengers](passenger.md) between two specified [spatial locations](spatial location.md) |
| [taxi service](taxi service.md) | [commercial](commercial.md) [shared transport service](shared transport service.md) that transports [passengers](passenger.md) [sequentially](sequential.md) |
| [taxi-share service](taxi-share service.md) | [commercial](commercial.md) [shared transport service](shared transport service.md) that transports [passengers](passenger.md) [concurrently](concurrent.md) |

## Relationships for transport service

| Property | Constraint |
| --- | --- |
| for | some transportUser |
| fulfils | some transportUserNeed |
| subClassOf | service |
| transports | some materialEntity |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+transport+service&page-title=transport+service&page-path=terms%2Ftransport+service.md)

