# Box Twisted around z-Axis

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/m7xZyeLokZU)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](../..)

A box twisted around z-axis can be constructed using [C++][] or some [simple text](../..):

```cpp
:volu twistedBox TWISTEDBOX
 30*degree // angle twisted around z
 30 // half x in mm
 40 // half y in mm
 60 // half z in mm
 G4_WATER // material
```
> **NOTE**!
>
> - The default unit of the twist angle here is *rad*, not *degree*. We need to explicitly multiply the number with `degree` if we want to use *degree* as the unit. This is different from untwisted shapes, where the default unit of an angle is already *degree*.
> - The twist must be within (0, 90) degree

The full source code is in [box.tg][], which can be visualized using the macro file [box.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/twisted
# generate animated picture, box.gif
./twist.sh
# or launch a UI
gears
# in the UI, run
/control/execute box.mac
```

![Figure of Twisted Box](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/_images/aTwistedBox.jpg)

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[box.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/twisted/box.tg
[box.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/twisted/box.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
