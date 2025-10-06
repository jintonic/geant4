[![Home](https://img.shields.io/badge/Home-blue?style=flat)](../..)
[![Visualization](https://img.shields.io/badge/Visualization-Drivers-orange?style=flat)](..)

# OpenGL

[OpenGL][] is the probably the only visualization driver that can be used to animate particles' motion through their global time.

```c++
// only "rich" trajectories contain time information
/vis/scene/add/trajectories rich
// time interval needs to be set with one of the trajectory models
/vis/modeling/trajectories/create/drawByParticleID
/vis/modeling/trajectories/drawByParticleID-0/default/setTimeSliceInterval 0.01 ns
// let the particle go
/run/beamOn
// set start time and a time window after the start time
/vis/viewer/set/timeWindow/startTime 0 ns 0.05 ns
// save the view to a file, g4_00.g4view
/vis/viewer/save
// save next view to a file, g4_01.g4view
/vis/viewer/set/timeWindow/startTime 1 ns 0.05 ns
/vis/viewer/save
// ...
// change all views together and create a lot of G4OpenGL_viewer-0_????.jpg
/vis/viewer/interpolate ! ! ! ! export
```

One can create animation using the jpg files exported from Geant4:

```sh
ffmpeg -i "G4OpenGL_viewer-0_%4d.jpg" -y animation.gif
```

[OpenGL]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Visualization/visdrivers.html#opengl
