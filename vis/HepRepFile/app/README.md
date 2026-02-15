[![Home](https://img.shields.io/badge/Home-/-blue?style=flat)](../../..)
[![Visualization](https://img.shields.io/badge/Visualization-/-lemon?style=flat)](../..)
[![HepRepFile](https://img.shields.io/badge/HepRepFile-/-orange?style=flat)](..)

HepRApp is a Java-based [HepRep][] Data Browsing Application developed in [SLAC][]. In my experience, it is still the best offline Geant4 visualization tool despite its age. Its original [homepage](http://www.slac.stanford.edu/~perl/HepRApp) is removed in 2025, but still available at [Wayback Machine][], which contains valuable information about its history and basic usage.

Due to the lack of maintenance, it only runs on Java 1.8.0 update 312 or earlier, which is hard to find nowadays. A tiny (~75 MB) docker image, [physino/heprapp][], is developed to solve this issue. It is based on [openjdk:8u312-jre-slim-buster][], and contains the original `HepRApp.jar` (~4 MB) archived at the [GEARS][] GitHub Release page <https://github.com/jintonic/gears/releases/tag/v1.5.1>. For people who are interested in how this is done, please refer to its [Dockerfile][].

The easiest way to run it is to use the [compose.yml][] file shipped with this website's source code:

```sh
git clone https://github.com/jintonic/geant4
cd geant4
docker compose --profile heprapp up
```

This will launch HepRApp inside a webpage: <http://localhost:8080/vnc.html?autoconnect=true&scale=true>, assuming you have [Docker Desktop][] running in the background, which will download required docker images automatically if they are not available locally. No Java or X-window server is needed on your host machine.

## Views in HepRApp

You can select a few different views to display your geometry through right click on HepRApp:

- _Beam view_: view against z; y points up; x points to the right.
- _Top view_: view against y; x points up; z points to the right.
- _Side view_: view along x; y points up; z points to the right.

**Note**: all [/vis/viewer/set][] commands have NO effort in HepRApp but they do work in Qt.

```sh
/vis/viewer/set/upVector 0 1 0 # y points up
/vis/viewer/set/viewpointVector 0 0 1 # view against z (beam view)
/vis/viewer/set/background 0 0.17 0.21 # solarized color: base03
```

[HepRep]: https://www.slac.stanford.edu/pubs/slacpubs/8250/slac-pub-8332.pdf
[SLAC]: https://www.slac.stanford.edu
[Wayback Machine]: http://web.archive.org/web/20220120134233/http://www.slac.stanford.edu/~perl/HepRApp.
[physino/heprapp]: https://hub.docker.com/r/physino/heprapp
[openjdk:8u312-jre-slim-buster]: https://hub.docker.com/layers/library/openjdk/8u312-jre-slim-buster/images/sha256-ebbf35a16c8ce27b0ace4dd89e54d08e07768b3c9f9c4454bba8673503024a70
[GEARS]: https://github.com/jintonic/gears
[Dockerfile]: https://github.com/jintonic/geant4/blob/main/vis/HepRepFile/app/Dockerfile
[compose.yml]: https://github.com/jintonic/geant4/blob/main/compose.yml
[Docker Desktop]: https://www.docker.com/products/docker-desktop/
[/vis/viewer/set]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_vis_viewer_set_.html