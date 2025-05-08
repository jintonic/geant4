# Tube Section Twisted along z-Axis

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/RXZDt5xKYtU)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

A tube section twisted along z-axis can be constructed using [C++][] or some [simple text](../..):

```cpp
:volu twisted TWISTEDTUBS
 30*degree // angle twisted around z
 10 // inner radius [mm]
 15 // outer radius [mm]
 20 // half z length [mm]
 180*degree // dphi. NOTE: phi0=-dphi/2
 G4_WATER // material
```

> **NOTE**!
>
> - The default unit of the twist angle here is *rad*, not *degree*. We need to explicitly multiply the number with `degree` if we want to use *degree* as the unit. This is different from untwisted shapes, where the default unit of an angle is already *degree*.
> - The twist can go beyond 180 degree in code, but note that any shape twisted 180 degree will snap in the middle in reality.
> - The twist angle can be negative, which is just a twist clockwise if we see it from above.

The full source code is in [tubs.tg][], which can be visualized using the macro file [tubs.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/twisted
# generate animated picture, tubs.gif
./twist.sh
# or launch a UI
gears
# in the UI, run
/control/execute tubs.mac
```

![Figure of Twisted Tubs](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/_images/aTwistedTubs.jpg)

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[tubs.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/twisted/tubs.tg
[tubs.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/twisted/tubs.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
