cmake_minimum_required(VERSION 3.10)
project(main)

set(CMAKE_CXX_STANDARD 17)

# Include directories
include_directories(include)

# List all your source files here
set(SOURCES
    src/main.cpp
)

add_executable(main ${SOURCES})

# Link the Winsock2 library
target_link_libraries(main ws2_32)

set_target_properties(main PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out
)

