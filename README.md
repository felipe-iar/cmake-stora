# CMake test with big project

This test will use `Ninja` as generator. Override in `go.sh`.

- `export NUMBERF=1000` to define the number of source files.

- Set the `TOOLKIT` in the `iar-toolchain.cmake`.
- Execute `./go.sh`.


## Example
When on Windows, the Ninja Generator automatically uses a response file (`.rsp`) containing the names of all the objects to prevent the command line from reaching the maximum allowed length limit (8191 characters).