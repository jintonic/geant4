# Generic Trapezoid

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/viwgRu1O-uc)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

A generic trapezoid is a solid with six trapezoidal faces, it has two bases parallel to the XY-plane and four lateral faces. The bases are located at the same distance from the XY-plane, but on opposite sides of it. Each base has two sides parallel the X-axis. Let’s call the line joining middle point of these sides - the centre line of the base, and the middle point of this line - the centre of the base. An important property of this shape is that the line joining the centres of the bases goes through the origin of the local coordinate system. It can be constructed using [C++][] or some [simple text](../..):

```cpp
:volu trap11 TRAP
 60 // half height along z in mm
 20 // theta of the line connecting top and bottom centers [degree]
 5  // phi of the line connectng top and bottom centers [degree]
 40 // half height of the bottom base in mm (along y)
 30 // half length of one side of the bottom base in mm
 40 // half length of another side of the bottom base in mm
 10 // angle between y and the center line of the bottom base [degree]
 16 // half height of the top base in mm (along y)
 10 // half length of one side of the top base in mm
 14 // half length of another side of the top base in mm
 10 // angle between y and the center line of the top base [degree]
 G4_W // material
```

The full source code is in [detector.tg][], which can be visualized using the macro file [mingle.mac][] or [gears.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/trap11
# generate animated picture, trap11.gif
G4VIS_DEFAULT_DRIVER=TSG_FILE gears gears.mac
```
![Figure of trapezoid](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/_images/aTrap.jpg)

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[detector.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/trap11/detector.tg
[mingle.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/trap11/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/trap11/gears.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
