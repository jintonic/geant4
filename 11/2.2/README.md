## For users

Please visit <https://hub.docker.com/r/physino/geant4>.

## For developers

This folder contains the [Dockerfile](Dockerfile) to create [physino/geant4:11.2.2](https://hub.docker.com/r/physino/geant4/tags).

### Create image using docker

```sh
cd /path/to/this/folder
docker build -t physino/geant4:11.2.2 .
docker push physino/geant4:11.2.2
```

