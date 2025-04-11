[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/negc7_p_l_I)
[![Direction](https://img.shields.io/badge/Source-Direction-blue?style=flat)](..)

# Focused Beam

[GPS][] provides the following commands to focus one or multiple beams to a point:

~~~sh
/gps/ang/type focused
/gps/ang/focuspoint 0 0 0 cm
~~~

Ref.: [Geant4 User Guide for Application Developers](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/GettingStarted/generalParticleSource.html?highlight=gps#source-direction-and-angular-distribution).

A YouTube [short][] is created to demonstrate its effect in a fun way. Geometries are defined in [stars.tg][]. [GPS][] commands are in [gears.mac][]. [tsg.mac][] and [phi.mac][] are used to create a animated gif.

[GPS]: ../../..
[short]: https://youtube.com/shorts/negc7_p_l_I
[stars.tg]: https://github.com/jintonic/geant4/tree/master/source/direction/focused/stars.tg
[gears.mac]: https://github.com/jintonic/geant4/tree/master/source/direction/focused/gears.mac
[tsg.mac]: https://github.com/jintonic/geant4/tree/master/source/direction/focused/tsg.mac
[phi.mac]: https://github.com/jintonic/geant4/tree/master/source/direction/focused/phi.mac
