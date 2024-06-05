[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://www.youtube.com/@physino)
[![Web UI](https://img.shields.io/badge/Web-UI-blue?style=flat)](#shine-a-web-ui-for-geant4)
[![Geant4 Container](https://img.shields.io/badge/Geant4-Container-green?style=flat)](#geant4-container)

According to <https://geant4.org>, Geant4 is a
> **Toolkit** for the simulation of the passage of particles through matter.

which means that it is **NOT** a program that can be installed, double-clicked, and run.

Instead, Geant4 is provided as a set of C++ libraries that need to be compiled [^1]. One must write a C++ program (Geant4 application) that calls functions provided in the compiled Geant4 libraries. The application itself also needs to be compiled, before it can be double-clicked and run.

[^1]: The compiled ones only work in very specific operating systems.

Think Geant4 as a set of disassembled Lego pieces (libraries). One needs to put them together into a Lego model, such as a car, a plane, or a house, etc. (applications).

The Geant4 [Q&A] hence defines three types of users:

- the [end user], who uses a Geant4 application written by someone else,
- the [application developer], who writes a Geant4 application, and
- the *framework provider*, who updates or extends Geant4 libraries.

This tutorial is provided to flatten the steep learning curve of Geant4 for the first two types of users with some thoughts on how a framework provider can serve the first two better.

[Q&A]: https://geant4-userdoc.web.cern.ch/UsersGuides/IntroductionToGeant4/html/IntroductionToG4.html#software-knowledge-required-to-use-the-geant4-toolkit
[end user]: #for-end-user
[application developer]: #for-application-developer

## For End User

Most of us are end users. All we need is a Geant4 application that has already been compiled for our operating system so that we can double click and run it. Geant4 does provide many [example applications] to show its muscles. However, too many choices actually paralyze a poor end user. Which one shall we choose?! A reasonable choice would be the simplest one. However, the simplest Geant4 application example, [B1][], has very limited functionality. To adopt it for our specific applications, we, as end users, are forced to learn how to modify and compile a Geant4 example application, and become an application developer. No wonder the first Geant4 User guide is for application developers instead of end users.

[example applications]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Examples/examples.html
[B1]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Examples/BasicCodes.html#exmpbasic-b1

According to <https://geant4.org/docs/#user-guides>, 
> If you are new to Geant4, we recommend that you read this document ([Geant4 User Guide for Application Developers]) first. The first part of the document provides a step-by-step tutorial in the use of Geant4; this is for a **novice** user. The second part describes the usage of the toolkit for practical applications, with a lot of example codes. After reading this part, you will be able to start to *write a detector simulation program* for most applications/experiments.

[Geant4 User Guide for Application Developers]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/index.html

The shocking fact is that there is **NO** guide for end users! This is understandable, because Geant4 is provided as a **toolkit** (individual Lego pieces), way more flexible than a specific **application** (a finished Lego model). Nevertheless, this is bad news for absolute beginners who need an executable application instead of a comprehensive but complicated toolkit.

Is it possible to provide a compiled Geant4 application that can be double clicked and run for different simulations on different operating systems? This is a mission impossible because

- There is no way to include all existing, or to-be-constructed radiation detectors or shielding geometries into one program. Even end users must be responsible for constructing their specific detectors.
- A C++ program must be compiled on a specific operating system to run on that system. A C++ program that is compiled on a Mac cannot be used on a Windows or a Linux computer.

However, there are ways to get closer to this goal. To solve the first problem, a [web-based user interface] can be used by the [end user] to construct a specific detector or shielding structure without C++ programming. To solve the second problem, a [container] image can be used to include compiled Geant4 libraries and ready-to-run applications that can read the output of the web UI. Both can run on all major operating systems and require no C++ programming experience to begin with.

[web-based user interface]: #shine-a-web-ui-for-geant4
[container]: #geant4-container

### Shine: a Web UI for Geant4

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://www.youtube.com/@physino)
[![Shine](https://img.shields.io/badge/Shine-orange?style=flat)](https://physino.xyz/shine)

It is the user's responsibility to provide a detector model for a Geant4 simulation. The [Geant4 User Guide for Application Developers] provides detailed instruction on how to [program detector definition and response in C++]. Again, an [end user] is forced to become an [application developer] if he or she chooses to go that route.

[program detector definition and response in C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/detector.html

Fortunately, Geant4 also allows [end users] to write their detector definition in two simpler ways:

- [Text geometry description][tg] (manual: [pdf](https://cern.ch/geant4/collaboration/working_groups/persistency/docs/textgeom.pdf), [html](http://fismed.ciemat.es/GAMOS/GAMOS_doc/GAMOS.6.0.0/Geometry/Geometry.html))
- [GDML][]

Their difference is similar to that between [markdown][md] and [HTML][]. The simpler [text geometry description][tg] is the easiest to learn.

However, writing in a text file is not the most intuitive way to construct and debug 3D geometries. A graphic user interface (UI) is better suited for this task. [Shine][] is such a UI on the web. One can use the mouse to select, place, rotate basic shapes on a canvas, and export the constructed detector model to a [text geometry][tg] file, which can be read by Geant4.

![Shine: a Web UI for Geant4](https://lh3.googleusercontent.com/d/1IYnxORUysfgw7ymhGuH_jlVCUpe2lsd-)

### Geant4 Container
[![physino/geant4](https://img.shields.io/badge/physino-geant4-blue?style=flat)](https://hub.docker.com/r/physino/geant4)

#### For Docker Users

[compose.yml](compose.yml) in this folder provides the following command to quickly start your container with automatic volume and port mapping to the host:

```sh
docker compose run geant4
```

There are two ways to download the [compose.yml](compose.yml) file:

```sh
# direct downloading using curl:
curl -LO https://github.com/jintonic/geant4/raw/main/compose.yml
# or using git:
git clone https://github.com/jintonic/geant4 .
```

The [git][] command may fail if your `~/geant4` folder is not empty. In that case, you can use the following commands as a workaround:

```sh
# create local git repository in the current folder
git init
# connect local git repository with the remote one
git remote add origin https://github.com/jintonic/geant4
# pull remote contents to the local repository
git pull origin main
# map remote and local branches so that `git pull` works in the future
git branch --set-upstream-to=origin/main main
```

#### For Apptainer Users

Use the following command to get into the container in a Linux host that has [Apptainer][] installed.

```sh
apptainer exec docker://physino/geant4 bash --login
```

Without the `--login` option, an interactive, non-login shell will be created for the container, and the host's `~/.bashrc` is sourced. In a Ubuntu, Debian, or Arch-based Linux host, `~/.bashrc` doesn't source `/etc/bashrc` in the container, where `GEANT4_DATA_DIR` is declared to be `~/geant4/data`. The `--login` option is used to create an interactive, login shell, which will source the `/etc/profile` file in the container before it sources the `~/.bashrc` file in the host. The `/etc/profile` file sources the `/etc/bashrc` file internally. This way, the `GEANT4_DATA_DIR` environment variable is defined for the container created.

If `GEANT4_DATA_DIR` is declared in the host already, it will be inherited by the container. There is no need to declare it again in the container. In this case, `--login` is not needed. For example, the following combination works just fine.

```sh
export GEANT4_DATA_DIR=~/path/to/geant4/data/in/the/host/
apptainer exec docker://physino/geant4 bash
```

#### Download Official Geant4 Examples

[![GEARS](https://img.shields.io/badge/GEARS-red?style=flat)](https://www.github.com/jintonic/gears)
[![MinGLE](https://img.shields.io/badge/MinGLE-blue?style=flat)](https://www.github.com/jintonic/mingle)
[![Official Examples](https://img.shields.io/badge/Official-Examples-green?style=flat)](https://github.com/Geant4/geant4/tree/master/examples)

[GEARS][] and [MinGLE][] are more [end user] friendly than official geant4 examples. However, if you've already grown out of them and want to learn more, the best way to download a single example from <https://github.com/Geant4/geant4/tree/master/examples> is to follow this [StackOverflow][] post: <https://stackoverflow.com/a/70729494/1801749>.

[official geant4 examples]: https://github.com/Geant4/geant4/tree/master/examples

## For Application Developer
[![GEARS](https://img.shields.io/badge/GEARS-red?style=flat)](https://www.github.com/jintonic/gears)
[![MinGLE](https://img.shields.io/badge/MinGLE-blue?style=flat)](https://www.github.com/jintonic/mingle)
[![Shine](https://img.shields.io/badge/Shine-orange?style=flat)](https://www.github.com/jintonic/shine)

This GitHub [repository] was originally created to avoid duplicating common [Geant4][] related stuff (e.g. datasets, containers, documentation, etc.) in individual [Geant4][] applications, such as [GEARS][] and [MinGLE][]. It has evolved into a central hub to collect and disseminate my ideas and effort toward a more [end user] friendly Geant4 ecosystem. Welcome to join [me][] if you are interested in the development of [Shine][], [GEARS][], [MinGLE][], or YouTube [tutorials][].

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

