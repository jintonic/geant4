```cpp
:volu hall BOX 1*m 1*m 1*m G4_AIR
// without the following line,
// HepRepFile won't show the volume,
// but Qt will show it in white
:color hall 0.8 0.9 0.1
// use the following command to disable the 
// visualization of the volume in all drivers
:vis hall OFF
```

```sh
# all /vis/viewer/set commands have no effort for HepRepFile
# but they do work in Qt
/vis/viewer/set/upVector 0 1 0 # y points up
/vis/viewer/set/viewpointVector 0 0 1 # view against z (beam view)
/vis/viewer/set/background 0 0.17 0.21 # solarized color: base03
```

