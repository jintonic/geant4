[![Docker image](https://img.shields.io/badge/Docker-image-blue?style=flat)](https://hub.docker.com/r/physino/heprapp)
[![Apptainer image](https://img.shields.io/badge/Apptainer-image-orange?style=flat)](https://cloud.sylabs.io/library/jintonic/geant4/vis)
[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://www.youtube.com/playlist?list=PLw3G-vTgPrdATGRFqclPsXrxgHl9G4Ov6)

The [HepRepFile][] visualization driver is available in any [Geant4][] installation. It can be used to generate `G4Data*.heprep` files, which can be viewed using an external program called [HepRApp][] Data Browser in wireframe mode, that is, no surface, only outlines, which sounds primitive, but is one of the best ways to troubleshoot a complicated geometry.

Unfortunately, [HepRApp][] only runs on java version 1.8 (or 8 in short). To use it, you may need to install two versions of java and switch to the older one if needed. This can be done, but the detailed procedure changes with the OS. In case of Windows, simply download java 8 from <https://www.java.com/en/download>. In case of modern MacOS or Linux distributions, there is no tested working procedure. A Docker image <https://hub.docker.com/r/physino/heprapp> is create to solve this problem. It can be used in the following way:

1. download and run [Docker][] Desktop
2. for Mac and Windows users: run an [X11][] server ([XQuartz][] for Mac, [MobaXterm][] for Windows)
3. for Mac and Linux users: run `xhost +` in a terminal
4. save <> in a folder that contains the `G4Data*.heprep` file that you want to view, in that folder, run

```sh
docker compose run --rm heprapp
```

The [HepRApp][] Data Browser should pop up on your desktop.

## Visualization in HepRApp Data Browser

```cpp
:volu hall BOX 1*m 1*m 1*m G4_AIR
// without specifying color, HepRepFile won't show the volume, but Qt will
:color hall 0.8 0.9 0.1
// use the following to disable visualization in all drivers, w/o color
:vis hall OFF
```

```sh
# This command add x,y,z axes (right-handed system) in HepRepFile
# HepRApp Data Browser shows an axis as a hexagonal stick + a tetrahedra
# By default, x is shown in red, y in green, z in blue
/vis/scene/add/axes
```

## Views in HepRApp Data Browser

- *Beam view*: view against z; y points up; x points to the right.
- *Top view*: view against y; x points up; z points to the right.
- *Side view*: view along x; y points up; z points to the right.

```sh
# all /vis/viewer/set commands have NO effort in HepRApp Data Browser
# but they do work in Qt
/vis/viewer/set/upVector 0 1 0 # y points up
/vis/viewer/set/viewpointVector 0 0 1 # view against z (beam view)
/vis/viewer/set/background 0 0.17 0.21 # solarized color: base03
```

[HepRepFile]:http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Visualization/visdrivers.html#heprepfile
[Geant4]: http://geant4.cern.ch
[HepRApp]: https://www.slac.stanford.edu/~perl/HepRApp
[XQuartz]: https://www.xquartz.org
[Docker]: https://docker.com
[MobaXterm]: https://mobaxterm.mobatek.net
[X11]: https://en.wikipedia.org/wiki/X_Window_System
[compose.yml]: https://github.com/jintonic/geant4/raw/refs/heads/main/compose.yml
