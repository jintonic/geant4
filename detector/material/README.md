# Material Definition

[![Detector Definition](https://img.shields.io/badge/Detector-Definition-blue?style=flat)](..)
[![Human Body](https://img.shields.io/badge/Human-Body-orange?style=flat)](body)

[Common materials][], such as water, air, copper, even vacuum, etc., have been defined in [Geant4][]. One can run [/material/nist/listMaterials][] at any [Geant4][] state to print this long list on screen:

~~~sh
PreInit> /material/nist/listMaterials
=======================================================
###   Simple Materials from the NIST Data Base      ###
=======================================================
 Z   Name   density(g/cm^3)  I(eV)
=======================================================
 1   G4_H    8.3748e-05       19.2
 2  G4_He   0.000166322       41.8
 3  G4_Li         0.534         40
 4  G4_Be         1.848       63.7
 5   G4_B          2.37         76
 6   G4_C             2         81
 ...
98  G4_Cf            10        966
=============================================================
###    Compound Materials from the NIST Data Base          ##
=============================================================
 Ncomp             Name      density(g/cm^3)  I(eV) ChFormula
=============================================================
 6            G4_A-150_TISSUE      1.127      65.1
         1      0.101327
         6        0.7755
         7      0.035057
         8     0.0523159
         9      0.017422
        20      0.018378
 3                 G4_ACETONE     0.7899      64.2
         6             3
         1             6
         8             1
 ...
~~~

They can be directly used in code written in [C++][], [simple text][tg], or [GDML][]. For example, an experimental hall filled with air can be defined in [simple text][tg] this way:

~~~cpp
:volu hall BOX 5*m 5*m 5*m G4_AIR
~~~

If you cannot find a specific material in Geant4, you can always define it using simpler materials, for example,

~~~cpp
// use elements, C and H, to define TPB
:mixt_by_natoms TPB 1.079 2 C 28 H 22
~~~

A color can be assigned to a volume to indicate its material if the geometry is [visualized](../../visualization). For example, yellow can be assigned to a volume made of copper:

```cpp
:volu  stage TUBE 0 20 5 G4_Cu
:color stage 0.85 0.65 0.13
```

The color is defined in the form of `R, G, B`, representing the red, green, and blue portions of the color, ranging from 0 to 1. For more color codes, please check <https://johndecember.com/html/spec/colorper.html>.

[common materials]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Appendix/materialNames.html
[Geant4]: https://physino.xyz/geant4
[/material/nist/listMaterials]: http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_material_nist_.html
[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/material.html
[tg]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomASCII.html
[GDML]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomXML.html

