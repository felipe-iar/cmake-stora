# IAR XLINK Response File quick test

This test will use `Ninja` as generator using MINGW64 (/cygwin).

- Use `gen-sources.sh` to generate 1000 C dummy source files:
  - `./gen-sources.sh 1000`

- Set the `TOOLKIT` in the `iar-toolchain.cmake` to `430`.
- Execute `./go.sh`.


## Example with EW430
When on Windows, the Ninja Generator automatically uses a response file (`.rsp`) containing the names of all the objects to prevent the command line from reaching the maximum allowed length limit (8191 characters).

Output:
```
...
mega-project.dir\foo996.c.r43.d -o CMakeFiles\mega-project.dir\foo996.c.r43
[999/1002] C:\IAR_Systems\EW\430\7.21.1\430\bin\icc430.exe  --silent D:\cmake-tutorial\tests\megaproject\foo997.c   -r -e --dependencies=ns CMakeFiles\mega-project.dir\foo997.c.r43.d -o CMakeFiles\mega-project.dir\foo997.c.r43
[1000/1002] C:\IAR_Systems\EW\430\7.21.1\430\bin\icc430.exe  --silent D:\cmake-tutorial\tests\megaproject\foo999.c   -r -e --dependencies=ns CMakeFiles\mega-project.dir\foo999.c.r43.d -o CMakeFiles\mega-project.dir\foo999.c.r43
[1001/1002] C:\IAR_Systems\EW\430\7.21.1\430\bin\icc430.exe  --silent D:\cmake-tutorial\tests\megaproject\main.c   -r -e --dependencies=ns CMakeFiles\mega-project.dir\main.c.r43.d -o CMakeFiles\mega-project.dir\main.c.r43
[1002/1002] cmd.exe /C "cd . && C:\IAR_Systems\EW\430\7.21.1\430\bin\xlink.exe -S -f CMakeFiles\mega-project.rsp -D_STACK_SIZE=0x40 -D_DATA16_HEAP_SIZE=0x40 -D_DATA20_HEAP_SIZE=0x40 -f C:/IAR_Systems/EW/430/7.21.1/430/config/linker/lnk430f149.xcl -f C:/IAR_Systems/EW/430/7.21.1/430/config/linker/multiplier.xcl -s __program_start -rt C:/IAR_Systems/EW/430/7.21.1/430/lib/dlib/dl430fn.r43 -l mega-project.map -o mega-project.bin && cd ."
```