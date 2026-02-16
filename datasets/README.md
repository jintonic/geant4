[![Home](https://img.shields.io/badge/Home-/-blue?style=flat)](..)
[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtu.be/62KUamdelkU)

# Geant4 Datasets

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

The location of the dataset folder can be specified during the compilation of Geant4 source code. One can also choose to automatically install the datasets during the compilation process. This won't happen if one choose to install pre-compiled Geant4 libraries on Windows. Batch files in [this folder](https://github.com/jintonic/geant4/tree/main/datasets), such as [11.3.bat](11.3.bat), can be used to automatically download the datasets for different versions of Geant4 and set `GEANT4_DATA_DIR` accordingly. Simply copy it in a folder, double click to run it, and all datasets will be downloaded to that folder and `GEANT4_DATA_DIR` will be set accordingly as well.

<iframe width="640" height="360" src="https://www.youtube.com/embed/62KUamdelkU?si=AtA8usf-7yGb05Wc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Some of the datasets may get updated together with a major Geant4 release, others may not. It is possible to re-use those datasets that are not updated as described in the video below (Note: the Window batch script mentioned there are replaced by the ones mentioned in the video above!)

<iframe width="640" height="340" src="https://www.youtube.com/embed/Ox7a4XQp1hY?si=3dK_etO1rcZO-uv7" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
