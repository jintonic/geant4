# Trapezoid Twisted along z-Axis

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/m7xZyeLokZU)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

A trapezoid twisted along z-axis can be constructed using [C++][] or some [simple text](../..):

```cpp
volu twisted TWISTEDTRD
 30 // Half x-length at the surface at -dz/2 [mm]
 10 // Half x-length at the surface at +dz/2 [mm]
 40 // Half y-length at the surface at -dz/2 [mm]
 15 // Half y-length at the surface at +dz/2 [mm]
 60 // Half z length: dz/2 [mm]
 30*degree // angle twisted
 G4_WATER // material
```

> **NOTE**!
>
> - The default unit of the twist angle here is *rad*, not *degree*. We need to explicitly multiply the number with `degree` if we want to use *degree* as the unit. This is different from untwisted shapes, where the default unit of an angle is already *degree*.
> - The twist must be within ±(0, 90) degree (not including 0 and 90 degrees).
 
The full source code is in [trd.tg][], which can be visualized using the macro file [trd.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/twisted
# generate animated picture, trd.gif
./twist.sh
# or launch a UI
gears
# in the UI, run
/control/execute trd.mac
```

![Figure of Twisted Trapezoid](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/_images/aTwistedTrd.jpg)

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[trd.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/twisted/trd.tg
[trd.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/twisted/trd.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
