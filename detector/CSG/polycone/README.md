# Polycone

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/Df-n7fzkt7o)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

A polycone can be constructed using [C++][] or some [simple text](../..):

```cpp
:volu polycone POLYCONE
 90 270  // phi0, dphi in degrees
 3       // number of z planes
-2 3 3.5 // z1, r1inner, r1outer
 1 3 3.5 // z2, r2inner, r2outer
 2 4 4.5 // ...
 G4_Cu   // material
```

The full source code is in [detector.tg][], which can be visualized using the macro file [mingle.mac][] or [gears.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/polycone
# generate animated picture, polycone.gif
G4VIS_DEFAULT_DRIVER=TSG_FILE gears gears.mac
```

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[detector.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/polycone/detector.tg
[mingle.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/polycone/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/polycone/gears.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
