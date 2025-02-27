## Visualization in HepRApp Data Browser

```cpp
:volu hall BOX 1*m 1*m 1*m G4_AIR
// without specifying color, HepRepFile won't show the volume, but Qt will
:color hall 0.8 0.9 0.1
// use the following to disable visualization in all drivers, w/o color
:vis hall OFF
```

```sh
# This command add x,y,z axes (right-handed system) in HepRepFile
# HepRApp Data Browser shows an axis as a hexagonal stick + a tetrahedra
# By default, x is shown in red, y in green, z in blue
/vis/scene/add/axes
```

## Views in HepRApp Data Browser

- Beam view: see against z; y points up; x points to the right.
- Top view: see against y; x points up; z points to the right.
- Side view: see along x; y points up; z points to the right.

```sh
# all /vis/viewer/set commands have no effort for HepRepFile
# but they do work in Qt
/vis/viewer/set/upVector 0 1 0 # y points up
/vis/viewer/set/viewpointVector 0 0 1 # view against z (beam view)
/vis/viewer/set/background 0 0.17 0.21 # solarized color: base03
```

