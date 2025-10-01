[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/playlist?list=PLw3G-vTgPrdB7cIYWEoCeIZrSePpefFEW)
[![Get Geant4](https://img.shields.io/badge/Get-Geant4-blue?style=flat)](..)

There is no need to switch to [Linux] or [Mac] to run Geant4. Windows is perfectly fine to develop and run Geant4 applications. Watch this [video] to learn the pro's and con's of individual operating systems if you cannot decide.

Geant4 libraries can be obtained in different ways on Windows:

- The easiest and recommended way for an end user is to [use the official Windows installer](#install-pre-compiled-geant4-libraries), the one with the '.exe' suffix in the *Binary releases* section on <https://geant4.web.cern.ch/download>. Binary releases are just another name for pre-compiled libraries. They are provided for a specific Windows and Visual Studio version, and may not work for a different version of Windows or Visual Studio.
- The second is to [compile the source code of Geant4 libraries](#compile-source-code-of-geant4-libraries). It is error-prone and time consuming, but gives you more flexibility. Not recommended for end users.
- The third is to use [Docker Desktop](../docker) to run Geant4 in a [container](../docker). It is fast, but the user needs to learn how to use a Linux container.
- The fourth is to compile the source code of Geant4 libraries in [WSL](../linux). It is only suitable for people who are familiar to Linux.

[Linux]: ../linux
[Mac]: ../mac/
[video]: https://youtu.be/_g3nvEbhOx8?si=XHNjvpH5b5q93RDu

# Geant4 on Windows

## Install Pre-compiled Geant4 Libraries

You can easily install Geant4 libraries pre-compiled for you by the Geant4 collaboration. The process is very similar to a typical Windows program, that is, double click an installer and click next, next, ..., finish. The video below made in 2023 still largely valid in 2025. The only part that needs an [update](https://youtu.be/62KUamdelkU) is the procedure to automatically install Geant4 datasets (near [3:30](https://youtu.be/XdzFsVGTbLc?t=210)). This video replaces an [older tutorial](https://youtu.be/3huHctBp0GE). But the description on setting the `PATH` environment variable is more thorough in the older one.

<iframe width="640" height="360" src="https://www.youtube.com/embed/XdzFsVGTbLc?si=UgZet8vMoNWFH3EZ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Compile Source Code of Geant4 Libraries

You can also choose to compile Geant4 libraries on your own Windows PC. In that case, you need to install [Visual Studio](#visual-studio) with C++ workload and [CMake](#cmake) before you get started. The process of setting environment variables for Geant4 datasets mentioned near the end of the video is obsolete, the updated procedure is covered in [this video](https://youtu.be/62KUamdelkU).

<iframe width="640" height="360" src="https://www.youtube.com/embed/GykiM1lPON4?si=JMwReP_W3AFQjYzb" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Visual Studio

<iframe width="640" height="360" src="https://www.youtube.com/embed/OMa2xDjdXJw?si=ffYGlSr9DHrSnHiG" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Visual Studio is huge. If you want to save some disk space and download time, please follow [this YouTube short](https://youtu.be/o_MQDZUWfEw).

## CMake

<iframe width="640" height="360" src="https://www.youtube.com/embed/Lfk-oSSOJ34?si=KV9Om-nP5ncNEFQX" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
