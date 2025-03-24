# Trapezoid with Rectangular Bases

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/LHk_w4kchaU)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

A trapezoid that has 2 rectangular bases on the top and bottom as shown in the right figure can be constructed using [C++][] or some [simple text](../..):

```cpp
:volu wedge TRD
 30 // half x in mm @-z/2
 10 // half x in mm @ z/2
 45 // half y in mm @-z/2
 15 // half y in mm @ z/2
 60 // half z in mm
 G4_Pb // material
```

The full source code is in [detector.tg][], which can be visualized using the macro file [mingle.mac][] or [gears.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/trd
# generate animated picture, trd.gif
G4VIS_DEFAULT_DRIVER=TSG_FILE gears gears.mac
```

![Figure of trapezoid](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/_images/aTrd.jpg)

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[detector.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/trd/detector.tg
[mingle.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/trd/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/trd/gears.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
