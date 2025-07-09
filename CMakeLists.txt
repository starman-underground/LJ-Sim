cmake_minimum_required(VERSION 3.20 FATAL_ERROR)
project(LJ-Sim VERSION 0.1 LANGUAGES CXX CUDA)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(FetchContent)

# Fetch Eigen library
FetchContent_Declare(
  eigen
  GIT_REPOSITORY https://gitlab.com/libeigen/eigen.git
  GIT_TAG 3.4.0
)

FetchContent_MakeAvailable(eigen)

# Core library
add_library(ljmd_core
    src/core/particle.cpp
    src/core/system.cpp
    src/core/forces.cpp
    src/core/integrator.cpp
)

target_include_directories(ljmd_core PUBLIC
    ${PROJECT_SOURCE_DIR}/include
)

target_link_libraries(ljmd_core PUBLIC Eigen3::Eigen)

# Example executable
add_executable(two_particle_demo examples/week1_basic_sim/two_particle_system.cpp)
target_link_libraries(two_particle_demo ljmd_core)

# Add tests subdirectory
add_subdirectory(tests)