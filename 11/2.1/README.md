## For users

Please visit <https://hub.docker.com/r/physino/geant4>.

## For developers

This folder contains the [Dockerfile](Dockerfile) to create [physino/geant4:minimal](https://hub.docker.com/r/physino/geant4/tags).

### Create image using docker

```sh
cd /path/to/this/folder
docker build -t physino/geant4:11.2.1 .
docker push physino/geant4:11.2.1
```

### Create image using docker compose

There is an service called `g4` defined in [../../compose.yml](../../compose.yml), which can be used to simplify the commands above to:

```sh
cd /path/to/mingle
docker compose build g4
docker compose push g4
```
