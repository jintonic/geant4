# General Particle Source

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://www.youtube.com/playlist?list=PLw3G-vTgPrdAJnoCsOLzzl3Wq60ncIkT_)
[![shape](https://img.shields.io/badge/Source-Shape-blue?style=flat)](shape)

[Geant4][] provides 3 ways for a user to generate primary particles for a simulation:

- [C++][]: the hardest to learn and use, hence covered intensively in Geant4 [User Guide for Application Developers][guide], and demonstrated in most Geant4 official [examples][].
- [particle gun][]: the easiest to learn and use (no C++, just macro commands), yet limited in its functionality.
- [general particle source][gps]: as easy as [particle gun][], yet way more versatile. It's functionality is demonstrated nicely in the extended Geant4 example [exgps][].

An [outdated webpage](http://hurel.hanyang.ac.kr/Geant4/Geant4_GPS/reat.space.qinetiq.com/gps/examples/examples.html) contains most demonstrations in [exgps][]. In addition, it shows resulted distribution plots, which are very helpful to visualize effects of [gps][] macro commands.

[Geant4]: https://physino.xyz/geant4
[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/GettingStarted/eventDef.html
[guide]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/index.html
[examples]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Examples/examples.html
[gps]: http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/GettingStarted/generalParticleSource.html
[primary particles]: http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Fundamentals/eventGenerator.html
[particle gun]: http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_gun_.html
[exgps]: https://gitlab.cern.ch/geant4/geant4/tree/master/examples/extended/eventgenerator/exgps/macros)
