[![Home](https://img.shields.io/badge/Home-/-blue?style=flat)](../..)
[![Visualization](https://img.shields.io/badge/Visualization-/-orange?style=flat)](..)

# RayTracer

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://www.youtube.com/watch?v=Z1p_U5SJN0I&t=261s)


The [RayTracer][] visualization driver is included in any Geant4 installation, and can be used for geometries that other tools may fail to visualize. Detailed instructions on [RayTracer][] related built-in commands can be found [here][].

A sample RayTracer [macro][] file is shipped with the source code of this website. It can be tried out if you have [GEARS] installed:

```sh
$ git clone https://github.com/jintonic/geant4
$ cd /path/to/geant4/vis/RayTracer
$ gears gears.mac
```

It generates a `g4RayTracer.viewer-0_0000.jpeg` file in the same directory. Note that the working principle of RayTracer is to shoot many rays (360000 by default) through the detector geometry and draw their intersecting points to reveal the geometry surfaces. Because of this, it takes more time than other methods to finish. It cannot be used to show particle trajectories, the world geometry, nor any cross section. Its advantage is to show complex geometry that other visualization method may fail.

[RayTracer]: http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Visualization/visdrivers.html#raytracer
[here]: http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_vis_rayTracer_.html
[macro]: https://github.com/jintonic/geant4/blob/main/vis/RayTracer/gears.mac
[GEARS]: https://github.com/jintonic/gears
