[![Home](https://img.shields.io/badge/Home-blue?style=flat)](../..)
[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtu.be/huNM04tHaiI)
[![physino/geant4](https://img.shields.io/badge/physino-geant4-blue?style=flat)](https://hub.docker.com/r/physino/geant4)

# Geant4 Containers

The [compilation][] of Geant4 C++ libraries and applications is a very challenging process for most end users who have limited experience on command-line user interface and C++ programming. The easiest way to bypass this challenge is to package both Geant4 libraries and some versatile [application]s into a single [container][] image that can be used in all operating systems without any modification.

[compilation]: https://www.youtube.com/playlist?list=PLw3G-vTgPrdB9Nt2ekl2oL1yoqEC294Uf
[container]: https://www.docker.com/resources/what-container

<https://hub.docker.com/r/physino/geant4> is such an image. It includes the [official Geant4 libraries pre-compiled on AlmaLinux 9](https://geant4.org/download) and two tiny universal Geant4 [application]s, [GEARS][] and [MinGLE][]. Both accept [detector](../../detector) definitions described in [simple text](../../detector).

[application]: https://www.youtube.com/watch?v=3g9CkyBS31o

To use this image, we need to install [Docker Desktop][], a program that manages container images and containers created from images. Please follow <https://youtu.be/RIBJ-2LsqsA> to get familiar with the program and the concept behind it. I promise, this is the only program you ever need to install to go from zero to hero in Geant4 simulation.

[Docker Desktop]: https://www.docker.com/products/docker-desktop

## Tools Provided in the Container

### Text Editor
[Fresh][] is chosen instead of [Vim][] or other classical text editors because it is very friendly to inexperienced users, and powerful enough for experienced users.

### Terminal
[tmux][] is a terminal multiplexer that can be used to manage multiple terminal sessions in the container. Mouse can be used to open/close/switch between tabs and windows.

### File Manager
[Yazi][] is a terminal file manager that can be used to manage files in the container. Mouse is supported. [Fresh][] is used by [Yazi][] to edit files. Press <kbd>s</kbd> in [Yazi][] to open a new **s**hell as a tab in [tmux][] in the current directory.

### Data Analysis Tools
[uproot][] is a Python library that can be used to read and write [ROOT][] files. [visidata][] is a terminal spreadsheet program that can be used to view and analyze data in a tabular format. [pandas][] and [seaborn][] are also installed as dependents of [uproot][] and [visidata][].

[Fresh]: https://github.com/Fresh-Editor/Fresh
[Vim]: https://www.vim.org
[Yazi]: https://github.com/yazi-rs/yazi
[tmux]: https://github.com/tmux/tmux
[uproot]: https://uproot.readthedocs.io
[ROOT]: https://root.cern/
[visidata]: https://www.visidata.org
[pandas]: https://pandas.pydata.org
[seaborn]: https://seaborn.pydata.org

> **Warning**
> The end user friendly documentation in this section is still under construction.
> Some knowledge about command-line operations is needed beyond this point.

## Docker Image

### For Docker Users

[compose.yml][] provides the following command to quickly start your container with automatic volume and port mapping to the host:

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

Use the following commands to get and convert a docker image to an apptainer image, create a container from it and get into the container:

```sh
apptainer pull geant4.sif docker://physino/geant4
apptainer exec geant4.sif bash --login
```

Without the `--login` option, an interactive, non-login shell will be created for the container, and the host's `~/.bashrc` is sourced. In a Ubuntu, Debian, or Arch-based Linux host, `~/.bashrc` doesn't source `/etc/bashrc` in the container, where `GEANT4_DATA_DIR` is declared to be `~/geant4/datasets`. The `--login` option is used to create an interactive, login shell, which will source the `/etc/profile` file in the container before it sources the `~/.bashrc` file in the host. The `/etc/profile` file sources the `/etc/bashrc` file internally. This way, the `GEANT4_DATA_DIR` environment variable is defined for the container created.

If `GEANT4_DATA_DIR` is declared in the host already, it will be inherited by the container. There is no need to declare it again in the container. In this case, `--login` is not needed. For example, the following combination works just fine.

```sh
export GEANT4_DATA_DIR=~/path/to/geant4/datasets/in/the/host/
apptainer exec docker://physino/geant4 bash
```

[GEARS]: https://github.com/jintonic/gears
[MinGLE]: https://github.com/jintonic/mingle
[compose.yml]: https://github.com/jintonic/geant4/blob/main/compose.yml
[StackOverflow]: https://stackoverflow.com
[git]: https://git-scm.com
