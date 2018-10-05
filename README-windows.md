
## Building on Windows (mingw-w64 native, or wow64/linux/unix cross-compiler)

    #i686 or x86_64
    #if cross-compiling from anywhere other than wow64, export CC and CXX to
    #$ARCH-w64-mingw32-g[cc++] respectively
    $ pacman -Sy base-devel mingw-w64-$ARCH-toolchain git libtool autoconf cmake
    $ git clone --recursive https://github.com/loki-project/lokinet-builder
    $ cd lokinet-builder
    $ make ensure sodium
    $ cd build
    $ cmake ../deps/llarp -DSODIUM_LIBRARIES=./prefix/lib/libsodium.a -DSODIUM_INCLUDE_DIR=./prefix/include -G "Unix Makefiles" -DHAVE_CXX17_FILESYSTEM=ON
    $ make
    $ cp llarpd ../lokinet.exe

## Building on Windows using Microsoft C/C++ (Visual Studio 2017)

- Microsoft C/C++ is unsupported, the codebase has a lot of POSIX functions, and MinGW-w64 implements enough of them to make the win32 port possible

## Boxed warning

<div style="border:5px solid #f00;padding:5px">
<p>Inbound sessions are unsupported on Windows Server systems.</p>
<p><strong><em>Ignore this warning at your own peril.</em></strong></p>
</div>