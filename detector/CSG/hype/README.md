# Tube with Hyperbolic Profile

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/Y7IosK99fQI)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

A tube with hyperboic profile can be constructed using [C++][] or some [simple text](../..):

```cpp
:volu hype HYPE
 10 // inner r in mm
 12 // outer r in mm
 25 // inner stereo angle in degree
 35 // outer stereo angle in degree
 9  // half z in mm
 G4_Cu // material
```

The full source code is in [detector.tg][], which can be visualized using the macro file [mingle.mac][] or [gears.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/hype
# generate animated picture, hype.gif
G4VIS_DEFAULT_DRIVER=TSG_FILE gears gears.mac
```

![Figure of Tube with Hyperbolic Profile](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/_images/aHyperboloid.jpg)

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[detector.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/hype/detector.tg
[mingle.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/hype/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/hype/gears.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
