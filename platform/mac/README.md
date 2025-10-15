[![Home](https://img.shields.io/badge/Home-blue?style=flat)](../..)
[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://www.youtube.com/playlist?list=PLw3G-vTgPrdDShnVve7JAqafhyQeU7nHR)
[![Get Geant4](https://img.shields.io/badge/Get-Geant4-blue?style=flat)](..)

# Geant4 Installation on Mac

The easiest way to install Geant4 on Mac is to compile Geant4's source code using [CMake][] GUI, which can be installed using [Homebrew][]:

~~~sh
brew install --cask cmake
~~~

Since version 11.3.0, Geant4 can be compiled with [Qt][] 6 instead of 5. [Qt][] installed through `brew install qt` is version 6. Because [CMake][] can find [Qt][] 6 installed through [Homebrew][] automatically, I recommand Mac users to turn on [GEANT4_USE_QT_QT6][opt], which is `off` by default for the moment.

If you encounter any compilation error related to `zlib` or `expat`, enable [GEANT4_USE_SYSTEM_EXPAT][opt], and [GEANT4_USE_SYSTEM_ZLIB][opt]. There is no need to install `expat` and `zlib` using [Homebrew][] because they are already included in [Xcode][], which is automatically installed when you install [Homebrew][].

<iframe width="640" height="360" src="https://www.youtube.com/embed/9vKTDizi4qw?si=_lMoh3rX02szB5a9" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

[Qt]: https://www.qt.io
[CMake]: ../cpp#cmake
[Homebrew]: https://brew.sh
[opt]: https://geant4-userdoc.web.cern.ch/UsersGuides/InstallationGuide/html/installguide.html?highlight=qt6#advanced-options
[Xcode]: https://mac.install.guide/commandlinetools/about-xcode-clt
