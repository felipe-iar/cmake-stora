#!/bin/bash

if [ -d _build ]; then 
  rm -rv _build
fi

if [ "$MSYSTEM" = "MINGW64" ]; then
  export CMAKE_MAKE_PROGRAM=$(cygpath -m $(which ninja))
fi

cmake -G Ninja -B _build --toolchain iar-toolchain.cmake

cmake --build _build --verbose --clean-first
