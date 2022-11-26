cmake_minimum_required(VERSION 3.22)

set(CMAKE_C_USE_RESPONSE_FILE_FOR_OBJECTS 1)
#set(CMAKE_ASM_USE_RESPONSE_FILE_FOR_OBJECTS 1)
#set(CMAKE_ASM_RESPONSE_FILE_FLAG "-f ")
#set(CMAKE_C_RESPONSE_FILE_FLAG "-f ")
#set(CMAKE_C_RESPONSE_FILE_LINK_FLAG "-f ")
#set(CMAKE_ASM_RESPONSE_FILE_LINK_FLAG "-f ")
#set(CMAKE_NINJA_FORCE_RESPONSE_FILE 1)

project(MEGA LANGUAGES C ASM )

# Fallback option for generators other than `Ninja Multi-Config`K
if (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug)
endif()

if (DEFINED ENV{NUMBERF})
  set(NUMBERF $ENV{NUMBERF})
  message(STATUS "NUMBERF has been defined to ${NUMBERF}.")
else()
  set(NUMBERF 500)
endif()

# Generate generic source files for testing
file(GLOB REMOVABLES ${CMAKE_CURRENT_SOURCE_DIR}/*.c ${CMAKE_CURRENT_SOURCE_DIR}/*.asm)
if(REMOVABLES)
  file(REMOVE_RECURSE ${REMOVABLES})
endif()

math(EXPR CRANGE "${NUMBERF} * 80 / 100" ) 
math(EXPR ARANGE "${NUMBERF} * 20 / 100 - 1" )
foreach(c RANGE 1 ${CRANGE})
  file(WRITE ${CMAKE_CURRENT_SOURCE_DIR}/foo${c}.c "__root int foo${c}() { return ${c}; }")
endforeach()

foreach(a RANGE 1 ${ARANGE})
  file(WRITE ${CMAKE_CURRENT_SOURCE_DIR}/foo${a}.asm "\tMODULE asm_foo${a}\n\tPUBLIC asm_foo${a}\n\tSECTION .text:CODE\nasm_foo${a}:\n\tNOP\n\tEND")
endforeach()

# Main
file(WRITE ${CMAKE_CURRENT_SOURCE_DIR}/main.c "int main() {\n\treturn 0;\n}")

# Add the executable for the "mega-project" target
file(GLOB c-sources ${PROJECT_SOURCE_DIR}/*.c)
file(GLOB asm-sources ${PROJECT_SOURCE_DIR}/*.asm)
add_executable(mega-project ${c-sources} ${asm-sources})

# Set the compiler flags for the "mega-project" target
target_compile_options(mega-project PRIVATE $<$<COMPILE_LANGUAGE:C>:-e>)

target_link_options(mega-project PRIVATE
  --map $<TARGET_PROPERTY:NAME>.map )
