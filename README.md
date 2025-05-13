[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://www.youtube.com/@physino)
[![Platform](https://img.shields.io/badge/Platform-pink?style=flat)](platform)
[![Run](https://img.shields.io/badge/Run-orange?style=flat)](run)
[![Visualize](https://img.shields.io/badge/Visualize-yellow?style=flat)](vis)
[![Detector](https://img.shields.io/badge/Detector-green?style=flat)](detector)
[![Particle](https://img.shields.io/badge/Particle-cyan?style=flat)](gps)
[![Examples](https://img.shields.io/badge/Examples-blue?style=flat)](examples)
[![Physics](https://img.shields.io/badge/Physics-magenta?style=flat)](physics)
[![Analysis](https://img.shields.io/badge/Analysis-purple?style=flat)](analysis)

According to <https://geant4.web.cern.ch>, Geant4 is a
> **Toolkit** for the simulation of the passage of particles through matter.

which means that it is **NOT** a program that can be double-clicked and run after installation.

Instead, Geant4 is provided as a set of [C++](platform/cpp) libraries that need to be compiled [^1]. One must write a C++ program (Geant4 [application](examples)) that calls functions provided in the compiled Geant4 libraries. The application itself also needs to be compiled, before it can be double-clicked and run.

[^1]: Binary releases on <https://geant4.web.cern.ch/download> are libraries already compiled on very specific operating systems. They work best for Windows users. Please watch the first 5 videos in [this] YouTube playlist to understand the pro's and con's of pre-compiled Geant4 libraries.

[this]: https://www.youtube.com/playlist?list=PLw3G-vTgPrdB7cIYWEoCeIZrSePpefFEW

Think Geant4 as a set of disassembled Lego pieces (libraries). One needs to put them together into a Lego model, such as a car, a plane, or a house, etc. ([applications](examples)).

The Geant4 [Q&A] hence defines three types of users:

- the **end user**, who uses a Geant4 application written by someone else,
- the **application developer**, who writes a Geant4 application,
- the **framework provider**, who updates or extends Geant4 libraries.

This guide is provided to flatten the steep learning curve of Geant4 for its end users, with some thoughts on how application developers and framework providers can serve end users better.

[Q&A]: https://geant4-userdoc.web.cern.ch/UsersGuides/IntroductionToGeant4/html/IntroductionToG4.html#software-knowledge-required-to-use-the-geant4-toolkit

## Why It Is Hard to Learn Geant4

As end users, all we need is a Geant4 application that has already been compiled for our operating systems (OS), and we can just double click and run it. Geant4 does provide many [example application]s to show its muscles. However, too many choices actually paralyze a poor end user. Which one shall we choose?! A reasonable choice would be the simplest one. However, the simplest Geant4 application example, [B1][], has very limited functionality. To adopt it for our specific applications, we, as end users, are forced to learn how to modify and compile a Geant4 [example application], and become an application developer. No wonder the first Geant4 User guide is for application developers instead of end users.

[example application]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Examples/examples.html
[B1]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Examples/BasicCodes.html#exmpbasic-b1

According to <https://geant4.org/docs/#user-guides>,
> If you are new to Geant4, we recommend that you read this document ([Geant4 User Guide for Application Developers][guide]) first. The first part of the document provides a step-by-step tutorial in the use of Geant4; this is for a **novice** user. The second part describes the usage of the toolkit for practical applications, with a lot of example codes. After reading this part, you will be able to start to *write a detector simulation program* for most applications/experiments.

[guide]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/index.html

The shocking fact is that there is **NO** official guide for end users! This is understandable, because Geant4 is provided as a **toolkit** (individual Lego pieces), way more flexible than a specific **application** (a finished Lego model). Nevertheless, this is bad news for absolute beginners who need an executable application instead of a comprehensive but complicated toolkit.

Is it possible to provide a compiled Geant4 application that can be double clicked and run for different simulations on different OS? It is possible but quit hard, because

- There is no way to include all existing, or to-be-constructed radiation detectors or shielding geometries into one program. Even end users must learn [how to model their own experimental setups](detector) if nobody else does that for them.
- A [C++ program must be compiled](platform/cpp) on a specific OS to run on that system. A C++ program that is compiled on a Mac cannot be used on Windows or Linux.

## Fastest Way to Learn Geant4

Despite of all these obstacles, it is possible for beginners to start their own Geant4 simulations within a few hours if they are pointed to the right direction. I taught Geant4 in a [summer school](https://pire.gemadarc.org/education/school24). Some undergraduate students managed to simulate a simple radiation detector system after 6 hours of instruction. Of course, your mileage may vary due to different background and resources available around you. But there are some basic tips that can help speed up your learning process and make it exciting instead of frastrating.

First, find people around you who know how to use Geant4, ask them to walk you through the process. If nobody around you can help, follow this guide. It is possible to learn Geant4 by following the official [User Guide for Application Developers][guide]. But it is hard, because the official guide targets application developers, **NOT** end users.

Second, **avoid** [installing Geant4](platform) by yourself. It is often possible to find some computers in your research or working group that already have Geant4 installed. If you are in a large research group, you may be able to gain access to some high performance computing (HPC) clusters, where multiple versions of Geant4 are available. If you cannot find any, please consider using [containerized Geant4](platform/container), or [cloud-based Geant4](run), which can be used in any OS without installation.

Third, **avoid** writing your own Geant4 applications. Ask your supervisor to provide one, or modify an official Geant4 [example application] that is close to what you are trying to simulate. If you don't know how to modify C++ code, consider using [GEARS][] - Geant4 Example Application with Rich features yet Small footprint, one of the [universal Geant4 applications](https://youtu.be/3g9CkyBS31o), which allows you to perform most simulations without writing a single line of C++.

At this point, some of you may ask, so I don't have to learn anything? You do, but I don't recommend you to start with things that are only remotely related to the simulation that you want to do.

Instead, you may start with getting familiar with Geant4 user interface ([UI](run)), where you can learn how to use Geant4 [macro][] commmands to perform a simulation. You may also want to learn various ways to [visualize](vis) your detector model and particle trajectories to make sure that you simulation makes sense.

After playing around with some existing detector models, you may be keen to [create your own models](detector). Remember, this can be done **without** any C++. Geant4 allows you to [describe your model using simple text](detector). I have created a series of [![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://www.youtube.com/playlist?list=PLw3G-vTgPrdBxXZo1UpOD_xVFSgM3hLn-) videos to demonstrate this method.

In summary, the fastest way to start your own Geant4 simulation is to use an existing Geant4 installation and application to get familiar with Geant4 [UI](run), [macro][] commands, [visualization](vis), and [detector definition using simple text](detector). This way, you are actually learning how to **use** Geant4 instead of learning how to install Geant4.

## Epilogue

This guide was originally created as a GitHub [repository] to avoid duplicating common [Geant4][] related tasks (e.g. datasets, containers, documentation, etc.) in individual [Geant4][] applications, such as [GEARS][] and [MinGLE][]. It has evolved into a central hub to collect and disseminate my ideas and effort toward a more end user friendly Geant4 ecosystem. Welcome to join [me][] if you are interested in the development of [Shine][], [GEARS][], [MinGLE][], [containerized Geant4](platform/container), or YouTube [tutorials][].

## Footnote

[Geant4]: https://geant4.org
[GEARS]: https://github.com/jintonic/gears
[MinGLE]: https://github.com/jintonic/mingle
[repository]: https://github.com/jintonic/geant4
[me]: https://physino.xyz
[shine]: https://physino.xyz/shine
[tutorials]: https://www.youtube.com/@physino
[macro]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Control/commands.html
[CAD]: https://en.wikipedia.org/wiki/Computer-aided_design
