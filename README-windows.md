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
    - if your cross-compiler was built using `pthreads` (see the output of `i686-w64-mingw32-$[CC|CXX] -v` under `Thread model: posix`)
, you will need to configure/install the patched version of Pthreads in-tree, under `contrib/mingw32/pthread-win32`, as well as building pseh, which the patch depends on.
        - config/install pseh first
        - install both to the sysroot or cross-compile build prefix for your distro 
          - if you are on windows (using msys2), try `./configure --prefix=/mingw32/i686-w64-mingw32` and the compiler flags listed
            - this will install pseh and pthreads in the normal locations, replacing the originals
          - on linux, perhaps `--prefix=/usr/i686-w64-mingw32`? I recall Red Hat using this prefix...
          - your mileage may vary
          - always read the manual or documentation for your distro or OS install of mingw-w64
        - recommended: `CFLAGS='-Os -march=i686 -mtune=generic'` (since this will be linked to every program compiled with this toolchain)
          - you do not want some random user complaining about `SIGILL`/`Illegal instruction` because you decided to compile these with AVX2
    - otherwise, this patch is not applicable (`Thread model: win32` - you do not even have pthreads, or most of C++11 threading!)

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

<div style="border:5px solid #f00;padding:5px">
<p>Inbound sessions are unsupported on Windows Server systems.</p>
<p><strong><em>Ignore this warning at your own peril.</em></strong></p>
</div>