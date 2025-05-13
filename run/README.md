[![Macro](https://img.shields.io/badge/Macro-Cmds-red?style=flat)](macro)
[![Web UI](https://img.shields.io/badge/Web-UI-blue?style=flat)](#web-ui-for-geant4)

Again, [Geant4] is **NOT** a program that can be double clicked and run. We can only run a Geant4 [Applicaiton](../examples) compiled into an executable locally or on the [cloud].

# Run Geant4 Application Locally

We control a Geant4 application primarily through [macro](macro) commands, which can be used in both graphic and command-line based user interfaces (UI). Their pro's and con's are summarized in the following YouTube video.

<iframe width="640" height="360" src="https://www.youtube.com/embed/3wJrE22P5Hk?si=6HhmxOg4D5JVxDQU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

# Geant4 On the Cloud

## Computer Clusters

Every once in a while, we need to distribute a large Geant4 simulation on a computer cluster. There are at least two computer clusters in US that can be used for free if the simulation is done for research purpose. They are [OSG] and [NRP]. [OSG] relies on [HTConder](condor) to submit jobs. [NRP] relies on [Kubernetes].

## Web UI for Geant4

It is the user's responsibility to provide a [detector](../detector) model for a Geant4 simulation. The [Geant4 User Guide for Application Developers][guide] provides detailed instruction on how to [program detector definition and response in C++]. Again, end users are forced to become application developers if they choose to go that route.

Fortunately, Geant4 also allows end users to write their detector definition in [plain text](../detector).

However, writing in a text file is not the most intuitive way to construct and debug 3D geometries. A graphic user interface (GUI) is better suited for this task. [Shine][] is such a UI on the web. One can use the mouse to select, place, rotate basic shapes on a canvas, and export the constructed detector model to a plain text file called `detector.tg`, which can be read by a Geant4 application that is configured to accept detector definition in plain text.

![Shine: a Web UI for Geant4](https://lh3.googleusercontent.com/d/1IYnxORUysfgw7ymhGuH_jlVCUpe2lsd-)

[Geant4]: ..
[cloud]: #geant4-on-the-cloud
[guide]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/index.html
[OSG]: https://osg-htc.org
[NRP]: https://nrp.ai
[Kubernetes]: https://kubernetes.io
[program detector definition and response in C++]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Detector/detector.html
[Shine]: https://physino.xyz/shine
