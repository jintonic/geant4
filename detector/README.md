# Detector Definition

[![CSG](https://img.shields.io/badge/CSG-Solids-blue?style=flat)](CSG)
[![Parameterisation](https://img.shields.io/badge/Parameterized-Placement-red?style=flat)](parameterisation)
[![Replica](https://img.shields.io/badge/Replicated-Placement-yellow?style=flat)](replica)

[Geant4][] provides 3 ways for its users to define their own detector models:

- [C++][]: the **hardest to use and master**, yet described in detail in Geant4 [User Guide for Application Developers][guide], and demonstrated in most Geant4 official [examples][]
- [Text with simple syntax][tg]: the **easiest to use and surprisingly versatile**, but only briefly mentioned in Geant4 [User Guide for Application Developers][guide] with an outdated [manual][].
- [GDML][]: XML files for exchange of geometry data between programs, such as [CAD], Geant4 and ROOT. It is an optional feature in Geant4 and may not be enabled for every Geant4 installation.

Their difference is similar to that between [markdown][md] and [HTML][]. The simpler [text geometry description][tg] provided by [Geant4][] is recommended to be used as [GEARS][]'s input given its simplicity and readability. For example, an experimental hall filled with air and of a dimension of 10 x 10 x 10 meters can be easily implemented using the following line:

[manual]: https://cern.ch/geant4/collaboration/working_groups/persistency/docs/textgeom.pdf
