[![Particle Source](https://img.shields.io/badge/Particle-Source-blue?style=flat)](../..)
[![Source Shape](https://img.shields.io/badge/Source-Shape-yellow?style=flat)](..)
[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/YwhMtgNypwU)

# Particles from a Square Plane

The particle source, gamma-rays originated from a square plane, constructed in C++ in the [Geant4][] basic example [B1][] is re-implemented using [gps](../..) macro commands in [mingle.mac][].

[B1][]'s detector model defined in C++ is also re-implemented with [simple text geometry description](../../../detector) in [detector.tg][].

Assuming [MinGLE][] is availalbe, one can launch it in this folder and then run [mingle.mac][] with `/control/execute mingle.mac`.

In order to demonstrate the result on [YouTube][], [mingle.mac][] calls [tsg.mac][] for animation, which in turn calls [run.mac][] to generate each picture in the animation.

[mingle.mac][] itself is called by [gears.mac][] so that the same simulation can be run using [GEARS][],

```sh
cd /path/to/this/folder
gears
/control/execute gears.mac
```

[Geant4]: https://physino.xyz/geant4
[B1]: https://github.com/Geant4/geant4/tree/master/examples/basic/B1
[mingle.mac]: https://github.com/jintonic/geant4/tree/master/source/shape/square/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/tree/master/source/shape/square/gears.mac
[run.mac]: https://github.com/jintonic/geant4/tree/master/source/shape/square/run.mac
[tsg.mac]: https://github.com/jintonic/geant4/tree/master/source/shape/square/tsg.mac
[detector.tg]: https://github.com/jintonic/geant4/tree/master/source/shape/square/detector.tg
[GEARS]: https://github.com/jintonic/gears
[MinGLE]: https://github.com/jintonic/mingle
[YouTube]: https://youtube.com/shorts/YwhMtgNypwU
