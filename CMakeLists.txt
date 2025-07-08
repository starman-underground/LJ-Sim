cmake_minimum_required(VERSION 3.20 FATAL_ERROR)
project(LJ-Sim LANGUAGES CXX CUDA)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Eigen3 REQUIRED)
find_package(CUDAToolkit REQUIRED)

add_executable(lj_sim
    src/main.cpp
)

target_link_libraries(lj_sim
    PRIVATE
    Eigen3::Eigen
    CUDA::cudart
    CUDA::curand
)

set_property(TARGET lj_sim
    PROPERTY CUDA_SEPARABLE_COMPILATION ON)

target_include_directories(lj_sim
    PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)