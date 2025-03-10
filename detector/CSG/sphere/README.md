# Sphere

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/XMJQ0hi3E7A)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

A sphere can be constructed using [C++][] or some [simple text](../..):

```cpp
:volu sphere SPHERE
 20 // inner r in mm
 40 // outer r in mm
 70 // phi0 in degree
 80 // dphi in degree
 30 // theta0 in degree
 90 // dtheta in degree
 G4_WATER
```

The full source code is in [detector.tg][], which can be visualized using the macro file [mingle.mac][] or [gears.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/sphere
# generate animated picture, sphere.gif
G4VIS_DEFAULT_DRIVER=TSG_FILE gears gears.mac
```

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[detector.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/sphere/detector.tg
[mingle.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/sphere/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/sphere/gears.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
