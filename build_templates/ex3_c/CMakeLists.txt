cmake_minimum_required(VERSION 3.10)
project(BUILDC C)  # Explicitly specify C project
set(PROJECT_VERSION 1.0.0)

# Set C standard (instead of C++)
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

# Collect all .c files in the src directory
file(GLOB SOURCES 
    #src/main.c
	#src/util.c
	src/*.c
)

# Create a static library from the src files
add_library(BUILDC STATIC ${SOURCES})

# Specify include directories for the BUILDC library
target_include_directories(BUILDC PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

# Create executable
add_executable(main src/main.c)

# Link the BUILDC library to the main executable
target_link_libraries(main PRIVATE BUILDC)

# C Flags
target_compile_options(${PROJECT_NAME} PRIVATE
    -Wall
    -Wextra
    -Werror
)

if(WIN32)
    target_compile_definitions(${PROJECT_NAME} PRIVATE OS_WINDOWS)
elseif(UNIX)
    target_compile_definitions(${PROJECT_NAME} PRIVATE OS_LINUX)
endif()

# Set output directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# 1. Header-only library
# target_include_directories(${PROJECT_NAME} PRIVATE include)
# include_directories(${PROJECT_SOURCE_DIR}/include)

# 2. Prebuilt library
# find_library(MY_LIB mylib PATHS /path/to/lib)
# target_link_libraries(${PROJECT_NAME} PRIVATE ${MY_LIB})

# 3. Git submodule (add to root CMakeLists.txt)
# add_subdirectory(thirdparty/mylib)
# target_link_libraries(${PROJECT_NAME} PRIVATE mylib)

# 4. Package example (OpenSSL)
# find_package(OpenSSL REQUIRED)
# target_link_libraries(${PROJECT_NAME} PRIVATE OpenSSL::SSL)


# Testing setup
enable_testing()
if(BUILD_TESTING)
    add_subdirectory(tests)
endif()

# Install instructions (optional)
install(TARGETS ${PROJECT_NAME}
    RUNTIME DESTINATION bin
)
