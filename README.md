# C++ Project Starting Point
C++17 project environment using cmake to get off and deving quickly.

## Getting started
```
git clone --recurse-submodules https://github.com/tcashel/CppStartHere
```
This project has the [Catch2](https://github.com/catchorg/Catch2) testing framework 
in a git submodule which is why we use the `--recurse-submodules` flag.

## General Info
I found the following sources helpful:
- (https://gist.github.com/mbinna/c61dbb39bca0e4fb7d1f73b0d66a4fd1)
- (https://cmake.org/)

I also found using the cmake command `target_include_directories` much more helpful 
than using `include_directories`.  Using `include_directories` when including the 
headers for Catch2 applies your project's compiler flags to the Catch2 project, 
which casues issues if you are using stricter error reporting.

### Ongoing
I will be adding to this project as I have time, some things I want to add:
- cmake `ExternalProject_Add()` some projects from GitHub
- add some more external non standard libraries
- make the test and main files better