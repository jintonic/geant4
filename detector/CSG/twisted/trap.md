# Generic Trapezoid Twisted along z-Axis

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/r_KL71D1puk)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

A generic trapezoid twisted along z-axis can be constructed using [C++][] or some [simple text](../..):

```cpp
:volu twistedTrap TWISTEDTRAP
 30*degree // angle twisted around z
 60 // dz/2: half height in z [mm]
 20*degree // theta
 5*degree // phi
 40 // dy1/2: half y @ -dz/2 [mm]
 30 // half x @ -dz/2 and -dy1/2 [mm]
 40 // half x @ -dz/2 and +dy1/2 [mm]
 16 // dy1/2: half y @ dz/2 [mm]
 10 // half x @ dz/2 and -dy1/2 [mm]
 14 // half x @ dz/2 and +dy1/2 [mm]
 10*degree // angle with respect to y from the centre of the side
 G4_WATER // material
```

> **NOTE**!
>
> - The default unit of the twist angle here is *rad*, not *degree*. We need to explicitly multiply the number with `degree` if we want to use *degree* as the unit. This is different from untwisted shapes, where the default unit of an angle is already *degree*.
> - The twist must be within ±(0, 90) degree (not including 0 and 90 degrees).

The full source code is in [trap.tg][], which can be visualized using the macro file [trap.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/twisted
# generate animated picture, trap.gif
./twist.sh
# or launch a UI
gears
# in the UI, run
/control/execute trap.mac
```

![Figure of Twisted Trapezoid](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/_images/aTwistedTrap.jpg)

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[trap.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/twisted/trap.tg
[trap.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/twisted/trap.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
