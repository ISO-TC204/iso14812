[Home](../index.md) · [Technology Terms](groups/Technology Terms.md) · [Its Station Terms](patterns/Its Station Terms.md) · ITS station

# ITS station

functional entity that is bounded, secured, and managed; certified by an ITS trust domain; and comprised of an ITS-S facilities layer, ITS-S networking & transport layer, ITS-S access layer, ITS-S management entity, ITS-S security entity and ITS-S application entity providing ITS services

<object type="image/svg+xml" data="../../diagrams/ITS station.dot.svg">
    <img alt="ITS station Diagram" src="../../diagrams/ITS station.dot.png" /> <!-- Fallback for non-SVG browsers -->
</object>

Clause: 3.2.7.3

Alternative preferred term: ITS-S

Note 1 to entry: The ITS station reference architecture is defined in ISO 21217.

Note 2 to entry: This complements the ISO 21217:2020 definition (which identifies the component parts) and is consistent with the text of ISO 21217:2020.

History note: 2026: Reintroduced "functional entity" and the contained elements to better align with original intent while retaining the reference to the bounded secured managed concepts and the reference to the ITS trust domain.

History note: 2022: Introduced in ISO/TS 14812:2022. Revised to "bounded secured managed domain that is able to meet requirements of the [ITS trust domain](ITS trust domain.md) within which it wishes to participate" to remove reference to abstract concepts and circular references.

History note: 2014: revised to "functional entity comprised of an ITS-S facilities layer, ITS-S networking & transport layer, ITS-S access layer, ITS-S management entity, ITS-S security entity and ITS-S applications entity providing ITS services".

History note: 2010: Introduced in ISO 21217:2010 as "entity in a communication network, comprised of application, facilities, networking and access layer components specified in this International Standard that operate within a bounded secure management domain".

## Relationships for ITS station

| Property | Constraint |
| --- | --- |
| describedBy | some its-sReferenceArchitecture |
| meetsRequirementsOf | some itsTrustDomain |
| subClassOf | boundedSecuredManagedDomain |


---

[Comment on this page](https://github.com/ISO-TC204/iso14812/issues/new?template=page-feedback.yml&title=%5BPage+feedback%5D+ITS+station&page-title=ITS+station&page-path=terms%2FITS+station.md)

