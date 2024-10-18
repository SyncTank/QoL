cmake_minimum_required(VERSION 3.10)
project(main)

set(CMAKE_CXX_STANDARD 17)

# Include directories
include_directories(include)

# Connects VCPKG 
#set(CMAKE_TOOLCHAIN_FILE "-DCMAKE_TOOLCHAIN_FILE=C:/Users/ralvarado/scoop/apps/vcpkg/current/scripts/buildsystems/vcpkg.cmake")

# List all your source files here
set(SOURCES
    src/main.cpp
)

# Look for package
#find_package(fmt CONFIG REQUIRED) 

add_executable(main ${SOURCES})

# Look for Libraries
# Link the Winsock2 library
target_link_libraries(main ws2_32)

#target_link_libraries(main PRIVATE fmt::fmt)

set_target_properties(main PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out
)

