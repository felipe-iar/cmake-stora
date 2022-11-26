#!/bin/bash

export CMAKE_GENERATOR="Ninja"

cmake -B _build --toolchain iar-toolchain.cmake

time cmake --build _build --verbose --clean-first
