# Polyhedra

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/edU0sQAOFy4)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

A polyhedra can be constructed using [C++][] or some [simple text](../..):

```cpp
:volu method1 POLYHEDRA
 0 270    // start phi, dphi in degree
 5 3      // # of sides, # of z planes
 -20 2 10 // z0, R0in, R0out,
   0 3 8  // z1, R1in, R1out,
  20 5 10 // ...
 G4_AIR   // material

:volu method2 POLYHEDRA
 0 270  // start phi, dphi in degree
 5 6    // # of sides, # of rz points
 2  -20 // r0, z0,
 10 -20 // r1, z1,
 8   0  // ...
 10  20
 5   20
 3   0
 G4_AIR // material
```

The full source code is in [detector.tg][], which can be visualized using the macro file [mingle.mac][] or [gears.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/polyhedra
# generate animated picture, polyhedra.gif
G4VIS_DEFAULT_DRIVER=TSG_FILE gears gears.mac
```

![Figure of Polyhedra](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/_images/aBREPSolidPolyhedra.jpg)

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[detector.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/polyhedra/detector.tg
[mingle.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/polyhedra/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/polyhedra/gears.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
