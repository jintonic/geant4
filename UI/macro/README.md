[![UI](https://img.shields.io/badge/User-Interface-blue?style=flat)](..)

# Geant4 Macro Commands

[Geant4](../..) provides many built-in [commands][] for users to control their simulation. They can be executed one by one through various Geant4 [UI](..), or grouped in a file, called macro, to be executed as a bundle.

The usage of these [commands][] can be found online [here](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_.html), or generated locally using the macro file, [generateManuals.mac][]:

~~~sh
mingle generateManuals.mac
~~~

assuming that [MinGLE][] (or any Geant4 [examples](../../examples) is available in your system. The command generates a list of macro [commands][] in HTML format in a sub-folder `cmds/`, as well as built-in [colors][], [materials][], [particles][], and [units][].

> **NOTE**
> [generateManuals.mac][] uses some commands that are only available on Linux/WSL/Mac. If you are on Windows, the generated HTML files will stay in the current folder. Lists of [colors][], [materials][], [particles][], and [units][] can be printed out using the following commands:

~~~sh
mingle listColors.mac
mingle listMaterials.mac
mingle listParticles.mac
mingle listUnits.mac
~~~

All macro files can be found on <https://github.com/jintonic/geant4/UI/macro>.

[commands]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Control/commands.html
[generateManuals.mac]: https://github.com/jintonic/geant4/blob/main/UI/macro/generateManuals.mac
[colors]: colors.txt
[materials]: materials.txt
[particles]: particles.txt
[units]: units.txt
