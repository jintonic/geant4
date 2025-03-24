# SpaceX Starship Vehicle

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/9q6X-I14T9Q)
[![Boolean](https://img.shields.io/badge/Boolean-Operation-green?style=flat)](../..)
[![Detector](https://img.shields.io/badge/Detector-Definition-blue?style=flat)](../../..)

The shape of [SpaceX][] [Starship][] vehicle's front fins cannot be approximated by any [Geant4][] [CSG][]s due to the tapering of the vehicle's body toward its tip. This can be solved by embeding part of a [trapzoid][] into the vehicle's body through the [UNION](../..) operation of two [CSG][]s, a [trapezoid][] approximating the fin and a series of [cone sections][cons] approcimating the body.

The geometry is defined in [vehicle.tg][]. Dimensions are measured using an on-screen ruler on drawings from <https://forum.nasaspaceflight.com/index.php?topic=50049.0>. Fire out of the vehicle is mimicked using many electrons, as demonstrated in [gears.mac][]. The animation shown on [YouTube][] is generated using [tsg.mac][] and [loop.mac][].

[SpaceX]: https://spacex.com
[Starship]: https://spacex.com/vehicles/starship
[Geant4]: https://physino.xyz/geant4
[CSG]: ../../../CSG
[trapezoid]: ../../../CSG/trap11
[cons]: ../../../CSG/cons
[YouTube]: https://youtube.com/shorts/9q6X-I14T9Q
[vehicle.tg]: https://github.com/jintonic/geant4/blob/main/detector/boolean/star/ship/vehicle.tg
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/boolean/star/ship/gears.mac
[tsg.mac]: https://github.com/jintonic/geant4/blob/main/detector/boolean/star/ship/tsg.mac
[loop.mac]: https://github.com/jintonic/geant4/blob/main/detector/boolean/star/ship/loop.mac

