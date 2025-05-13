[![GEARS](https://img.shields.io/badge/GEARS-red?style=flat)](https://www.github.com/jintonic/gears)
[![MinGLE](https://img.shields.io/badge/MinGLE-blue?style=flat)](https://www.github.com/jintonic/mingle)
[![Official Examples](https://img.shields.io/badge/Official-Examples-green?style=flat)](https://github.com/Geant4/geant4/tree/master/examples)

# Example Applications

A [Geant4](..) application is a C++ program that calls functions in [Geant4](..) libraries to perform some simulations. It must [be compiled into an executable](../platform/cpp) file before one can run it.

The simplest [Geant4](..) example application is [MinGLE][] - Mini Geant4 Learning Example. It is contained in a single C++ file that has less than 70 lines of code, and is ideal for learning how to write your own Geant4 applications.

[GEARS][] is another single-file Geant4 application, yet is powerful enough to deal with most Geant4 simulations.

Both [MinGLE][] and [GEARS][] are regarded as [universal][] Geant4 applications, that is, they are not tied to any specific [detector](../../detector) definition, and can be used for most Geant4 simulations without the modification of their source code (See the following YouTube video for more information).

<iframe width="640" height="360" src="https://www.youtube.com/embed/3g9CkyBS31o?si=YiZqbZ_z3qoqtfD0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Get GEARS and MinGLE

Both applications can be downloaded from their [GitHub] pages individually. They are also included in [this repository](https://github.com/jintonic/geant4) as [Git] [submodule]s, and can be downloaded the following way if you are familiar with [Git]:

```sh
git clone https://github.com/jintonic/geant4
cd geant4
git submodule update --init --depth 1
```

## Official Geant4 Examples

[GEARS][] and [MinGLE][] are more end-user-friendly than any official geant4 examples. However, if you've already grown out of them and want to learn more, the best way to download a single one from official [![Geant4 examples](https://img.shields.io/badge/Geant4-examples-green?style=flat)](https://github.com/Geant4/geant4/tree/master/examples) is to follow this [StackOverflow][] post: <https://stackoverflow.com/a/70729494/1801749>.

## For Developers

[GEARS] and [MinGLE] are added as [Git] [submodule]s the following way:

```sh
cd /path/to/geant4
git submodule add --depth 1 https://github.com/jintonic/gears examples/
git config -f .gitmodules submodule..examples/gears.shallow true
git commit -am 'added gears as submodule'
git push
```

[GEARS]: https://github.com/jintonic/gears
[MinGLE]: https://github.com/jintonic/mingle
[universal]: https://youtu.be/3g9CkyBS31o
[StackOverflow]: https://stackoverflow.com
[Git]: https://git-scm.com
[submodule]: https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule
[GitHub]: https://github.com
