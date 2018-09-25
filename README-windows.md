# lokinet builder for windows

## Building for Windows (mingw-w64 native, or wow64/linux/unix cross-compiler)

    #i686 or x86_64
    #if cross-compiling from anywhere other than wow64, export CC and CXX to
    #$ARCH-w64-mingw32-g[cc++] respectively
    #if this is a native build from cygnus or msys2 (either for the linux emulation env or native win32),
    #you can use the linux build instructions in README.md

    $ pacman -Sy base-devel mingw-w64-$ARCH-toolchain git libtool autoconf cmake (or your distro/OS package mgr)
    $ git clone --recursive https://github.com/loki-project/lokinet-builder
    $ cd lokinet-builder
    $ [g]make [windows | legacy-wow64] (see note below)

#### note: 

- new 32-bit cross-compile targets are available in the makefile, call them using `[g]make legacy-wow64`. if you use clang instead of gcc, make sure to properly override `CC` and `CXX` respectively.

## Building on Windows using Microsoft C/C++ (Visual Studio 2017)

* clone https://github.com/loki-project/lokinet-builder from git-bash or whatever git browser you use
* open `%CLONE_PATH%/lokinet-builder/deps/sodium/builds/msvc/vs2017/libsodium.sln` and build one of the targets
* create a `build` folder in `%CLONE_PATH%/lokinet-builder`
* run cmake-gui from `%CLONE_PATH%/lokinet-builder/deps/llarp` as the source directory
  * define `SODIUM_LIB`  to `%CLONE_PATH%/lokinet-builder/deps/sodium/bin/win32/%CONFIG%/%TOOLSET%/%TARGET%/libsodium.lib`
  * define `SODIUM_INCLUDE_DIR` to `%CLONE_PATH%/lokinet-builder/deps/sodium/src/libsodium/include`
  * define `HAVE_CXX17_FILESYSTEM` to `TRUE`
  * select `Visual Studio 2017 15 %ARCH%` as the generator
  * enter a custom toolset if desired (usually `v141_xp`)
* generate the developer studio project files and open in the IDE
* select a configuration
* press F7 to build everything
* the microsoft c++ build may contain SSE2 instructions, optionally you can now enable AVX2 in CMake (`BUILD_AVX2`)

to run:

    $ ./lokinet

or press `Debug`/`Local Windows Debugger` in the visual studio standard toolbar

## Boxed warning

Server/inbound sessions are not supported at this time. (The code is there, but it has not been fully tested.)
_If you **insist**, get msys2 or cygwin and follow the linux build instructions, your mileage *will* vary greatly._

-despair