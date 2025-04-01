# Star Trek Enterprise Original

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/psQj1MiIR8A)
[![Boolean](https://img.shields.io/badge/Boolean-Operation-green?style=flat)](../../..)
[![Detector](https://img.shields.io/badge/Detector-Definition-blue?style=flat)](../../../..)

The neck connecting the cylindrical hull and the disk of the original Enterprise in Star Trek cannot be approximated by any [Geant4][] [CSG][]s due to complex profiles of both the hull and the disk. This can be solved by embeding part of a [trapezoid][] into the hull and the disk through the [UNION](../..) operation of three [CSG][]s, a [trapezoid][] approximating the neck and two [polycone][]s, one for the disk and one for the hull.

The geometry is defined in [original.tg][]. Dimensions are measured using an on-screen ruler on drawings from the Internet. Fire out of the engines is mimicked using many electrons, as demonstrated in [gears.mac][]. The animation shown on [YouTube][] is generated using [tsg.mac][] and [loop.mac][].

[Geant4]: ../../../../..
[CSG]: ../../../../CSG
[trapezoid]: ../../../../CSG/trap11
[polycone]: ../../../../CSG/cons
[YouTube]: https://youtube.com/shorts/psQj1MiIR8A
[original.tg]: https://github.com/jintonic/geant4/blob/main/detector/boolean/star/trek/enterprise/original.tg
[gears.mac]: https://github.com/jintonic/geant4/blob/main/detector/boolean/star/trek/enterprise/gears.mac
[tsg.mac]: https://github.com/jintonic/geant4/blob/main/detector/boolean/star/trek/enterprise/tsg.mac
[loop.mac]: https://github.com/jintonic/geant4/blob/main/detector/boolean/star/trek/enterprise/loop.mac

