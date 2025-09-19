[![Home](https://img.shields.io/badge/Home-blue?style=flat)](..)
[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://www.youtube.com/playlist?list=PLw3G-vTgPrdB9Nt2ekl2oL1yoqEC294Uf)

Geant4 libraries and applications can be compiled and run on [Linux], [Mac], and [Windows]. Watch this [video] to learn the pro's and con's of individual operating systems if you cannot decide.

# Get Geant4 Libraries

[![Windows](https://img.shields.io/badge/On-Windows-orange?style=flat)](windows)
[![Mac](https://img.shields.io/badge/On-MacOS-yellow?style=flat)](mac)
[![Linux](https://img.shields.io/badge/On-Linux-green?style=flat)](linux)
[![Docker](https://img.shields.io/badge/Through-Docker-blue?style=flat)](docker)
[![Apptainer](https://img.shields.io/badge/Through-Apptainer-orange?style=flat)](apptainer)

[Geant4] libraries are available in various formats:

1. pre-compiled libraries that run on the cloud or computer clusters. No local compilation or installation is needed. This is the easiest, but not available for everybody.
2. pre-compiled libraries shipped together with a containerized operating system where they were compiled. They are ready to be used locally without any compilation and installation process. However, this requires a user understand [how to use containerized software](docker).
3. pre-compiled libraries on very specific operating systems (Binary releases on <https://geant4.web.cern.ch/download>).  No lengthy and error-prone compilation is needed, only installation (copy files to specific folders) is needed. This works best for [Windows] users, not so much for [Linux] or [Mac][] users.
4. pre-packaged libraries for very specific Linux distributions that can be installed easily using some software package management systems. For example, Geant4 is available in [Arch][] Linux's [User Repository][AUR]. Unfortunately, no pre-packaged Geant4 is available on Debian/Ubuntu/Mint.
4. source code. It must be compiled and installed locally for different operating systems. It requires some basic understanding of [how to compile and use a C++ program](cpp).

[Geant4]: ..
[Windows]: windows
[Arch]: https://archlinux.org
[AUR]: https://aur.archlinux.org/packages/geant4
[Linux]: linux
[Mac]: mac

## Multiple Versions of Geant4

We may need to maintain multiple versions of Geant4 in a computer. The following tutorial shows how to switch in between:
<iframe width="640" height="360" src="https://www.youtube.com/embed/Hbwx-9Fcfss?si=7SmK7ArpwYsfYukO" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## IDE for Geant4 Application Development

Various [IDE](IDE)s (Integrated Development Environment) can be used to develop Geant4 applications (or just to experience example applications). Please following [this link](IDE) to learn more.
