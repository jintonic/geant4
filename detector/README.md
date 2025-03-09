# Detector Definition

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://www.youtube.com/playlist?list=PLw3G-vTgPrdBxXZo1UpOD_xVFSgM3hLn-)
[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](CSG)
[![Parameterisation](https://img.shields.io/badge/Parameterized-Placement-magenta?style=flat)](parameterisation)
[![Replica](https://img.shields.io/badge/Replicated-Placement-yellow?style=flat)](replica)

[Geant4][] provides 3 ways for its users to define their own detector models:

- [C++][]: the **hardest to use and master**, yet described in detail in Geant4 [User Guide for Application Developers][guide], and demonstrated in most Geant4 official [examples][]
- [Text with simple syntax][tg]: the **easiest to use and surprisingly versatile**, but only briefly mentioned in Geant4 [User Guide for Application Developers][guide] with an outdated [manual][].
- [GDML][]: XML files for exchange of geometry data between programs, such as [CAD][], [Geant4][] and [ROOT][]. It is optional and **NOT** enabled by default in a Geant4 installation.

Every detector defined using C++ demands the creation of a new Geant4 applicaiton. Detectors defined using [simple text][tg] can be all used by the same Geant4 application that accepts detector definitions in simple text (for example, [MinGLE][] or [GEARS][]). A lot of redundant work can be avoided this way.

[Geant4]: https://physino.xyz/geant4
[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html
[guide]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/index.html
[examples]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Examples/examples.html
[tg]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomASCII.html
[manual]: https://cern.ch/geant4/collaboration/working_groups/persistency/docs/textgeom.pdf
[CAD]: http://cad-gdml.in2p3.fr
[GDML]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomXML.html
[ROOT]: https://root.cern/doc/master/group__Geometry__gdml.html
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears
