#!/bin/bash

# Get the directory where this script is located
scriptDir="$(dirname "$(realpath "$0")")"
buildDir="$scriptDir/../build"
exePath="$buildDir/tests/matrix_test"

# Check if the build directory exists and remove it
if [ -d "$buildDir" ]; then
    echo "Removing existing build directory..."
    rm -rf "$buildDir"
fi

# Create a new build directory
echo "Creating new build directory..."
mkdir -p "$buildDir"

# Navigate to the build directory
cd "$buildDir" || exit

# Run CMake to configure and generate build files
echo "Configuring project with CMake..."
cmake ..

# Build the project
echo "Building project with CMake..."
cmake --build . --config Debug -- -j$(nproc)
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON "$buildDir"

# Check if the executable exists
if [ -f "$exePath" ]; then
    # Run the executable
    echo "Running the matrix_test executable..."
    "$exePath"
else
    echo "Executable not found: $exePath"
fi

# Run pre-commit checks
echo "Running pre-commit checks..."
pre-commit run --all-files
if [ $? -ne 0 ]; then
    echo "Pre-commit checks failed. Aborting build."
    exit 1
fi
