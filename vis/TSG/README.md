[![Home](https://img.shields.io/badge/Home-/-blue?style=flat)](../..)
[![Visualization](https://img.shields.io/badge/Visualization-/-orange?style=flat)](..)

# TSG
[![Art Gallery](https://img.shields.io/badge/Art-Gallery-red?style=flat)](https://youtube.com/playlist?list=PLw3G-vTgPrdCRH66iijLnuAngdKD_I9Rs&si=q7brfL8sqM2crfup)

[TSG][] is a very versatile Geant4 visualization driver. You can use it with ([TSG][]) or without ([TSG_FILE][]) a Geant4 GUI. It's my favorite driver for the creation of [animated Geant4 visualization examples](https://www.youtube.com/@physino/shorts).

From the output of `/vis/list` below, you can see that [TSG][] is the same as [OGL](../OpenGL), while [TSG_FILE][] is the same as `TOOLSSG_OFFSCREEN`, a viewer used to create image files instead of an interactive window.

```
Registered graphics systems are:
  G4HepRepFile (HepRepFile)
  ASCIITree (ATree)
  DAWNFILE (DAWNFILE)
  RayTracer (RT)
  VRML2FILE (VRML2FILE)
  gMocrenFile (gMocrenFile)
  TOOLSSG_OFFSCREEN (TSG_OFFSCREEN, TSG_FILE)
  OpenGLImmediateX (OGLIX, OGLI)
  OpenGLStoredX (OGLSX, OGLS)
  TOOLSSG_X11_GLES (TSG_X11_GLES, TSGX11, TSG, OGL)
  TOOLSSG_X11_ZB (TSG_X11_ZB, TSGX11ZB, TSGZB)
```

# TSG_FILE

Since [TSG_FILE][] is used to generate image files without a Geant4 GUI, it can be used in a container, or in a remote server:

```
/vis/open TSG_FILE
/vis/drawVolume
# dump the visualization to a png file
/vis/viewer/refresh
```

[TSG]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Visualization/visdrivers.html#toolssg
[TSG_FILE]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Visualization/visdrivers.html#toolssg
