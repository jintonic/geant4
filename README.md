[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://www.youtube.com/@physino)
[![Web UI](https://img.shields.io/badge/Web-UI-blue?style=flat)](shine:-web-ui-for-geant4)
[![Geant4 Container](https://img.shields.io/badge/Geant4-Container-yellow?style=flat)](geant4-container)

According to <https://geant4.org>, Geant4 is a
> **Toolkit** for the simulation of the passage of particles through matter.

which means that it is **NOT** a program that can be installed, double-clicked, and run.

Instead, Geant4 is provided as a set of C++ libraries that need to be compiled [^1]. One must write a C++ program (Geant4 application) that calls functions provided in the compiled Geant4 libraries. The application itself also needs to be compiled, before it can be double-clicked and run.

[^1]: The compiled ones only work in very specific operating systems.

Think Geant4 as a set of disassembled Lego pieces (libraries). One needs to put them together into a Lego model, such as a car, a plane, or a house, etc. (applications).

The Geant4 [Q&A] hence defines three types of users:

- the **end user**, who uses a Geant4 application written by someone else,
- the **application developer**, who writes a Geant4 application, and
- the **framework provider**, who updates or extends Geant4 libraries.

This tutorial is provided to flatten the steep learning curve of Geant4 for the first two types of users with some thoughts on how a framework provider can serve the first two better.

[Q&A]: https://geant4-userdoc.web.cern.ch/UsersGuides/IntroductionToGeant4/html/IntroductionToG4.html#software-knowledge-required-to-use-the-geant4-toolkit

## For End Users

Most of us are end users. All we need is a Geant4 application that has already been compiled for our operating system so that we can double click and run it. Geant4 does provide many [example applications] to show its muscles. However, too many choices actually paralyze a poor end user. Which one shall we choose?! A reasonable choice would be the simplest one. However, the simplest Geant4 application example, [B1][], has very limited functionality. To adopt it for our specific applications, we, as end users, are forced to learn how to modify and compile a Geant4 example application, and become an application developer. No wonder the first Geant4 User guide is for application developers instead of end users.

[example applications]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Examples/examples.html
[B1]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Examples/BasicCodes.html#exmpbasic-b1

According to <https://geant4.org/docs/#user-guides>, 
> If you are new to Geant4, we recommend that you read this document ([Geant4 User Guide for Application Developers]) first. The first part of the document provides a step-by-step tutorial in the use of Geant4; this is for a **novice** user. The second part describes the usage of the toolkit for practical applications, with a lot of example codes. After reading this part, you will be able to start to *write a detector simulation program* for most applications/experiments.

[Geant4 User Guide for Application Developers]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/index.html

The shocking fact is that there is **NO** guide for end users! This is understandable, because Geant4 is provided as a **toolkit** (individual Lego pieces), way more flexible than a specific **application** (a finished Lego model). Nevertheless, this is bad news for absolute beginners who need an executable application instead of a comprehensive but complicated toolkit.

Is it possible to provide a compiled Geant4 application that can be double clicked and run for different simulations on different operating systems? This is a mission impossible because

- There is no way to include all existing, or to-be-constructed radiation detectors or shielding geometries into one program. Even end users must be responsible for constructing their specific geometries.
- A C++ program must be compiled on a specific operating system to run on that system. A C++ program that is compiled on a Mac cannot be used on a Windows or a Linux computer.

However, there are ways to get closer to this goal. To solve the first problem, a web-based user interface <https://physino.xyz/shine> can be used by the end user to construct a specific detector or shielding structure without C++ programming. To solve the second problem, a docker image <https://hub.docker.com/r/physino/geant4> can be used to include Geant4 libraries and a Geant4 application that can read the output of <https://physino.xyz/shine>, which can be downloaded and run on all major operating systems.

### Shine: a web user interface for Geant4

### For Docker Users

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

### For Apptainer Users

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

### Download Geant4 Examples
The latest [Geant4][] examples can be found in <https://github.com/Geant4/geant4/tree/master/examples>. The best way to download a single example from there is described in a [StackOverflow][] post: <https://stackoverflow.com/a/70729494/1801749>.

## For Developers

This repository is created to avoid [Geant4][] related stuff (e.g. datasets, examples, etc.) being duplicated in specific [Geant4][] applications, such as [GEARS][] and [MinGLE][].

[StackOverflow]: https://stackoverflow.com
[git]: https://git-scm.com
[Apptainer]: https://apptainer.org
[Geant4]: https://geant4.org
[GEARS]: https://github.com/jintonic/gears
[MinGLE]: https://github.com/jintonic/mingle

