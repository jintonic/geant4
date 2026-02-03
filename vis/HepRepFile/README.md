[![Home](https://img.shields.io/badge/Home-blue?style=flat)](../..)
[![Visualization](https://img.shields.io/badge/Visualization-Drivers-orange?style=flat)](..)
[![Docker image](https://img.shields.io/badge/Docker-image-red?style=flat)](https://hub.docker.com/r/physino/heprapp)

# HepRepFile

> **Note:** The [HepRepFile][] visualization driver has been removed from Geant4 since version 11.4.0. I keep its source code from Geant4 11.3.2 in this folder and include the compiled shared library `libG4HepRepFile.so` in images on <https://hub.docker.com/r/physino/geant4> for Geant4 11.4.0 and newer versions. For Geant4 11.3.2 and older versions, you can use the driver directly from the Geant4 installation.

The [HepRepFile][] visualization driver is used to generate `G4Data*.heprep` files, which can be viewed using an external program called [HepRApp][] Data Browser in wireframe mode, that is, no surface, only outlines, which sounds primitive, but is one of the best ways to troubleshoot a complicated geometry.

<iframe width="640" height="360" src="https://www.youtube.com/embed/UEM4X8Pdse8?si=Z927ydc0g6Pxn8qg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Unfortunately, [HepRApp][] only runs on a very old java version, 1.8 (or 8 in short). To use it, you may need to install two versions of java, one new and one old, and switch to the old one to use [HepRApp]. This can be done, but the detailed procedure changes with the OS. In case of Windows, simply download java 8 from <https://www.java.com/en/download>. In case of modern MacOS or Linux distributions, there is no tested working procedure. A Docker image <https://hub.docker.com/r/physino/heprapp> is create to solve this problem. It can be used in the following way:

1. download and run [Docker][] Desktop
2. for Mac and Windows users: run an [X11][] server ([XQuartz][] for Mac, [MobaXterm][] for Windows)
3. for Mac and Linux users: run `xhost +` in a terminal
4. save [compose.yml][] in a folder that contains the `G4Data*.heprep` file that you want to view, in that folder, run

```sh
docker compose run --rm heprapp
```

The [HepRApp][] Data Browser should pop up on your desktop.

## Preparing Geometry for HepRApp Browser

The following code snippet shows how to prepare your detector geometry written in [simple text] for the HepRApp browser.

```cpp
:volu hall BOX 1*m 1*m 1*m G4_AIR
// without specifying color, HepRepFile won't show the volume, but Qt will
:color hall 0.8 0.9 0.1
// use the following to disable visualization in all drivers, w/o color
:vis hall OFF
```

The following Geant4 [macro][../../run/macro] command can be used to add a 3D coordinate system in your HepRApp browser.

```sh
# This command add x,y,z axes (right-handed system) in HepRepFile
# HepRApp Data Browser shows an axis as a hexagonal stick + a tetrahedra
# By default, x is shown in red, y in green, z in blue
/vis/scene/add/axes
```

## Views in HepRApp Data Browser

You can select a few different views to display your geometry through right click on your HepRApp browser:

- _Beam view_: view against z; y points up; x points to the right.
- _Top view_: view against y; x points up; z points to the right.
- _Side view_: view along x; y points up; z points to the right.

**Note**: all [/vis/viewer/set] commands have NO effort in HepRApp Data Browser but they do work in Qt.

```sh
/vis/viewer/set/upVector 0 1 0 # y points up
/vis/viewer/set/viewpointVector 0 0 1 # view against z (beam view)
/vis/viewer/set/background 0 0.17 0.21 # solarized color: base03
```

[HepRepFile]: http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Visualization/visdrivers.html#heprepfile
[Geant4]: http://geant4.cern.ch
[HepRApp]: http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Visualization/visdrivers.html#heprepfile
[XQuartz]: https://www.xquartz.org
[Docker]: https://docker.com
[MobaXterm]: https://mobaxterm.mobatek.net
[X11]: https://en.wikipedia.org/wiki/X_Window_System
[compose.yml]: https://github.com/jintonic/geant4/raw/refs/heads/main/compose.yml
[simple text]: ../../detector
[/vis/viewer/set]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_vis_viewer_set_.html
