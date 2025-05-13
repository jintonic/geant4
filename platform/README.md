# Get Geant4

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://www.youtube.com/playlist?list=PLw3G-vTgPrdB9Nt2ekl2oL1yoqEC294Uf)
[![Windows](https://img.shields.io/badge/On-Windows-orange?style=flat)](windows)
[![Mac](https://img.shields.io/badge/On-MacOS-yellow?style=flat)](mac)
[![Linux](https://img.shields.io/badge/On-Linux-green?style=flat)](linux)
[![C++](https://img.shields.io/badge/C++-cyan?style=flat)](cpp)
[![Docker](https://img.shields.io/badge/Docker-blue?style=flat)](docker)
[![Apptainer](https://img.shields.io/badge/Apptainer-orange?style=flat)](apptainer)

[Geant4] libraries are available in various formats:

1. pre-compiled libraries that run on the cloud or computer clusters. No local compilation or installation is needed. This is the easiest, but not available for everybody.
2. pre-compiled libraries shipped together with a containerized operating system where they were compiled. They are ready to be used locally without any compilation and installation process. However, this requires a user understand [how to use containerized software](docker).
3. pre-compiled libraries on very specific operating systems (Binary releases on <https://geant4.web.cern.ch/download>).  No lengthy and error-prone compilation is needed, only installation (copy files to specific folders) is needed. This works best for [Windows] users, not so much for Linux or [Mac][] users.
4. pre-packaged libraries for very specific Linux distributions that can be installed easily using some software package management systems. For example, Geant4 is available in [Arch][] Linux's [User Repository][AUR]. Unfortunately, no pre-packaged Geant4 is avaiable on Debian/Ubuntu/Mint.
4. source code. It must be compiled and installed locally for different operating systems. It requires some basic understanding of [how to compile and use a C++ program](cpp).

[Geant4]: ..
[Windows]: windows
[Arch]: https://archlinux.org
[AUR]: https://aur.archlinux.org/packages/geant4
[Mac]: mac
