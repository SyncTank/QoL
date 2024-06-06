cmake_minimum_required(VERSION 3.27)
project(Te C)

find_package(raylib CONFIG REQUIRED)
target_link_libraries(main PRIVATE raylib)

set(CMAKE_C_STANDARD 23)

add_executable(Te main.c)
