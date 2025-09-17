## Geant4 Datasets

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtu.be/OIhNBPfaTm8)

Geant4 fetches information from multiple datasets. They must be downloaded and unzipped in your hard disk before you can run any Geant4 application successfully. They can be unzipped into any folder. However, the location needs to be saved in an environment variable `GEANT4_DATA_DIR`. Geant4 relies on this variable to find these datasets. If Geant4 fails to find some of the datasets, it may give error messages such as,

```
-------- EEEE ------- G4Exception-START -------- EEEE -------
*** G4Exception : PART70000
      issued by : G4NuclideTable
G4ENSDFSTATEDATA environment variable must be set
*** Fatal Exception *** core dump ***
 **** Track information is not available at this moment
 **** Step information is not available at this moment
-------- EEEE -------- G4Exception-END --------- EEEE -------
```

The location of the dataset folder can be specified during the compilation of Geant4 source code. One can also choose to automatically install the datasets during the compilation process. This won't happen if one choose to install pre-compiled Geant4 libraries on Windows. Batch files in this folder, such as [11.3.bat](11.3.bat), can be used to automatically download the datasets for different versions of Geant4 and set `GEANT4_DATA_DIR` accordingly. Simply copy it in a folder, double click to run it, and all datasets will be downloaded to that folder and `GEANT4_DATA_DIR` will be set accordingly as well.
