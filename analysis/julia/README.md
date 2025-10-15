[![Home](https://img.shields.io/badge/Home-blue?style=flat)](../..)
[![Analysis](https://img.shields.io/badge/Analysis-red?style=flat)](..)

# Julia for Geant4 Data Analysis

Utilizing <https://github.com/JuliaHEP/UpROOT.jl>, one can load simulation results in [ROOT][] format in [Julia][]:

```julia
julia> import Pkg
julia> Pkg.add("UpROOT")
julia> using UpROOT
julia> file = TFile("gears.root")
julia> tree = file["t"]
julia> tree.x
```

[Julia]: https://julialang.org
[ROOT]: https://root.cern.ch
