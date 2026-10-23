[Home](../index.md) · [Core Terms](groups/Core Terms.md) · [Architecture Physical View Terms](patterns/Architecture Physical View Terms.md) · physical object

# physical object

<div class="draft4-watermark" aria-hidden="true"></div>

<physical view> abstraction of a [material entity](material entity.md) that interacts with other abstract material entities in the provision of [ITS services](ITS service.md)

<object type="image/svg+xml" data="../../diagrams/physical object.dot.svg">
    <img alt="physical object Diagram" src="../../diagrams/physical object.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.1.8.1

Alternative preferred term: ITS physical object

Note 1 to entry: Physical objects are represented as [elements](element.md) within the [physical view](physical view.md) and perform a role. Physical objects can be implemented as cloud-based [systems](system.md).

Note 2 to entry: Within many ITS reference architectures (ITS reference architecture.md), physical objects are placed into one of five categories: centre, support, field, vehicle or [traveller](traveller.md).

History note: Introduced in ISO/TS 14812:2022

## Specializations of physical object

| Class | Description |
| --- | --- |
| [central system](central system.md) | [ITS component](ITS component.md) that provides application, management, and/or administrative functions from a centralized [location](location.md) [i.e. not at the [roadside](roadside.md)] |
| [connected vehicle roadside equipment](connected vehicle roadside equipment.md) | [ITS roadside equipment](ITS roadside equipment.md) that perform [ITS services](ITS service.md) by exchanging electronic [messages](message.md) with nearby [connected vehicles](connected vehicle.md) and/or [personal systems](personal system.md) via short-range wireless technologies |
| [cooperative ITS credentials management system](cooperative ITS credentials management system.md) | [support system](support system.md) that enables trusted communications among [ITS components](ITS component.md) and protects data from unauthorized access |
| [emergency management central system](emergency management central system.md) | [centre system](central system.md) that allows an [entity](entity.md) to manage and respond to crashes, events, disasters, evacuation orders and other incidents |
| [field support equipment](field support equipment.md) | portable [field system](field system.md) used by field personnel to locally troubleshoot, initialize, reprogram and test infrastructure equipment |
| [field system](field system.md) | infrastructure-based [ITS component](ITS component.md) located outside of a data centre that is designed to provide local processing or routing services while stationary |
| [fleet and freight management central system](fleet and freight management central system.md) | [centre system](central system.md) that allows a fleet or freight operator to manage and control its personnel, equipment and/or freight |
| [ITS component](ITS component.md) | [physical object](physical object.md) that has been assigned one or more [functional objects](functional object.md) in the provision of one or more [ITS services](ITS service.md) |
| [ITS on-board equipment](ITS on-board equipment.md) | [vehicle system](vehicle system.md) that provides all ITS functionality on-board the [vehicle](vehicle.md) |
| [ITS roadside equipment](ITS roadside equipment.md) | [field system](field system.md) that performs localized [ITS services](ITS service.md) |
| [maintenance and construction central management system](maintenance and construction central management system.md) | [centre system](central system.md) that allows an [entity](entity.md) to monitor and manage the construction and maintenance of [road](road.md) infrastructure |
| [map provision system](map provision system.md) | [support system](support system.md) that provides map databases used to support [ITS services](ITS service.md) |
| [nomadic device](nomadic device.md) | [personal information device](personal information device.md) that is taken with and can be accessed by the [traveller](traveller.md) during a journey |
| [nomadic vehicle device](nomadic vehicle device.md) | [personal system](personal system.md) consisting of global navigation satellite system (GNSS) and/or wireless [modules](module.md) that are connected to a [vehicle](vehicle.md) during a trip |
| [payment administration central system](payment administration central system.md) | [centre system](central system.md) that allows an [entity](entity.md) to manage financial transactions related to transportation, especially the electronic transfer of funds |
| [personal information device](personal information device.md) | [personal system](personal system.md) that enables personal access to [traveller](traveller.md) information |
| [personal system](personal system.md) | [ITS component](ITS component.md), other than a [vehicle system](vehicle system.md), that is used by a [person](person.md) in relation to a past, current or upcoming journey |
| [public information device](public information device.md) | [personal system](personal system.md) that provides public access to [traveller](traveller.md) information |
| [public transport central management system](public transport central management system.md) | [centre system](central system.md) that allows an [entity](entity.md) to manage the activities of a [public transport](public transport.md) agency |
| [support system](support system.md) | [ITS component](ITS component.md) that provides services in support of one or more other ITS components |
| [terminator](terminator.md) | [entity](entity.md) that is external to the [ITS service](ITS service.md) implementation but with which the implementation communicates either to obtain inputs or to which it can send outputs |
| [traffic management central system](traffic management central system.md) | [centre system](central system.md) that monitors and controls traffic and the [road network](road network.md) |
| [traffic regulation central system](traffic regulation central system.md) | [centre system](central system.md) that officially records traffic regulations in electronic form so that they can be distributed to other systems |
| [transport information central system](transport information central system.md) | [centre system](central system.md) that provides information of interest to the travelling public |
| [vehicle system](vehicle system.md) | [ITS component](ITS component.md) that is installed as a component of a [vehicle](vehicle.md) |

## Relationships for physical object

| Property | Constraint |
| --- | --- |
| subClassOf | resource |
| subClassOf | system |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+physical+object&page-title=physical+object&page-path=terms%2Fphysical+object.md)

