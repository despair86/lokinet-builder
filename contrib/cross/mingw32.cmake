set(CMAKE_SYSTEM_NAME Windows)
set(TOOLCHAIN_PREFIX i686-w64-mingw32)

add_definitions("-DWINNT_CROSS_COMPILE")

# target environment on the build host system
# second one is for non-root installs
set(CMAKE_FIND_ROOT_PATH /usr/${TOOLCHAIN_PREFIX} /home/$ENV{USER}/mingw32 /home/$ENV{USER}/mingw32/${TOOLCHAIN_PREFIX})

# modify default behavior of FIND_XXX() commands
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# cross compilers to use
if($ENV{COMPILER} MATCHES "clang")
set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}-clang)
set(CMAKE_CXX_COMPILER_AR llvm-ar)
set(CMAKE_C_COMPILER_AR ${CMAKE_CXX_COMPILER_AR})
set(CMAKE_CXX_COMPILER_RANLIB llvm-ranlib)
set(CMAKE_C_COMPILER_RANLIB ${CMAKE_CXX_COMPILER_RANLIB})
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-clang++)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-unused-command-line-argument")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unused-command-line-argument -Wno-c++11-narrowing")
# because clang is insane enough to inline whole sections of the C++ library!
set(CMAKE_EXE_LINKER_FLAGS "-Wl,--allow-multiple-definition")
else()
set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}-gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-g++)
endif()

set(CMAKE_RC_COMPILER ${TOOLCHAIN_PREFIX}-windres)
set(WOW64_CROSS_COMPILE ON)