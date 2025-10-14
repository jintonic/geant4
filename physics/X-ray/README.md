[![Home](https://img.shields.io/badge/Home-blue?style=flat)](../..)
[![Physics](https://img.shields.io/badge/Physics-red?style=flat)](..)

## X-ray Creation

The characteristic X-ray creation by ionizing particles in a material is demonstrated in [fluorescence.mac](fluorescence.mac), where 5.5 MeV alpha rays are shot to a thin Al foil defined in [foil.tg](foil.tg).Minimal macro commands needed to create characteristic X-ray are:

```sh
$ PHYSLIST=LBE_LIV exampleApp
# /process/em/ only exists with radioactive decay being enabled
PreInit> /physics_lists/factory/addRadioactiveDecay
# PIXE must be used to enable the creation of characteristic X-rays
PreInit> /process/em/pixe true
# /run/initialize must be called after the physics setups above
PreInit> /run/initialize
```

For detailed tuning, please refer to Geant4 [node 1620][].

[node 1620]: https://geant4.web.cern.ch/node/1620
