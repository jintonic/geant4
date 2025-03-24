# Torus

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/LHk_w4kchaU)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

A torus can be constructed using [C++][] or some [simple text](../..):

```cpp
:volu torus TORUS
 5 // inner r in mm
 10// outer r in mm
 25// swept radius
 60// phi0 in degree
 99// dphi in degree
 G4_WATER
```

The full source code is in [detector.tg][], which can be visualized using the macro file [mingle.mac][] or [gears.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/torus
# generate animated picture, torus.gif
G4VIS_DEFAULT_DRIVER=TSG_FILE gears gears.mac
```

![Figure of Torus](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/_images/aTorus.jpg)

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[detector.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/torus/detector.tg
[mingle.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/torus/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/torus/gears.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
