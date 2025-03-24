# Tube Section

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/zNh403G3dP0)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

A tube section can be constructed using [C++][] or some [simple text](../..):

```cpp
:volu tubs TUBS
 10 // inner r in mm
 15 // outer r in mm
 20 // half z in mm
 0  // phi0 in degree
 90 // dphi in degree
 G4_WATER // material
```

The full source code is in [detector.tg][], which can be visualized using the macro file [mingle.mac][] or [gears.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/tubs
# generate animated picture, tubs.gif
G4VIS_DEFAULT_DRIVER=TSG_FILE gears gears.mac
```
![Figure of tube](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/_images/aTubs.jpg)
[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[detector.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/tubs/detector.tg
[mingle.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/tubs/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/tubs/gears.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
