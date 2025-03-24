# Right Angular Wedge

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/LHk_w4kchaU)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

A right angular wedge can be constructed using [C++][] or some [simple text](../..):

```cpp
:volu wedge TRAP
 30 // half height along z in mm
 40 // half height of the base (along y) in mm
 50 // half length of the long side of the base in mm
 20 // half length of the short side of the base in mm
 G4_W // material
```

The full source code is in [detector.tg][], which can be visualized using the macro file [mingle.mac][] or [gears.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/trap4
# generate animated picture, trap4.gif
G4VIS_DEFAULT_DRIVER=TSG_FILE gears gears.mac
```

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[detector.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/trap4/detector.tg
[mingle.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/trap4/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/trap4/gears.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
