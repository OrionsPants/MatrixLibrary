$scriptDir = $PSScriptRoot
$buildDir = $scriptDir + "/../build"

# Check if the build directory exists and remove it
if (Test-Path $buildDir) {
    Write-Output "Removing existing build directory..."
    Remove-Item -Recurse -Force $buildDir
}

# Create a new build directory
Write-Output "Creating new build directory..."
New-Item -ItemType Directory -Path $buildDir

# Navigate to the build directory
Set-Location $buildDir

# Run CMake to configure and generate build files
Write-Output "Configuring project with CMake..."
cmake ..

# Build the project
Write-Output "Building project with CMake..."
cmake --build . --config Debug -- -m

# Return to the original directory
Set-Location -Path ".."

Write-Output "Build complete!"
