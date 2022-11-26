#!/bin/bash

export CMAKE_GENERATOR="Ninja"

cmake -B _build --toolchain iar-toolchain.cmake

cmake --build _build --verbose --clean-first
