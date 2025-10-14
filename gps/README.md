[![Home](https://img.shields.io/badge/Home-blue?style=flat)](..)
[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://www.youtube.com/playlist?list=PLw3G-vTgPrdAJnoCsOLzzl3Wq60ncIkT_)

# General Particle Source (GPS)

[![Shape](https://img.shields.io/badge/Source-Shape-blue?style=flat)](shape)
[![Direction](https://img.shields.io/badge/Angular-Distribution-green?style=flat)](direction)

Geant4 provides 3 ways for a user to generate primary particles for a simulation:

- [C++][]: the hardest to learn and use, hence covered intensively in Geant4 [User Guide for Application Developers][guide], and demonstrated in most Geant4 official [examples][].
- [particle gun][]: the easiest to learn and use (no C++, just macro commands), yet limited in its functionality.
- [general particle source][GPS]: as easy as [particle gun][], yet way more versatile. It's functionality is demonstrated nicely in the extended Geant4 example [exgps][].

An [outdated webpage](http://hurel.hanyang.ac.kr/Geant4/Geant4_GPS/reat.space.qinetiq.com/gps/examples/examples.html) contains most demonstrations in [exgps][]. In addition, it shows resulted distribution plots, which are very helpful to visualize effects of [GPS][] macro commands.

## Default Settings of GPS

`/run/beamOn` with tracking verbosity of 2 without any setting on [GPS][] reveals the default settings of [GPS][]:

~~~cpp
Idle> /tracking/verbose 2
Idle> /run/beamOn
G4WT3 > *********************************************************************************************************
G4WT3 > * G4Track Information:   Particle = geantino,   Track ID = 1,   Parent ID = 0
G4WT3 > *********************************************************************************************************
G4WT3 >
G4WT3 > Step#    X(mm)    Y(mm)    Z(mm) KinE(MeV)  dE(MeV) StepLeng TrackLeng  NextVolume ProcName
G4WT3 >     0        0        0        0         1        0        0         0        hall initStep
G4WT3 >     1        0        0   -1e+03         1        0    1e+03     1e+03  OutOfWorld CoupledTransportation
~~~

- Default particle: geantino
- Default energy: 1 MeV
- Default position: (0, 0, 0)
- Default direction: -z

[Geant4]: https://physino.xyz/geant4
[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/GettingStarted/eventDef.html
[guide]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/index.html
[examples]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Examples/examples.html
[GPS]: http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/GettingStarted/generalParticleSource.html
[primary particles]: http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Fundamentals/eventGenerator.html
[particle gun]: http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_gun_.html
[exgps]: https://github.com/Geant4/geant4/tree/master/examples/extended/eventgenerator/exgps/macros
