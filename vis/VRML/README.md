[![Home](https://img.shields.io/badge/Home-blue?style=flat)](../..)
[![Visualization](https://img.shields.io/badge/Visualization-Drivers-orange?style=flat)](..)
[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://www.youtube.com/watch?v=Z1p_U5SJN0I&t=366s)

# VRML

The [VRML][] visualization driver is available in any [Geant4][] installation. It is used to generate files, `g4_??.wrl`, which can be viewed online with [Shine][], or using an external program, such as [ParaView][], [castle model viewer][] (formerly *view3dscene*), [3D builder][] (Windows App), [ORBISNAP][] (not available for Macs with Apple silicon chips), [FreeWRL][] (not available for Macs with Apple silicon chips), [OpenVRML][] (10 years old!), etc., or be converted to its succeeder [X3D][], which can be viewed directly in a modern web browser that supports WebGL.

[VRML]:http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Visualization/visdrivers.html#vrml
[Geant4]: https://physino.xyz/geant4
[Shine]: https://physino.xyz/shine
[ParaView]: https://www.paraview.org
[castle model viewer]: https://castle-engine.io/castle-model-viewer
[3D builder]: https://apps.microsoft.com/detail/9wzdncrfj3t6
[ORBISNAP]:https://www.orbisnap.com/download2.html
[OpenVRML]:https://sourceforge.net/projects/openvrml
[FreeWRL]: http://freewrl.sourceforge.net/download.html
[X3D]:https://stackoverflow.com/questions/14849593/vrml-to-x3d-conversion

## Example

[detector.tg][] describes the model in the basic Geant4 example [B1][]. [mingle.mac][] and [gears.mac][] can be used by [MinGLE][] and [GEARS][], respectively, to generate `g4_??.wrl` from [detector.tg][].

```sh
# assume mingle is available in your PATH
mingle mingle.mac
# assume gears is available in your PATH
gears gears.mac
```

[detector.tg]: https://github.com/jintonic/geant4/blob/main/visualization/VRML/detector.tg
[B1]: https://github.com/Geant4/geant4/tree/master/examples/basic/B1
[mingle.mac]: https://github.com/jintonic/geant4/blob/main/visualization/VRML/mingle.mac
[gears.mac]: https://github.com/jintonic/geant4/blob/visualization/VRML/gears.mac
[MinGLE]: https://github.com/jintonic/mingle
[GEARS]: https://github.com/jintonic/gears

## Limitations

[VRML][] doesn't show texts. The following macro commands do not work (at least not fully) in [VRML][].

```sh
/vis/scene/add/date
/vis/scene/add/text
/vis/scene/add/text2D
/vis/scene/add/logo2D
/vis/scene/add/eventID
/vis/scene/add/axes  # axes show, but without label and color
/vis/scene/add/scale # scale shows, but without label
```

The command to generate a 3D G4 logo ([/vis/scene/add/logo][]) works because the logo is made of two 3D objects.

The color of a volume specified by [/vis/geometry/set/colour][] `volumeName ! 0.3 0.6 0.7 0.3` is saved in `g4_??.wrl`, but the opacity setting is not, because the opacity of a volume can normally be tuned in a [VRML][] viewer.

Colors of trajectories are saved in `g4_??.wrl`. They can be shown correctly in some [VRML][] viewers. However, their color settings are not obeyed in the wireframe mode in a [VRML][] viewer.

A volume turned off by [/vis/geometry/set/visibility][] `volumeName ! false` will not be saved in `g4_??.wrl`.

Setting [/vis/viewer/set/style][] `surface/wireframe/cloud` is not saved in `g4_??.wrl`. But they can be toggled in a [VRML][] viewer.

Settings related to viewpoint or orientations seem to have no effect, because they can be changed in a [VRML][] viewer.

[/vis/scene/add/logo]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_vis_scene_add_.html#c15
[/vis/geometry/set/colour]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_vis_geometry_set_.html#c0
[/vis/geometry/set/visibility]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_vis_geometry_set_.html#c9
[/vis/viewer/set/style]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_vis_viewer_set_.html#c27

