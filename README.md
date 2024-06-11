OpenAES-0.10.0  
Nabil S. Al Ramli  
www.nalramli.com  

# Introduction

OpenAES is an open source implementation of the Advanced Encryption
Standard.  It is distributed as a portable, lightweight C library that can
be easily integrated into applications.

# Compiling

## compiling with zig

confirmed to work with 0.12.0 and 0.13.0
Build the oaes binary for your host architecture with `zig build`  
Build the the library and the binary for the GOcontroll Moduline with `zig build -Dtarget=aarch64-linux-gnu.2.31`  

## compiling with other systems

OpenAES has been tested with the GCC as well as VC compilers.  It is
necessary to compile the source files located in ./src, and to add ./inc to
the include paths.

If you are building with OAES_HAVE_ISAAC defined (true by default), then
you also need to link in the source files under ./src/isaac and also add
./src/isaac to the include paths.

You may edit ./inc/oaes_config.h to modify build options.

CMake 2.8.0 can be used to build the test programs on different platforms.

In a Linux command line terminal type:
```sh
cmake .
make
```

In Windows, in a Visual Studio command line window type:

```sh
cmake . -G "NMake Makefiles"
nmake
```

# Usage


oaes_lib usage is described in the header file ./inc/oaes_lib.h.

The oaes command line application help manual can be obtained by using the
--help command line options.

The oaes_setup Windows installer integrates with the Windows shell.  It can be
used by right clicking a file in Windows Explorer and then selecting a
subcommand from the OpenAES menu.

# Samples

Samples applications are provided in the /test folder.

## Special thanks to:

Pedro A. Hortas
Yahalom Emet
