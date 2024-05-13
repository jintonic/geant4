## What is Geant4

[![Presentation slides](https://img.shields.io/badge/Presentation-Slides-orange?style=flat)](https://coyotesusd-my.sharepoint.com/:p:/g/personal/jing_liu_usd_edu/EbT7XcboP-ZIqc2d5Rf6pUYBAFLGL7NVs_Ubf-SCWhePrA?e=0Eb6ZO)

## Get Geant4

[![Geant4 container image](https://img.shields.io/badge/Geant4-containers-orange?style=flat)](https://hub.docker.com/r/physino/geant4)

### Download Geant4 Examples
The latest [Geant4][] examples can be found in <https://github.com/Geant4/geant4/tree/master/examples>. The best way to download a single example from there is described in a [StackOverflow][] post: <https://stackoverflow.com/a/70729494/1801749>.

### For Power Users

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

## For Developers
This repository is created to avoid [Geant4][] related stuff (e.g. datasets, examples, etc.) being duplicated in specific [Geant4][] applications, such as [GEARS][] and [MinGLE][].

[StackOverflow]: https://stackoverflow.com
[git]: https://git-scm.com
[Apptainer]: https://apptainer.org
[Geant4]: https://geant4.org
[GEARS]: https://github.com/jintonic/gears
[MinGLE]: https://github.com/jintonic/mingle

