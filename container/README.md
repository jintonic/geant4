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

