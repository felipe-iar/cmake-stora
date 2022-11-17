cmake_minimum_required(VERSION 3.22)

set(CMAKE_C_USE_RESPONSE_FILE_FOR_OBJECTS 1)
set(CMAKE_ASM_USE_RESPONSE_FILE_FOR_OBJECTS 1)
#set(CMAKE_ASM_RESPONSE_FILE_FLAG "-f ")
#set(CMAKE_C_RESPONSE_FILE_FLAG "-f ")
#set(CMAKE_C_RESPONSE_FILE_LINK_FLAG "-f ")
#set(CMAKE_ASM_RESPONSE_FILE_LINK_FLAG "-f ")
#set(CMAKE_NINJA_FORCE_RESPONSE_FILE 1)

project(MEGA LANGUAGES C ASM )

# Fallback option for generators other than `Ninja Multi-Config`
if (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug)
endif()

# Add the executable for the "mega-project" target
file(GLOB sources ${PROJECT_SOURCE_DIR}/*.c)
add_executable(mega-project ${sources})

# Set the compiler flags for the "mega-project" target
target_compile_options(mega-project PRIVATE -e)

target_link_options(mega-project PRIVATE
  -D_STACK_SIZE=0x40 -D_DATA16_HEAP_SIZE=0x40 -D_DATA20_HEAP_SIZE=0x40
  "SHELL:-f ${TOOLKIT_DIR}/config/linker/lnk430f149.xcl -f ${TOOLKIT_DIR}/config/linker/multiplier.xcl"
  ${LINKER_OPTS} -s __program_start -rt ${TOOLKIT_DIR}/lib/dlib/dl430fn.r43
  -l $<TARGET_PROPERTY:NAME>.map )
