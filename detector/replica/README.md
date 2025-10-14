# Replicated Placement

[![Detector Definition](https://img.shields.io/badge/Detector-Definition-blue?style=flat)](..)
[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/-jNPx66Q7Zk)

[Geant4][] basic example [B4][] (also extended example [movies][]) demonstrates how to fill a parent volume entirely with the same daughter volume multiple times ([replicas][]) in C++. Replicated placement is also available in pure [text description][] of Geant4 geometry, and is demonstrated in [detector.tg][],

```cpp
// replicate volume, layer, 10 times in volume, calorimeter
:repl layer calorimeter Z 10 15
```

The resulting geometry can be animated using [mingle.mac][] (or [gears.mac][]) assuming [MinGLE][] (or [GEARS][]) is available:

```sh
git clone https://github.com/jintonic/geant4
cd geant4/detector/replica
G4VIS_DEFAULT_DRIVER=TSG_FILE mingle mingle.mac
```

[Geant4]: https://physino.xyz/geant4
[B4]: https://github.com/Geant4/geant4/tree/master/examples/basic/B4
[movies]: https://github.com/Geant4/geant4/tree/master/examples/extended/visualization/movies
[text description]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomASCII.html
[replicas]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomPhysical.html#replicas
[detector.tg]: https://github.com/jintonic/geant4/blob/main/detector/replica/detector.tg
[mingle.mac]: https://github.com/jintonic/geant4/blob/main/detector/replica/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/replica/gears.mac
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
