# Traposoid Twisted along z-Axis

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/m7xZyeLokZU)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

A traposoid twisted along z-axis can be constructed using [C++][] or some [simple text](../..):

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
> The default unit of an angle here is *rad*, not *degree*. We need to explicitly multiple the number with `degree` if we want to use `degree` as the unit. This is different from other shapes, where the default unit of an angle is already `degree`.

The full source code is in [detector.tg][], which can be visualized using the macro file [mingle.mac][] or [gears.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/twistedTrap
# generate animated picture, twistedTrap.gif
G4VIS_DEFAULT_DRIVER=TSG_FILE gears gears.mac
```

![Figure of Twisted Traposoid](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/_images/aTwistedTrap.jpg)

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[detector.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/twistedTrap/detector.tg
[mingle.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/twistedTrap/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/twistedTrap/gears.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
