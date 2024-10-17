# Top-level CMakeLists.txt

# Minimum CMake version required
cmake_minimum_required(VERSION 3.14)

# Project name and version
project(Matrix VERSION 1.0)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
# Set the C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)


# Set runtime library flags
if(MSVC)
    # Use dynamic linking for debug builds
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /MTd")
    set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} /MTd")
endif()

# Add the subdirectory for the matrix library
add_subdirectory(matrix)

include(FetchContent)

# Fetch Google Test
FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG        v1.15.2 # Specify the version you want
)

# Make gtest available
FetchContent_MakeAvailable(googletest)

add_subdirectory(tests)
