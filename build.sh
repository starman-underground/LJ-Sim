#!/bin/bash

# LJ-Sim Build Script
# This script automatically builds the project with Eigen being fetched via FetchContent

set -e  # Exit on any error

echo "🚀 Building LJ-Sim with automatic Eigen dependency management..."

# Create build directory if it doesn't exist
mkdir -p build
cd build

# Configure with CMake
echo "📋 Configuring project..."
cmake .. -DCMAKE_BUILD_TYPE=Release

# Build the project
echo "🔨 Building project..."
cmake --build . --config Release -j$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)

echo "✅ Build completed successfully!"
echo "📁 Executables are in: build/"
echo "🧪 Test executables are in: build/tests/" 