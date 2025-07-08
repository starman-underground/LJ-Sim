#include <iostream>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void hello_cuda_kernel() {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello from CUDA! Index %d, Thread %d, Block %d\n", idx, threadIdx.x, blockIdx.x);
}

__global__ void vector_add_kernel(float* a, float* b, float* c, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < n) {
        c[idx] = a[idx] + b[idx];
    }
}

int main() {
    std::cout << "=== CUDA Test Program ===" << std::endl;

    int device_count;
    cudaError_t err = cudaGetDeviceCount(&device_count);

    if (err != cudaSuccess) {
        std::cerr << "Error: " << cudaGetErrorString(err) << std::endl;
        return 1;
    }

    std::cout << "Number of CUDA devices: " << device_count << std::endl;

    if (device_count == 0) {
        std::cerr << "No CUDA devices found." << std::endl;
        return 1;
    }

    cudaDeviceProp prop;
    cudaGetDeviceProperties(&prop, 0);
    std::cout << "Device: " << prop.name << std::endl;
    std::cout << "Compute Capability: " << prop.major << "." << prop.minor << std::endl;
    std::cout << "Total Global Memory: " << prop.totalGlobalMem << " bytes" << std::endl;
    std::cout << "Shared Memory per Block: " << prop.sharedMemPerBlock << " bytes" << std::endl;
    std::cout << "Registers per Block: " << prop.regsPerBlock << std::endl;
    std::cout << "Warp Size: " << prop.warpSize << std::endl;
    std::cout << "Max Threads per Block: " << prop.maxThreadsPerBlock << std::endl;
    std::cout << "Max Threads per SM: " << prop.maxThreadsPerMultiProcessor << std::endl;
    std::cout << "Max Threads per Block Dim: " << prop.maxThreadsDim[0] << ", " << prop.maxThreadsDim[1] << ", " << prop.maxThreadsDim[2] << std::endl;
    std::cout << "Max Grid Size: " << prop.maxGridSize[0] << ", " << prop.maxGridSize[1] << ", " << prop.maxGridSize[2] << std::endl;

    // Test 1: kernel launch
    std::cout << "\n=== Test 1: Kernel Launch ===" << std::endl;
    hello_cuda_kernel<<<2, 4>>>();
    // Test 2: vector addition
    std::cout << "\n=== Test 2: Vector Addition ===" << std::endl;
    const int n = 1000;
    size_t size = n * sizeof(float);

    // Allocate memory on host
    float* h_a = (float*)malloc(size);
    float* h_b = (float*)malloc(size);
    float* h_c = (float*)malloc(size);

    // Initialize arrays
    for (int i = 0; i < n; i++) {
        h_a[i] = static_cast<float>(i * 1.0f);
        h_b[i] = static_cast<float>(i * 2.0f);
    }

    // Allocate memory on device
    float* d_a, *d_b, *d_c;
    cudaMalloc((void**)&d_a, size);
    cudaMalloc((void**)&d_b, size);
    cudaMalloc((void**)&d_c, size);

    // Copy data from host to device
    cudaMemcpy(d_a, h_a, size, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, h_b, size, cudaMemcpyHostToDevice);

    // Launch kernel
    int threads_per_block = 256;
    int blocks_per_grid = (n + threads_per_block - 1) / threads_per_block;
    vector_add_kernel<<<blocks_per_grid, threads_per_block>>>(d_a, d_b, d_c, n);

    // Copy result back to host
    cudaMemcpy(h_c, d_c, size, cudaMemcpyDeviceToHost);

    // Verify results
    bool success = true;
    for (int i = 0; i < n; i++) {
        float expected = h_a[i] + h_b[i];
        if (std::abs(h_c[i] - expected) > 1e-6) {
            success = false;
            break;
        }
    }

    if (success) {
        std::cout << "Vector addition test passed!" << std::endl;
    } else {
        std::cout << "Vector addition test failed!" << std::endl;
    }

    // Clean up
    free(h_a); free(h_b); free(h_c);
    cudaFree(d_a); cudaFree(d_b); cudaFree(d_c);

    return 0;
}