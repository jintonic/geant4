[![Home](https://img.shields.io/badge/Home-blue?style=flat)](../..)
[![Visualization](https://img.shields.io/badge/Visualization-Drivers-orange?style=flat)](..)

# RayTracer

The [RayTracer][] visualization driver is included in any Geant4 installation, and can be used for geometries that other tools may fail to visualize. Detailed instructions on [RayTracer][] related built-in commands can be found [here](http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_vis_rayTracer_.html).

<iframe width="640" height="360" src="https://youtu.be/Z1p_U5SJN0I?list=PLw3G-vTgPrdATGRFqclPsXrxgHl9G4Ov6&t=261" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

A sample RayTracer [macro] file is shipped with this guide. It can be tried out if you have [GEARS] or [MinGLE] installed:

```sh
$ git clone https://github.com/jintonic/geant4
$ cd /path/to/geant4/vis/RayTracer
$ gears RayTracer.mac
# or mingle RayTracer.mac
```

It generates a `g4RayTracer.viewer-0_0000.jpeg` file in the same directory. Note that the working principle of RayTracer is to shoot many rays (360000 by default) through the detector geometry and draw their intersecting points to reveal the geometry surfaces. Because of this, it takes more time than other methods to finish. It cannot be used to show particle trajectories, the world geometry, nor any cross section. Its advantage is to show complex geometry that other visualization method may fail.

[RayTracer]: http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Visualization/visdrivers.html#raytracer
[GEARS]: https://github.com/jintonic/gears
[MinGLE]: https://github.com/jintonic/mingle