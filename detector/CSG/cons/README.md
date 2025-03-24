# Conical Section
[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/tKe92R8hP9c)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

A conical section can be constructed using [C++][] or some [simple text](../..):

```cpp
:volu cons CONS
 8  // inner r in mm @ - half z
 20 // outer r in mm @ - half z
 5  // inner r in mm @ half z
 10 // outer r in mm @ half z
 20 // half z in mm
 0  // phi0 in degree
 270// dphi in degree
 G4_Cu // material
```

The full source code is in [detector.tg][], which can be visualized using the macro file [mingle.mac][] or [gears.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/cons
# generate animated picture, cons.gif
G4VIS_DEFAULT_DRIVER=TSG_FILE gears gears.mac
```

![Figure of Cone Section](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/_images/aCons.jpg)

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[detector.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/cons/detector.tg
[mingle.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/cons/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/cons/gears.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
