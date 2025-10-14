[![Home](https://img.shields.io/badge/Home-blue?style=flat)](../..)
[![Physics](https://img.shields.io/badge/Physics-red?style=flat)](..)

# Neutron Interactions

Neutrons interact with matter mainly through the following processes:

- [Neutron capture][] (Geant4 name: **nCapture**)
- [Elastic scattering][] (Geant4 name: **hadElastic**): 4111)
- [Inelastic scattering][] (Geant4 name: **neutronInelastic**)
- Neutron induced [Fission][] (Geant4 name: **nFission**)

[Neutron capture]: https://www.glossary.oilfield.slb.com/en/Terms/n/neutron_capture.aspx
[Elastic scattering]: https://www.glossary.oilfield.slb.com/en/Terms/e/elastic_neutron_scattering.aspx
[Inelastic scattering]: https://www.glossary.oilfield.slb.com/en/Terms/i/inelastic_neutron_scattering.aspx
[Fission]: https://en.wikipedia.org/wiki/Nuclear_fission

### Gd(n,gamma)

The default HP (high precision) neutron model used in Geant4 does not handle Gd(n,gamma) correctly. This is described in detail in <https://indico.cern.ch/event/746466/contributions/3345714/>. An alternative model is called photon evaporation, which can be activated by setting up an environment variable:

```sh
export G4NEUTRONHP_USE_ONLY_PHOTONEVAPORATION=1
```

(Note that this will be replaced by a macro command in Geant4 version 11). The dataset used by this model is

```sh
export G4LEVELGAMMADATA=/path/to/Geant4/installtion/folder/share/Geant4-??.?.?/data/PhotonEvaporation?.?
```

As for Geant4.10.7, the simulated gamma-ray spectrum is not satisfactory compared to data described in <https://academic.oup.com/ptep/article/2020/4/043D02/5819518>.

