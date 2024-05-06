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

[recipe]: https://www.gnu.org/software/make/manual/html_node/Recipes.html
[compiler]: https://en.wikipedia.org/wiki/Compiler
[GCC]: https://gcc.gnu.org
