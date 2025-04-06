# Alpha interactions

Alpha particles, or ions in general, are heavy (compared to elemental particles) electrically charged particles. According to Knoll's [Radiation Detection and Measurement](https://www.amazon.com/dp/0470131489), they interact with matter primarily through coulomb forces between their positive charge and the negative charge of the orbital electrons within the absorber atoms. Although interactions of the particle with nuclei (as in Rutherford scattering or alpha-particle-induced reactions) are also possible, such encounters occur only rarely and they are not normally significant in the response of radiation detectors.

Common interactions that can be assigned to an alpha in a physics list include:

- Multiple scattering (Geant4 name: msc): an alpha changes its direction without ionizing other atoms.
- Ionization (Geant4 name: ionIoni): an alpha changes its direction and creates secondary electrons. Energetic electrons are called delta-rays.
- Scintillation (Geant4 name: Scintillation): in scintillating materials, an alpha track may end with this process.
- Elastic scattering against a nucleus (Geant4 name: hadElastic): an alpha changes its direction by elastically scattering against a nucleus.
- Inelastic scattering against a nucleus (Geant4 name: alphaInelastic): an alpha changes its direction and the scattered nucleus changes.
