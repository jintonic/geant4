# Tetrahedra

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/CvXa_OMxuRo)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

A tetrahedra can be constructed using [C++][] or some [simple text](../..):

```cpp
:volu tetrahedra TET
      0           0    sqrt(3) // x, y, z of anchor point
      0 2*sqrt(2/3) -1/sqrt(3) // x, y, z of point 2
 -sqrt(2) -sqrt(2/3 -1/sqrt(3) // x, y, z of point 3
  sqrt(2) -sqrt(2/3 -1/sqrt(3) // x, y, z of point 4
 G4_AIR                        // material
```

The full source code is in [detector.tg][], which can be visualized using the macro file [mingle.mac][] or [gears.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/tetrahedra
# generate animated picture, tetrahedra.gif
G4VIS_DEFAULT_DRIVER=TSG_FILE gears gears.mac
```

![Figure of Tetrahedra](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/_images/aTet.jpg)

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[detector.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/tetrahedra/detector.tg
[mingle.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/tetrahedra/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/tetrahedra/gears.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
