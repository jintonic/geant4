[![Home](https://img.shields.io/badge/Home-blue?style=flat)](../..)
[![Visualization](https://img.shields.io/badge/Visualization-Drivers-orange?style=flat)](..)
[![Art Gallery](https://img.shields.io/badge/Art-Gallery-red?style=flat)](https://youtube.com/playlist?list=PLw3G-vTgPrdCRH66iijLnuAngdKD_I9Rs&si=q7brfL8sqM2crfup)

# TSG

[TSG] is a very versatile Geant4 visualization driver. You can use it with or without a Geant4 GUI. It's my favorite driver for the creation of [animated Geant4 visualization examples](https://www.youtube.com/@physino/shorts).

## Limitations

[TSG_FILE][] can only be saved using [/vis/viewer/rebuild][] command, which ignores settings specified by [/vis/viewer/set/timeWindow][]. It cannot be used for the animation of particle movement.

[TSG]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Visualization/visdrivers.html#toolssg
[TSG_FILE]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Visualization/visdrivers.html#toolssg
[/vis/viewer/rebuild]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_vis_viewer_.html#c19
[/vis/viewer/set/timeWindow]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_vis_viewer_set_timeWindow_.html
