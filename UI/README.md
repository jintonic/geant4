
## Shine: a Web UI for Geant4

[![Shine](https://img.shields.io/badge/Shine-orange?style=flat)](https://physino.xyz/shine)

It is the user's responsibility to provide a detector model for a Geant4 simulation. The [Geant4 User Guide for Application Developers] provides detailed instruction on how to [program detector definition and response in C++]. Again, end users are forced to become application developers if they choose to go that route.

[program detector definition and response in C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/detector.html

Fortunately, Geant4 also allows end users to write their detector definition in

- [plain text format][tg] (manual: [pdf](https://cern.ch/geant4/collaboration/working_groups/persistency/docs/textgeom.pdf), [html](http://fismed.ciemat.es/GAMOS/GAMOS_doc/GAMOS.6.0.0/Geometry/Geometry.html))
- [GDML][]

Their difference is similar to that between [markdown][md] and [HTML][]. The detector definition in [plain text][tg] is the easiest to learn.

However, writing in a text file is not the most intuitive way to construct and debug 3D geometries. A graphic user interface (UI) is better suited for this task. [Shine][] is such a UI on the web. One can use the mouse to select, place, rotate basic shapes on a canvas, and export the constructed detector model to a [plain text file][tg] called `detector.tg`, which can be read by a Geant4 application that is configured to accept detector definition in plain text format.

![Shine: a Web UI for Geant4](https://lh3.googleusercontent.com/d/1IYnxORUysfgw7ymhGuH_jlVCUpe2lsd-)

