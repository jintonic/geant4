[![Home](https://img.shields.io/badge/Home-blue?style=flat)](..)
[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtu.be/E7VpAcXhhHo)

# Physics

[![alpha](https://img.shields.io/badge/alpha-blue?style=flat)](alpha)
[![beta](https://img.shields.io/badge/beta-yellow?style=flat)](beta)
[![gamma](https://img.shields.io/badge/gamma-cyan?style=flat)](gamma)
[![muon](https://img.shields.io/badge/muon-pink?style=flat)](muon)
[![neutron](https://img.shields.io/badge/neutron-brown?style=flat)](neutron)
[![optical](https://img.shields.io/badge/optical-photons-magenta?style=flat)](#optical-processes)
[![decay](https://img.shields.io/badge/radioactive-decay-orange?style=flat)](#radioactive-decay)
[![X-ray](https://img.shields.io/badge/X--ray-green?style=flat)](X-ray)

## Terminology

1. [physics model][physics list]: what happens in a certain energy range
2. [physics process][physics list]: model + cross section (how often it happens)
3. [physics list][]: a list of processes for common particles
4. [modular lists][]: lists of processes that can be used as building blocks to construct a more complex list
6. [reference lists][]: official [modular lists][] shipped with [Geant4][]
7. [factory][]: a [Geant4][] class that can be used to call [reference lists][] by their names

[physics list]:http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/UserActions/mandatoryActions.html#physics-lists
[modular lists]:http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/UserActions/mandatoryActions.html#building-physics-list-from-physics-builders
[reference lists]: https://geant4.web.cern.ch/documentation/dev/plg_html/PhysicsListGuide/physicslistguide.html
[factory]:https://geant4.kek.jp/lxr/source/physics_lists/lists/src/G4PhysListFactory.cc#L82
[Geant4]: http://geant4.cern.ch

## How to choose a physics list

[G4PhysListFactory.cc][factory] allows users to select from the [reference lists][] using an environment variable `PHYSLIST` before a [Geant4][] executable, for example,

```sh
$ PHYSLIST=FTFP_BERT_EMZ exampleApp

**************************************************************
 Geant4 version Name: geant4-11-03 [MT]   (6-December-2024)
                       Copyright : Geant4 Collaboration
                      References : NIM A 506 (2003), 250-303
                                 : IEEE-TNS 53 (2006), 270-278
                                 : NIM A 835 (2016), 186-225
                             WWW : http://geant4.org/
**************************************************************

G4PhysListFactory::GetReferencePhysList <FTFP_BERT_EMZ>  EMoption= 4
<<< Geant4 Physics List simulation engine: FTFP_BERT
...
PreInit> /run/initialize
Idle> /run/beamOn
```

where `/run/initialize` initializes physics based on the list, and `/run/beamOn` dumps information of physics models on screen.

Available reference lists can be found in [G4PhysListFactory.cc][factory]. The naming scheme is introduced on page 24 in a SLAC [tutorial][]. A guidance on how to choose a proper physics list is also available in the same [tutorial][].

[GEARS]: http://physino.xyz/gears
[tutorial]:https://www.slac.stanford.edu/xorg/geant4/SLACTutorial14/Physics1.pdf

## Physics processes

[Major categories of processes](http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/TrackingAndPhysics/physicsProcess.html) provided in [Geant4][] include:

- Electromagnitism (EM)
  - Standard processes (~1 keV to ~PeV)
  - Low energy processes (250 eV to ~PeV)
  - [Optical photon tracking](#optical-processes)
- Weak interaction
  - decay of subatomic particles
  - [radioactive decay of nuclei](radioactive-decay)
- Hadronic physics
  - pure strong interaction (0 to ~TeV)
  - electro- and gamma-nuclear (10 MeV to ~TeV)
- Parameterized physics (not from first principles) for fast simulation
- Transportation (change from one volume to another)

Run `/process/list` after `/run/initialize`, you will get something like this:

~~~
     Transportation,              Decay,   RadioactiveDecay,                msc
              hIoni,            ionIoni,             hBrems,          hPairProd
        CoulombScat,              eIoni,              eBrem,            annihil
               phot,              compt,               conv,             muIoni
            muBrems,         muPairProd,         hadElastic,   neutronInelastic
           nCapture,           nFission,    protonInelastic,       pi+Inelastic
       pi-Inelastic,     kaon+Inelastic,     kaon-Inelastic,    kaon0LInelastic
    kaon0SInelastic,    lambdaInelastic,anti-lambdaInelastic,   sigma-Inelastic
anti_sigma-Inelastic,    sigma+Inelastic,anti_sigma+Inelastic,     xi-Inelastic
  anti_xi-Inelastic,       xi0Inelastic,  anti_xi0Inelastic,    omega-Inelastic
anti_omega-Inelastic,anti_protonInelastic,anti_neutronInelastic,anti_deuteronInelastic
anti_tritonInelastic,  anti_He3Inelastic,anti_alphaInelastic
~~~

Now we can use, for example, `/process/inactivate nCapture` to disable neutron capture process in your simulation. And we can use, for example, `/process/setVerbose 20 RadioactiveDecay` to change the verbosity of the radioactive decay process.

### Radioactive decay

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtu.be/8dR0DQ5ypCw)

Radioactive decay processes can be enabled before `run/initialize`:

```sh
PreInit> /physics_lists/factory/addRadioactiveDecay
PreInit> /run/initialize
Idle> /process/list Decay
   Decay    RadioactiveDecay
```

Detailed control of radioactive decay is provided by the /[grdm][]/ command, for example,

~~~sh
/grdm/deselectVolume chamber # disabled radioactive decay in volume "chamber"
/grdm/nucleusLimits 1 80 # enabled radioactive decay only when z in [1, 80]
~~~

[grdm]:http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_grdm_.html

Here is an example to create [Pb210][] on the surface of a cylindrical CsI detector:

```sh
 /gps/particle ion
 /gps/ion 82 210
 # default energy is 1 MeV, must be set to zero to let it decay at rest
 /gps/energy 0

 /gps/pos/type Surface
 /gps/pos/shape Cylinder
 /gps/pos/radius 7 cm
 /gps/pos/halfz 2.5 cm
```

[Pb210]:https://storage.googleapis.com/groundai-web-prod/media%2Fusers%2Fuser_92756%2Fproject_309275%2Fimages%2F210Pbdecaychain.png

### Optical processes
[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtu.be/sgo-RPbDRcU)

Optical processes can be enabled before `/run/initialize`:

```sh
 /physics_lists/factory/addOptical
 /run/initialize

 /process/list Electromagnetic
   phot,              compt,               conv,                msc
   eIoni,              eBrem,        CoulombScat,            annihil
   muIoni,            muBrems,         muPairProd,              hIoni
   hBrems,          hPairProd,            ionIoni,              hIoni
   ...
   hIoni,           hIoni,               Cerenkov,       Scintillation

 /process/list Optical
   OpAbsorption,   OpRayleigh,            OpMieHG,         OpBoundary
   OpWLS
```

Individual optical processes can be toggled by the following commands:

~~~sh
/process/optical/processActivation Cerenkov true/false
/process/optical/processActivation Scintillation true/false
/process/optical/processActivation OpAbsorption true/false
/process/optical/processActivation OpRayleigh true/false
/process/optical/processActivation OpMieHG true/false
/process/optical/processActivation OpBoundary true/false
/process/optical/processActivation OpWLS true/false
~~~

More built-in commands related to optical processes can be found [here](http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Control/AllResources/Control/UIcommands/_process_optical_.html). Example usages can be found [here](http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/Examples/ExtendedCodes.html#optical-photons).

It is useful to categorize the processes the following way:

- Production of [optical photons][]:
  - [Cerenkov radiation](https://en.wikipedia.org/wiki/Cherenkov_radiation)
  - [Scintillaiton](https://en.wikipedia.org/wiki/Scintillation_(physics))
- Transportation of [optical photons][] inside certain material:
  - Absorption (OpAbsorption)
  - Scattering: [Rayleigh scattering](https://en.wikipedia.org/wiki/Rayleigh_scattering) (OpRayleigh), and [Mie scattering](https://en.wikipedia.org/wiki/Mie_scattering) (OpMieHG), etc.
  - Wavelength shifting (OpWLS)
- Transportation of [optical photons][] on the boundary of two materials:
  - Reflection, refraction and transmission (OpBoundary)

It is also important to understand that [optical photons][] are treated differently from gamma and x-rays in [Geant4][], since completely different physics processes are assigned to them.

#### Optical properties of materials and surfaces
To [generate Cerenkov light](http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/TrackingAndPhysics/physicsProcess.html#generation-of-photons-in-processes-electromagnetic-xrays-cerenkov-effect), one MUST specify the refractive index of the material where the light is generated.

At least two parameters need to be specified to [generate scintillation light](https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/TrackingAndPhysics/physicsProcess.html#scintillation): the light yield, i.e., the number of photons per unit energy deposition (SCINTILLATIONYIELD), and the variation of the number of generated photons (RESOLUTIONSCALE). The parameters need to be attached to the material that scintillates.

The parameter, RAYLEIGH and ABSLENGTH, related to the transportation of [optical photons][] in a mertial also have to be attached to the material.

In an ideal optical interface, the transportation of [optical photons][] can be calculated given the refractive indices of the matierials on both sides. 

[optical photons]: http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/TrackingAndPhysics/physicsProcess.html#optical-photon-processes
