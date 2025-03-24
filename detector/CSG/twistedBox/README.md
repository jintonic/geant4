# Twisted Box

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/m7xZyeLokZU)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

A twisted box can be constructed using [C++][] or some [simple text](../..):

```cpp
:volu twistedBox TWISTEDBOX
 3.1415926/6 // twist angle in rad (not in degree!)
 30 // half x in mm
 40 // half y in mm
 60 // half z in mm
 G4_WATER // material
```

The full source code is in [detector.tg][], which can be visualized using the macro file [mingle.mac][] or [gears.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/twistedBox
# generate animated picture, twistedBox.gif
G4VIS_DEFAULT_DRIVER=TSG_FILE gears gears.mac
```

![Figure of Twisted Box](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/_images/aTwistedBox.jpg)

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[detector.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/twistedBox/detector.tg
[mingle.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/twistedBox/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/twistedBox/gears.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
