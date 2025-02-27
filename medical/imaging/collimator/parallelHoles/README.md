<a href="https://www.nuclear-shields.com/parallel-hole-colimator.html"><img align="right" width="120px" src="https://www.nuclear-shields.com/pub/media/catalog/product/cache/image/e9c3970ab036de70892d86c6d221abfe/p/a/parallel_hole_lead_collimators_-_nuclear_shields.png"/></a>

Parallel-hole collimators as shown in the right picture can be modeled in Geant4 by placing many holes made of G4_AIR in a lead brick (G4_Pb). The holes are daughter volumes of the lead mother volume. The material of the daughter volumes (G4_AIR) replace that of the mother volume (G4_Pb).

The placement can be done in two ways:

- Using placement through parameterisation, as demonstrated in <https://github.com/jintonic/geant4/blob/main/medical/imaging/collimator/parallelHoles/square.tg>. The advantage is the short geometry description file. However, [/geometry/test/run][] must not be used, because overlapping check is painfully slow for a large number of copies of the daughter volume. This is demonstrated in <https://github.com/jintonic/geant4/blob/main/medical/imaging/collimator/parallelHoles/square.mac>
- Using *for* loops in a script to generate many lines of placement, as demonstrated in <https://github.com/jintonic/geant4/blob/main/medical/imaging/collimator/parallelHoles/hexagonal.sh>. The resulting geometry description file can be very long:
```cpp
:volu hall BOX 150 150 150 G4_AIR
:vis hall OFF

:volu collimator BOX 100 100 50 G4_Pb
:color collimator 0.57 0.63 0.63

:rotm r000 0 0 0
:place collimator 1 hall r000 0 0 0

:volu hole POLYHEDRA 0 360 6 2 -50 0 2 50 0 2 G4_AIR
:color hole 0.57 0.63 0.63

:place hole 0 collimator r000 -90 -90 0
:place hole 1 collimator r000 -90 -80 0
:place hole 2 collimator r000 -90 -70 0
:place hole 3 collimator r000 -90 -60 0
...
```
However, overlapping check is surprisingly fast for such a file. One can verify this by running <https://github.com/jintonic/geant4/blob/main/medical/imaging/collimator/parallelHoles/hexagonal.mac> using <https://github.com/jintonic/gears>.

[/geometry/test/run]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_geometry_test_.html#c7
