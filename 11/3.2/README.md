## For Users

Please visit <https://hub.docker.com/r/physino/geant4>.

## For Developers

This folder contains the [Dockerfile](Dockerfile) to create [physino/geant4:11.3.1](https://hub.docker.com/r/physino/geant4/tags).

### Create Image Using Docker Compose

There is an service called `g4` defined in [../../compose.yml][], which can be used by `docker compose`:

```sh
cd /path/to/geant4
docker compose build g4
docker compose push g4
```

[../../compose.yml]: https://github.com/jintonic/geant4/blob/main/compose.yml

