# Parallelepiped

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/_DobCTLtypE)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

A parallelepiped can be constructed using [C++][] or some [simple text](../..):

```cpp
:volu parallelepiped PARA
 30 // half x in mm
 40 // half y in mm
 60 // half z in mm
 10 // alpha in degrees
 30 // theta in degrees
 20 // phi in degrees
 G4_WATER // material
```

The full source code is in [detector.tg][], which can be visualized using the macro file [mingle.mac][] or [gears.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/para
# generate animated picture, para.gif
G4VIS_DEFAULT_DRIVER=TSG_FILE gears gears.mac
```

![Figure of Parallelepiped](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/_images/aPara.jpg)

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[detector.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/parallelepiped/detector.tg
[mingle.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/parallelepiped/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/parallelepiped/gears.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
