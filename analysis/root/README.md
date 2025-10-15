[![Home](https://img.shields.io/badge/Home-blue?style=flat)](../..)
[![Analysis](https://img.shields.io/badge/Analysis-red?style=flat)](..)
[![Jupyter](https://img.shields.io/badge/Jupyter-notebook-green?style=flat)](notebook)
[![Docker](https://img.shields.io/badge/Docker-images-orange?style=flat)](#docker-images)

# ROOT for Geant4 Data Analysis

[ROOT][] is **NOT** needed to compile or run [Geant4][]. It is not even needed for the analysis of Geant4 output files. Instead, one can use [uproot][] to read a [ROOT] file using [Python](../python) or [Julia](../julia). However, it is very convenient to analyze Geant4 output data in a [ROOT][] interactive session using [TTree][]::[Draw][]. The compilation of [ROOT][] takes a long time. However, installation of pre-compiled [ROOT][] libraries is very easy.

## Install Pre-compiled ROOT on Windows

<iframe width="640" height="360" src="https://www.youtube.com/embed/Q4t3pztSnMo?si=wd1QKtFKwsl8vRk9" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Install Pre-compiled ROOT on MacOS

[Homebrew][] includes a [ROOT formula](https://formulae.brew.sh/formula/root). The easiest way to install [ROOT][] is to run

```sh
brew install root
```

assuming that you already have [Homebrew][] and [Xcode][] installed already.

<iframe width="640" height="360" src="https://www.youtube.com/embed/GrEFp4pXkd4?si=LWCZlVOhr1zGxv5H" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Install Pre-compiled ROOT on Linux

Please refer to <https://root.cern/install/> for detailed instruction. If you use Debian, Ubuntu, or Mint Linux, please watch the following tutorial.

<iframe width="640" height="360" src="https://www.youtube.com/embed/8Q4_SipwAPQ?si=T_FW2bzGwdN2LkvB" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Docker Images

Another way to obtain [ROOT][] is to use a [Docker][] container that has [ROOT][] pre-installed in it. Official [ROOT][] [Docker][] images on <https://hub.docker.com/r/rootproject/root> only work on `linux/amd64` architecture. [Dockerfile][] in this folder is used to create [physino/root:latest][] for multiple architectures, including `linux/arm64` for Apple Silicon chips. The usage of these images can be found on <https://hub.docker.com/r/physino/root>.

### For Image Creators

The procedure of creating multi-architecture images is described in detail on <https://docs.docker.com/build/building/multi-platform/>. The key is to create a customized builder and use it to build and push multiple images together:

```sh
# list default builder
docker buildx ls
# create a new builder
docker buildx create --name mybuilder --driver docker-container --bootstrap
# use the new builder
docker buildx use mybuilder
# inspect the new builder
docker buildx inspect
# list all builders again as well as architectures supported
docker buildx ls
# create multiple images
cd /path/to/this/folder
docker build --platform linux/amd64,linux/arm64 -t physino/root:latest --push .
```

The [Dockerfile][] in this folder uses [fedora:latest][] as its base, which is a rather modern Linux distribution that has [ROOT][] in its package repository.

[Geant4]: ../..
[TTree]: https://root.cern/manual/trees
[Draw]: https://root.cern.ch/doc/master/classTTree.html#a73450649dc6e54b5b94516c468523e45
[ROOT]: https://root.cern.ch
[uproot]: https://pypi.org/project/uproot
[Python]: https://www.python.org/
[Homebrew]: https://brew.sh
[Xcode]: https://developer.apple.com/xcode
[Docker]: https://www.docker.com
[physino/root:latest]: https://hub.docker.com/r/physino/root
[fedora:latest]: https://hub.docker.com/_/fedora
[Dockerfile]: https://github.com/jintonic/geant4/blob/main/analysis/root/Dockerfile
