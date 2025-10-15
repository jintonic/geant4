[![Home](https://img.shields.io/badge/Home-blue?style=flat)](..)
[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://www.youtube.com/playlist?list=PLw3G-vTgPrdBQEyRxeCcKIgPLqIgDBLf8)
[![ROOT](https://img.shields.io/badge/ROOT-green?style=flat)](root)
[![Python](https://img.shields.io/badge/Python-orange?style=flat)](python)
[![Julia](https://img.shields.io/badge/Julia-purple?style=flat)](julia)

# Geant4 Data Analysis

It is the user's responsibility to extract and save information from a Geant4 simulation. Please watch the first a few minutes of the following video to have a rough idea how this can be done. You don't have to understand everything mentioned in this video, but the take-away messages are:

- There are multiple ways to extract information from a Geant4 simulation, [some requires no C++ coding](https://github.com/jintonic/mingle?tab=readme-ov-file#scorer), others do.
- One of my Geant4 [example](../examples) application [GEARS] can save most useful information from a simulation. It covers most user cases. You, as an end user, do not have to replicate this effort. Simply just use it.

<iframe width="640" height="360" src="https://www.youtube.com/embed/Iza2gY-HCsI?si=QPpTUVgGZf_M2tYd" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Geant4 allows a user to save data in 4 different format. Please watch the following video to learn more. I recommend [ROOT](root), because

- It exists in any Geant4 installation. No additional effort is needed to enable it.
- A [ROOT](root) file is a compressed binary file, it ensures very small disk usage for large amount of data.
- [ROOT](root) provides a nice user interface to analyze a file in [ROOT](root) format.
- [Python](python) and [Julia](julia) can be used to read a [ROOT](root) file.
  
<iframe width="640" height="360" src="https://www.youtube.com/embed/CEniIMd67X8?si=nnbfg8GMqtJCpL10" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>