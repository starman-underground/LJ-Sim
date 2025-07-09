@echo off
REM LJ-Sim Build Script for Windows
REM This script automatically builds the project with Eigen being fetched via FetchContent

echo 🚀 Building LJ-Sim with automatic Eigen dependency management...

REM Create build directory if it doesn't exist
if not exist build mkdir build
cd build

REM Configure with CMake
echo 📋 Configuring project...
cmake .. -DCMAKE_BUILD_TYPE=Release

REM Build the project
echo 🔨 Building project...
cmake --build . --config Release

echo ✅ Build completed successfully!
echo 📁 Executables are in: build/
echo 🧪 Test executables are in: build/tests/

pause 