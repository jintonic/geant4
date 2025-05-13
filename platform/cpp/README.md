# How to Compile C++ Program

[Geant4] libraries and its applications are written in C++. The following knowledge of C++ can be helpful to understand the compilation of Geant4 [libraries] and its [applications].

<iframe width="640" height="360" src="https://www.youtube.com/embed/0UHyO2agCAc?si=ye3nguR-7F6geR_-&amp;start=53" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Manual Compilation

[hello.cc] is a very simple C++ program. It is just a pure text file with a special suffix `.cc` instead of `.txt`. A program called [compiler] is needed to turn it into an executable file that can be run by a computer. In Linux, the most common compiler is *GNU Compiler Collection*, or [GCC] in short. It includes a C++ compiler, `g++`, the usage of which is demonstrated by the commands below (Lines started with # are comments. They are not commands). In a Mac, the default compiler is [Clang]. However, the same command `g++` can be used to call it as well.

```sh
# compile hello.cc using GNU C++ compiler, g++
# an executable, a.out, will be generated from hello.cc
g++ hello.cc
# run a.out in current folder (./ means current folder)
./a.out
# rename output file from a.out to to hello
g++ hello.cc -o hello
# run hello in current folder (./)
./hello
# check which libraries are linked in hello in Linux
# https://unix.stackexchange.com/questions/120015
ldd hello
# the equivalent cmd of ldd in Mac is otool -L hello
```

`g++ hello.cc` does not show any output. One can request `g++` to show the compilation process in detail with the verbose option -v:

```sh
g++ -v hello.cc
```

For people who want to learn more, the verbose output of g++ is explained in detail here: <https://stackoverflow.com/a/13456065/1801749>

## Makefile

Compilation related commands can be written in a [Makefile][] as [recipes][] of compilation [rules][], which can be called by the [make][] command:

```sh
# run the first rule defined in Makefile,
# which is to compile hello.cc to hello
make
# delete the generated executable file, hello
make clean
# install hello to /usr/local/bin/ folder
make install
# run hello in any folder without ./
hello
# remove /usr/local/bin/hello
make uninstall
```

## CMake

It takes time to learn [how to write a proper Makefile]. The Windows operating system doesn't even use Makefiles. Another program, [CMake][], can be used to generate Makefiles on Linux and Mac, or their equivalence in a Windows computer. Instructions for the `cmake` command are written in a file called [CMakeLists.txt][]. They are easier to learn and more human-readable than those in a Makefile. The usage of `cmake` in a Linux or Mac terminal goes like

```sh
# create a folder, build/, and generate Makefiles in it
# it must be run in the same folder where CMakeLists.txt is located
cmake -B build
# get into the build folder
cd build
# use the Makefile created by CMake
make
make install
```

[CMake][] provides a graphic user interface (GUI) [cmake-gui][] for users who are not familiar with command line operations. Its installation on Windows is detailed in [this](https://youtu.be/Lfk-oSSOJ34) YouTube tutorial. Its usage on Windows is detailed in [this](https://youtu.be/GykiM1lPON4&t=117s) YouTube tutorial.

> **Note**
> [CMake][] doesn't provide `uninstall` by default: <https://stackoverflow.com/questions/41471620/>.

Now you are ready to proceed to <https://github.com/jintonic/mingle> to learn how to write and compile (or *build* if we use the [CMake][] terminology) a very simple C++ program that uses [Geant4][] libraries.

[Geant4]: ../..
[libraries]: ..
[applications]: ../../examples
[hello.cc]: https://github.com/jintonic/geant4/blob/main/build/cpp/hello.cc
[recipes]: https://www.gnu.org/software/make/manual/html_node/Recipes.html
[rules]: https://www.gnu.org/software/make/manual/html_node/Rules.html
[compiler]: https://en.wikipedia.org/wiki/Compiler
[GCC]: https://gcc.gnu.org
[Clang]: https://clang.llvm.org
[Makefile]: https://github.com/jintonic/geant4/blob/main/build/cpp/Makefile
[how to write a proper Makefile]: https://opensource.com/article/18/8/what-how-makefile
[make]: https://www.gnu.org/software/make/manual/make.html
[CMake]: https://cmake.org
[CMakeLists.txt]: https://github.com/jintonic/geant4/blob/main/build/cpp/CMakeLists.txt
[cmake-gui]: https://cmake.org/cmake/help/latest/manual/cmake-gui.1.html
