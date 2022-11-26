# CMake test with big project

- `export NUMBERF=1000` to define the number of source files.

- Set the `TOOLKIT` in the `iar-toolchain.cmake`.

## Execute
- Bash
```
export CMAKE_GENERATOR="Ninja" 
```
- Windows
```
set CMAKE_GENERATOR="Ninja" 
```
- Both
```
cmake -B _build --toolchain iar-toolchain.cmake

cmake --build _build --verbose --clean-first
```
>:bulb: In Bash, simply execute `go.sh`.

## Notes
When on Windows, the Ninja Generator automatically uses a response file (`.rsp`) containing the names of all the objects to prevent the command line from reaching the maximum allowed length limit (8191 characters).: