cmake_minimum_required(VERSION 3.28)
project(test)

set(CMAKE_CXX_STANDARD 26)

find_package(imgui CONFIG REQUIRED)
target_link_libraries(main PRIVATE imgui::imgui)

add_executable(test main.cpp)
