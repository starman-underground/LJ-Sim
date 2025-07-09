# This is now a subdirectory, so we don't need cmake_minimum_required or project()
# cmake_minimum_required(VERSION 3.20 FATAL_ERROR)
# project(cuda_test LANGUAGES CXX CUDA)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CUDA_STANDARD 17)
set(CMAKE_CUDA_STANDARD_REQUIRED ON)

find_package(CUDAToolkit REQUIRED)
# Eigen is now available from the parent CMakeLists.txt via FetchContent

add_executable(cuda_test cuda_test.cu)
add_executable(eigen_test eigen_test.cpp)
add_executable(cpp20_test cpp20_test.cpp)

target_link_libraries(cuda_test PRIVATE CUDA::cudart)
target_link_libraries(eigen_test PRIVATE Eigen3::Eigen)

set_property(TARGET cuda_test PROPERTY CUDA_ARCHITECTURES 89)