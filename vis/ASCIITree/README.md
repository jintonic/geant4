# ASCIITree

[![Home](https://img.shields.io/badge/Home-blue?style=flat)](../..)
[![Visualization](https://img.shields.io/badge/Visualization-Drivers-orange?style=flat)](..)
[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtu.be/Z1p_U5SJN0I?t=59)

The [ASCIITree][] visualization driver is available in any geant4 installation. It does not really visualize anything. Instead, it prints a hierarchical list of volumes defined in your Geant4 simulation in a terminal. This seems not very useful, but is one of my favorite ways to understand a detector model created by other people, especially if it is written in [C++][] or [GDML][], which is hard to read.

If your geometry is simple, the only two commands you need in your macro is:

```
/vis/ASCIITree/verbose 13
/vis/drawTree
```

The following is the output of these commands for Geant4 basic example [B3][]:

~~~sh
#  Format is: PV:n / LV (SD,RO) / Solid(type), volume, density
#  Abbreviations: PV = Physical Volume,     LV = Logical Volume,
#                 SD = Sensitive Detector,  RO = Read Out Geometry.
  "World":0 / "World" / "World"(G4Box), 421.919 L  , 1.20479 mg/cm3 (G4_AIR)
    "Detector":0 / "Detector" / "Detector"(G4Tubs), 34.3732 L  , 1.20479 mg/cm3 (G4_AIR)
      "ring":0 / "Ring" / "Ring"(G4Tubs), 3.81924 L  , 1.20479 mg/cm3 (G4_AIR)
        "crystal":0 / "CrystalLV" (SD="crystal") / "crystal"(G4Box), 1.06208 dL , 7.4 g/cm3  (Lu2SiO5)
        "crystal":1 / "CrystalLV" (SD="crystal") / "crystal"(G4Box), 1.06208 dL , 7.4 g/cm3  (Lu2SiO5)
        "crystal":2 / "CrystalLV" (SD="crystal") / "crystal"(G4Box), 1.06208 dL , 7.4 g/cm3  (Lu2SiO5)
        ...
~~~

As you can see, we learn a lot from the output, such as the physical and logical volume names, the associated geometries and materials, etc. The indentation of lines shows the hierarchy of these volumes. In this example, there is a "Detector" in the "World", the "Detector" is made of many "ring"s, each contains many "crystal"s.

If your geometry is complicated, you can select to print only a subset of the structure using the name and copy number of the **physical** volume that you are interested in:

~~~sh
/vis/open ATree
/vis/drawVolume crystal 11
/vis/viewer/flush
  "crystal":11 / "CrystalLV" (SD="crystal") / "crystal"(G4Box), 1.06208 dL , 7.4 g/cm3  (Lu2SiO5)
  "crystal":11 / "CrystalLV" (SD="crystal") / "crystal"(G4Box), 1.06208 dL , 7.4 g/cm3  (Lu2SiO5)
  "crystal":11 / "CrystalLV" (SD="crystal") / "crystal"(G4Box), 1.06208 dL , 7.4 g/cm3  (Lu2SiO5)
  "crystal":11 / "CrystalLV" (SD="crystal") / "crystal"(G4Box), 1.06208 dL , 7.4 g/cm3  (Lu2SiO5)
  "crystal":11 / "CrystalLV" (SD="crystal") / "crystal"(G4Box), 1.06208 dL , 7.4 g/cm3  (Lu2SiO5)
  "crystal":11 / "CrystalLV" (SD="crystal") / "crystal"(G4Box), 1.06208 dL , 7.4 g/cm3  (Lu2SiO5)
  "crystal":11 / "CrystalLV" (SD="crystal") / "crystal"(G4Box), 1.06208 dL , 7.4 g/cm3  (Lu2SiO5)
  "crystal":11 / "CrystalLV" (SD="crystal") / "crystal"(G4Box), 1.06208 dL , 7.4 g/cm3  (Lu2SiO5)
  "crystal":11 / "CrystalLV" (SD="crystal") / "crystal"(G4Box), 1.06208 dL , 7.4 g/cm3  (Lu2SiO5)
G4ASCIITreeSceneHandler::EndModeling
~~~

We can see that there must be 9 "ring"s in the "Detector", each of them contains a "crystal" numbered 11.

Note that the name is case sensitive, you won't be able to find "crystal" if you type "Crytal":

~~~
/vis/open ATree
/vis/drawVolume Crystal 11
/vis/viewer/flush
ERROR: Volume "Crystal", copy no. 11, not found.
~~~

[ASCIITree]:http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Visualization/visdrivers.html#visualization-of-detector-geometry-tree
[B3]: https://github.com/Geant4/geant4/tree/master/examples/basic/B3
[C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomSolids.html#constructed-solid-geometry-csg-solids
[GDML]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/Geometry/geomXML.html
