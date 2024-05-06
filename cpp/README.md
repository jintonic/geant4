Geant4 is written in C++. The following knowledge of C++ can be helpful to understand the usage of Geant4.

## Compile a Simple C++ Program

[hello.cc](hello.cc) is a very simple C++ program. It is just a pure text file with a special suffix `.cc`. A program called [compiler][] is needed to turn it into an executable file that can be run by a computer. In Linux, the most common compiler is GNU Compiler Collection, or [GCC][] in short. It includes a C++ compiler, `g++`, the usage of which is demonstrated by the commands below.

```sh
# compile hello.cc using GNU C++ compiler, g++
# an executable, a.out, will be generated from hello.cc
g++ hello.cc
# run a.out in the current folder (./)
./a.out
# compile hello.cc to hello instead of a.out
g++ hellow.cc -o hello
```

`g++ hello.cc` does not show any output. One can request `g++` to show the compilation process in detail with the verbose option -v:
```sh
g++ -v hello.cc
```
For people who want to learn more, the verbose output of g++ is explained in detail here: <https://stackoverflow.com/a/13456065/1801749>

## Use Makefile to Simplify Compilation Commands

The compilation command can be written in some [Makefile](Makefile) as a [recipe][] of the compilation rule, which will be used by the [make][] command to compile [hello.cc](hello.cc)

```sh
# run the first rule defined in Makefile,
# which is to compile hello.cc to hello
make
# delete the generated executable file, hello
make clean
# install hello to /usr/local/bin/ folder
make install
# remove /usr/local/bin/hello
make uninstall
```

## Use CMake to Generate Makefile or Its Equivalence

It takes time to learn how to write a proper [Makefile][]. The Windows operating system doesn't use [Makefile][]. Another program, [CMake][], can be used to generate [Makefile][] or its equivalence on a Windows computer. Instructions for the `cmake` command are written in a file called [CMakeLists.txt](CMakeLists.txt). They are easier and more human readable compared to those for [make][]. The usage of `cmake` in a Linux or Mac terminal goes like

```sh
# create a folder, build/, and generate Makefiles in it
cmake -B build
# get into the build folder
cd build
# use the Makefile created by CMake
make
make install
```

Note that [CMake][] doesn't provide `uninstall` option by default: <https://stackoverflow.com/questions/41471620/>.

[recipe]: https://www.gnu.org/software/make/manual/html_node/Recipes.html
[compiler]: https://en.wikipedia.org/wiki/Compiler
[GCC]: https://gcc.gnu.org
[Makefile]: https://opensource.com/article/18/8/what-how-makefile
[make]: https://www.gnu.org/software/make/manual/make.html
[CMake]: https://cmake.org
