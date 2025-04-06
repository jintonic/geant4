# Beta interactions

Beta particles are electrons. As shown in the following plot taken from the review article [Passage of Particles Through Matter][review] in [PDG][], electrons lose their energies in matter primarily through ionizing atoms around them (Geant4 name: **eIoni**) below 10 MeV. More energetic electrons are more likely to generate photons through [Bremsstrahlung][] (Geant4 name: **eBrem**). Multiple scattering with orbiting electrons (Geant4 name: **msc**) is a subdominant way for an electron to lose energy.

<img style="width:100%;" alt="beta interactions" src="https://physino.xyz/gears/tutorials/physics/beta/interactions.png"/>

[review]: https://pdg.lbl.gov/2020/reviews/rpp2020-rev-passage-particles-matter.pdf
[PDG]: https://pdg.lbl.gov
[Bremsstrahlung]: https://en.wikipedia.org/wiki/Bremsstrahlung
