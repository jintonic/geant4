
[![Home](https://img.shields.io/badge/Home-blue?style=flat)](../..)
[![Get Geant4](https://img.shields.io/badge/Get-Geant4-red?style=flat)](..)
[![physino/geant4](https://img.shields.io/badge/physino-geant4-orange?style=flat)](https://cloud.sylabs.io/library/physino/geant4/latest)

# Apptainer

The Geant4 [Apptainer][]/[Singularity][] image can be pulled from [sylabs][]:

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

## For Apptainer Image Developer

[g4.def] in this folder is used to generate the [Apptainer][]/[Singularity][] images from the physino/geant4 Docker image using the following commands:

```sh
apptainer build --fakeroot geant4.sif g4.def
```

You can also use the remote build option provided by [Singularity][] to build the image in <https://cloud.sylabs.io>:

```sh
apptainer build -r geant4.sif g4.def
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

[Apptainer]: https://apptainer.org
[Singularity]: https://en.wikipedia.org/wiki/Singularity_(software)
[sylabs]: https://cloud.sylabs.io/library/physino/geant4/latest
[remote]: https://apptainer.org/docs/user/1.0/endpoint.html
[g4.def]: https://github.com/jintonic/geant4/blob/main/platform/apptainer/g4.def