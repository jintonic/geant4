# Ellipsoid
[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/vUPf0hv_HRo)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](..)

An ellipsoid can be constructed using [C++][] or some [simple text](../..):

```cpp
:volu ellipsoid ELLIPSOID
 10 // semi axis in x [mm]
 20 // semi axis in x [mm]
 50 // semi axis in x [mm]
-10 // lower limit on z [mm]
 40 // upper limit on z [mm]
 G4_WATER // material
```

The full source code is in [detector.tg][], which can be visualized using the macro file [mingle.mac][] or [gears.mac][], assuming an [universal Geant4 application][], such as [MinGLE][] or [GEARS][], is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/CSG/ellipsoid
# generate animated picture, ellipsoid.gif
G4VIS_DEFAULT_DRIVER=TSG_FILE gears gears.mac
```

[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[detector.tg]: https://github.com/jintonic/geant4/blob/main/detector/CSG/ellipsoid/detector.tg
[mingle.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/ellipsoid/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/CSG/ellipsoid/gears.mac
[universal Geant4 application]: https://youtu.be/3g9CkyBS31o
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
