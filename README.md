Geant4 container configurations

### Apptainer

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

## For developer
This repository is created to avoid [Geant4][] related stuff (e.g. datasets, examples, etc.) being duplicated in specific [Geant4][] applications, such as [GEARS][] and [MinGLE][].

[Apptainer]: https://apptainer.org
[Geant4]: https://geant4.org
[GEARS]: https://github.com/jintonic/gears
[MinGLE]: https://github.com/jintonic/mingle

