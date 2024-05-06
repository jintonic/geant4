# must-haves
cmake_minimum_required(VERSION 3.0)
project(HelloWorld)

# add an executable to the project using the specified source file
add_executable(hello hello.cc)

# generate installation rules
# https://stackoverflow.com/a/67871231/1801749
# https://stackoverflow.com/a/11290939/1801749
install(TARGETS hello)

# cmake doesn't provide uninstall command
# https://stackoverflow.com/questions/41471620
