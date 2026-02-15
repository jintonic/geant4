[![Home](https://img.shields.io/badge/Home-/-blue?style=flat)](../..)
[![Visualization](https://img.shields.io/badge/Visualization-/-orange?style=flat)](..)

# HepRepFile

> **Note:** The [HepRepFile][] visualization driver has been removed from Geant4 since version 11.4.0. I keep its source code from Geant4 11.3.2 [here][] and include the compiled shared library `libG4HepRepFile.so` in docker images [physino/geant4](https://hub.docker.com/r/physino/geant4) for Geant4 11.4.0 and newer versions. For Geant4 11.3.2 and older versions, you can use the driver directly from the Geant4 installation.

The [HepRepFile][] visualization driver is used to generate `G4Data*.heprep` files, which can be viewed using an external program called [HepRApp](app) in wireframe mode, that is, no surface, only outlines, which sounds primitive, but is one of the best ways to troubleshoot a complicated geometry.

<iframe width="640" height="360" src="https://www.youtube.com/embed/UEM4X8Pdse8?si=Z927ydc0g6Pxn8qg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Preparing Geometry for HepRApp

The following code snippet shows how to prepare your detector geometry written in [simple text] for [HepRApp](app).

```cpp
:volu hall BOX 1*m 1*m 1*m G4_AIR
// without specifying color, HepRepFile won't show the volume, but Qt will
:color hall 0.8 0.9 0.1
// use the following to disable visualization in all drivers, w/o color
:vis hall OFF
```

The following Geant4 [macro](../../run/macro) can be used to add a 3D coordinate system in [HepRApp](app).

```sh
# This command add x,y,z axes (right-handed system) in HepRepFile
# HepRApp Data Browser shows an axis as a hexagonal stick + a tetrahedra arrow
# By default, x is shown in red, y in green, z in blue
/vis/scene/add/axes
```

[HepRepFile]: http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Visualization/visdrivers.html#heprepfile
[here]: https://github.com/jintonic/geant4/tree/main/vis/HepRepFile/lib
[simple text]: ../../detector

