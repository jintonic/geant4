# Geant4 Containers

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtu.be/huNM04tHaiI)
[![physino/geant4](https://img.shields.io/badge/physino-geant4-blue?style=flat)](https://hub.docker.com/r/physino/geant4)

The [compilation][] of Geant4 C++ libraries and applications is a very challenging process for most end users who have limited experience on command-line user interface and C++ programming. The easiest way to bypass this challenge is to package both Geant4 libraries and some versatile [application]s into a single [container][] image that can be used in all operating systems without any modification.

[compilation]: https://www.youtube.com/playlist?list=PLw3G-vTgPrdB9Nt2ekl2oL1yoqEC294Uf
[container]: https://www.docker.com/resources/what-container

<https://hub.docker.com/r/physino/geant4> is such an image. It includes the [official Geant4 libraries pre-compiled on AlmaLinux 9](https://geant4.org/download) and two tiny universal Geant4 [application]s, [GEARS][] and [MinGLE][]. Both accept the `detector.tg` file exported from [Shine][].

[application]: https://www.youtube.com/watch?v=3g9CkyBS31o

To use this image, we need to install [Docker Desktop][], a program that manages container images and containers created from images. Please follow <https://youtu.be/RIBJ-2LsqsA> to get familiar with the program and the concept behind it. I promise, this is the only program you ever need to install to go from zero to hero in Geant4 simulation.

[Docker Desktop]: https://www.docker.com/products/docker-desktop

#### For Docker Users

> **Warning**
> The end user friendly documentation in this section is still under construction.
> Some knowledge about command-line operations is needed beyond this point.

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
## Tools

### Text Editor
[Micro][] is chosen instead of [Vim][] or other classical text editors because it is very friendly to inexperienced users, and powerful enough for experienced users.

### Markdown Viewer
A decent text editor can already show markdown files nicely. However, a viewer can avoid accidental modification of the original file from inexperienced users. It can also hide control marks from them to reduce confusion.

There are many terminal based markdown viewers. [mdv][] is chosen because it can be easily installed through [pip][]. Since we already choose quite some [Python][] tools, most prerequisites of [mdv][] should have been fulfilled. Adding [mdv][] won't change the image size a lot.

[Micro]: https://micro-editor.github.io
[Vim]: https://www.vim.org
[mdv]: https://github.com/axiros/terminal_markdown_viewer
[pip]: https://pypi.org/project/pip
[Python]: https://www.python.org

## Apptainer

[![physino/geant4](https://img.shields.io/badge/physino-geant4-blue?style=flat)](https://cloud.sylabs.io/library/physino/geant4/latest)

The [Geant4][] [Apptainer][]/[Singularity][] image can be pulled from [sylabs][]:

```sh
singularity pull geant4.sif library://physino/geant4/latest
```

or

```sh
apptainer pull library://physino/geant4/latest
```

Note that you may need to set the location of your [Apptainer][] [remote][] library before `pull`:

```sh
apptainer remote add sylabs https://cloud.sylabs.io
apptainer remote use sylabs
apptainer remote list
```

The `sif` file can be directly used as an executable:
```sh
./geant4.sif example.mac
```

### For Developer

[apptainer.def](apptainer.def) in this folder is used to generate the [Apptainer][]/[Singularity][] images from the physino/geant4 Docker image using the following commands:

```sh
apptainer build --fakeroot geant4.sif apptainer.def
```

You can also use the remote build option provided by [Singularity][] to build the image in <https://cloud.sylabs.io>:

```sh
apptainer build -r geant4.sif apptainer.def
```

I sign and push the image to <https://cloud.sylabs.io/library/physino/geant4/latest> using the following commands:

```sh
# create a PGP signature
apptainer key newpair
# use that signature to sign the image
apptainer sign geant4.sif
# get an access token from https://cloud.sylabs.io and then
apptainer remote login
apptainer push geant4.sif library://physino/geant4/latest
```

By default `apptainer pull libray://physino/geant4/latest` will pull `library://physino/geant4/latest:latest`. The `latest` tag has to be assigned to the image for this default behavior to work out.

[GEARS]: https://github.com/physino/gears
[Apptainer]: https://apptainer.org
[Singularity]: https://en.wikipedia.org/wiki/Singularity_(software)
[sylabs]: https://cloud.sylabs.io/library/physino/geant4/latest
[remote]: https://apptainer.org/docs/user/1.0/endpoint.html

