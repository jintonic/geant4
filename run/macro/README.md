[![UI](https://img.shields.io/badge/User-Interface-blue?style=flat)](..)

# Geant4 Macro Commands

[Geant4](../..) provides many built-in [commands][] for users to control their simulation. They can be executed one by one through various Geant4 [UI](..), or grouped in a file, called macro, to be executed as a bundle.

The usage of these [commands][] can be found online [here](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_.html), or generated locally using the macro file, [generateManuals.mac][]:

~~~sh
gears generateManuals.mac
~~~

assuming that [GEARS][] (or any Geant4 [example](../../examples) is available in your system. The command generates a list of macro [commands][] in HTML format in a sub-folder `cmds/`, as well as built-in [colors][], [materials][], [particles][], [processes][] and [units][].

> **NOTE**
> [generateManuals.mac][] uses some commands that are only available on Linux/WSL/Mac. If you are on Windows, the generated HTML files will stay in the current folder. Lists of [colors][], [materials][], [particles][], [processes][] and [units][] can be printed out using the following commands:

~~~sh
gears listColors.mac
gears listMaterials.mac
gears listParticles.mac
gears listProcesses.mac
gears listUnits.mac
~~~

All macro files can be found on <https://github.com/jintonic/geant4/tree/main/run/macro>.

Another way for Windows users to list useful information is to use a GUI menu defined in [gui.mac][], which is called by [generateManuals.mac][]. Simply run `gears` in this folder and open [generateManuals.mac][] through the GUI and you should be able to see some more menus showing up in the GUI. Select one of them to see the output on the GUI.

[commands]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Control/commands.html
[generateManuals.mac]: https://github.com/jintonic/geant4/blob/main/run/macro/generateManuals.mac
[gui.mac]: https://github.com/jintonic/geant4/blob/main/run/macro/gui.mac
[GEARS]: https://github.com/jintonic/gears
[colors]: colors.txt
[materials]: materials.txt
[particles]: particles.txt
[processes]: processes.txt
[units]: units.txt
