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

- Microsoft C/C++ is unsupported, the codebase has a lot of POSIX functions, and MinGW-w64 implements enough of them to make the win32 port possible

## Boxed warning

Server/inbound sessions are not supported at this time. (The code is there, but it has not been fully tested.)
_If you **insist**, get msys2 or cygwin and follow the linux build instructions, your mileage *will* vary greatly._

-despair