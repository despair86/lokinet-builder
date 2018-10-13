# LokiNET bootstrap for Windows

This is a tiny executable that does the same thing as the `lokinet-bootstrap` shell script for Linux, specifically for the purpose of bypassing broken or outdated versions of Schannel that do not support current versions of TLS.

# Building

native build:

    $ export INCLUDE=/mingw32/include LIBS=/mingw32/lib # or a different path
    $ export CC=cc # change these if you use clang
    $ export NATIVE_CC=$CC
    $ export WINNT_INCLUDE=$INCLUDE WINNT_LIBS=$LIBS
    $ make prepare;make lokinet-bootstrap

cross-compile build:

    $ export INCLUDE=/usr/local/include LIBS=/usr/local/lib # or a different path
    $ export CC=i686-w64-mingw32-gcc # change these if you use clang, make sure these are in your system $PATH!
    $ export NATIVE_CC=cc
    $ export WINNT_INCLUDE=/path/to/win32/headers WINNT_LIBS=/path/to/win32/libs
    $ make prepare;make lokinet-bootstrap

then run `lokinet-bootstrap` to download an initial RC.

this may be included in the installation package in the future.

-despair86