[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://www.youtube.com/@physino)
[![UI](https://img.shields.io/badge/User-Interface-blue?style=flat)](UI)
[![Installation](https://img.shields.io/badge/Get-Geant4-green?style=flat)](installation)
[![Detector](https://img.shields.io/badge/Detector-Definition-yellow?style=flat)](detector)
[![Visualization](https://img.shields.io/badge/Visualization-orange?style=flat)](visualization)
[![Source](https://img.shields.io/badge/Particle-Source-cyan?style=flat)](source)

According to <https://geant4.org>, Geant4 is a
> **Toolkit** for the simulation of the passage of particles through matter.

which means that it is **NOT** a program that can be double-clicked and run after installation.

Instead, Geant4 is provided as a set of [C++](installation/cpp) libraries that need to be compiled [^1]. One must write a C++ program (Geant4 application) that calls functions provided in the compiled Geant4 libraries. The application itself also needs to be compiled, before it can be double-clicked and run.

[^1]: Binary releases on <https://geant4.org/download> are pre-compiled Geant4 libraries. They only work on very specific operating systems. This approach works best for Windows users. Please watch the first 5 videos in [this] YouTube playlist to understand the pro's and con's of pre-compiled Geant4 libraries.

[this]: https://www.youtube.com/playlist?list=PLw3G-vTgPrdB7cIYWEoCeIZrSePpefFEW

Think Geant4 as a set of disassembled Lego pieces (libraries). One needs to put them together into a Lego model, such as a car, a plane, or a house, etc. (applications).

The Geant4 [Q&A] hence defines three types of users:

- the **end user**, who uses a Geant4 application written by someone else,
- the **application developer**, who writes a Geant4 application,
- the **framework provider**, who updates or extends Geant4 libraries.

This website is provided to flatten the steep learning curve of Geant4 for its end users, with some thoughts on how application developers and framework providers can serve end users better.

[Q&A]: https://geant4-userdoc.web.cern.ch/UsersGuides/IntroductionToGeant4/html/IntroductionToG4.html#software-knowledge-required-to-use-the-geant4-toolkit

## Why It Is Hard to Learn Geant4

As end users, all we need is a Geant4 application that has already been compiled for our operating systems (OS), and we can just double click and run it. Geant4 does provide many [example application]s to show its muscles. However, too many choices actually paralyze a poor end user. Which one shall we choose?! A reasonable choice would be the simplest one. However, the simplest Geant4 application example, [B1][], has very limited functionality. To adopt it for our specific applications, we, as end users, are forced to learn how to modify and compile a Geant4 [example application], and become an application developer. No wonder the first Geant4 User guide is for application developers instead of end users.

[example application]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Examples/examples.html
[B1]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Examples/BasicCodes.html#exmpbasic-b1

According to <https://geant4.org/docs/#user-guides>,
> If you are new to Geant4, we recommend that you read this document ([Geant4 User Guide for Application Developers][guide]) first. The first part of the document provides a step-by-step tutorial in the use of Geant4; this is for a **novice** user. The second part describes the usage of the toolkit for practical applications, with a lot of example codes. After reading this part, you will be able to start to *write a detector simulation program* for most applications/experiments.

[guide]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/index.html

The shocking fact is that there is **NO** official guide for end users! This is understandable, because Geant4 is provided as a **toolkit** (individual Lego pieces), way more flexible than a specific **application** (a finished Lego model). Nevertheless, this is bad news for absolute beginners who need an executable application instead of a comprehensive but complicated toolkit.

Is it possible to provide a compiled Geant4 application that can be double clicked and run for different simulations on different OS? It is possible but quit hard, because

- There is no way to include all existing, or to-be-constructed radiation detectors or shielding geometries into one program. Even end users must learn [how to model their own experimental setups](detector) if nobody else does that for them.
- A [C++ program must be compiled](installation/cpp) on a specific OS to run on that system. A C++ program that is compiled on a Mac cannot be used on Windows or Linux.

## Survival Tips for Geant4 End Users

First, find people around you who know how to use Geant4, ask them to walk you through the process. If there is nobody around you who can do this, follow this guide. It is possible to learn Geant4 by following the official [User Guide for Application Developers][guide]. But it is hard, because the official guide targets application developers, **NOT** end users.

Second, avoid [installing Geant4](installation) by yourself whenever possible. It is often possible to find some computers in your research or working group that already have Geant4 installed. If you are in a large research group, you may be able to gain access to some high performance computing clusters (HPC), where multiple versions of Geant4 are available. If you cannot find any, please consider using [containerized Geant4](installation/container), or [cloud-based Geant4](UI).

## Epilogue

This [repository] was originally created to avoid duplicating common [Geant4][] related stuff (e.g. datasets, containers, documentation, etc.) in individual [Geant4][] applications, such as [GEARS][] and [MinGLE][]. It has evolved into a central hub to collect and disseminate my ideas and effort toward a more end user friendly Geant4 ecosystem. Welcome to join [me][] if you are interested in the development of [Shine][], [GEARS][], [MinGLE][], [containerized Geant4](installation/container), or YouTube [tutorials][].

## Footnote

[StackOverflow]: https://stackoverflow.com
[git]: https://git-scm.com
[Apptainer]: https://apptainer.org
[Geant4]: https://geant4.org
[GEARS]: https://github.com/jintonic/gears
[MinGLE]: https://github.com/jintonic/mingle
[repository]: https://github.com/jintonic/geant4
[me]: https://physino.xyz
[shine]: https://physino.xyz/shine
[image]: https://hub.docker.com/r/physino/geant4
[tutorials]: https://www.youtube.com/@physino
[tg]: http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomASCII.html
[GDML]: https://gdml.web.cern.ch/GDML/
[md]: https://en.wikipedia.org/wiki/Markdown
[HTML]: https://www.w3schools.com/html

