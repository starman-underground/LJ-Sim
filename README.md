# LJ-Sim: Lennard-Jones Molecular Dynamics Simulation

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Language](https://img.shields.io/badge/language-C%2B%2B-blue.svg)](https://github.com/starman-underground/LJ-Sim)
[![CUDA](https://img.shields.io/badge/CUDA-12.9-green.svg)](https://developer.nvidia.com/cuda-toolkit)
[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://github.com/starman-underground/LJ-Sim)

> **A comprehensive 4-week implementation of GPU-accelerated Lennard-Jones molecular dynamics simulation from first principles**

## 🎯 Project Overview

LJ-Sim is a high-performance molecular dynamics simulation engine implementing the Lennard-Jones potential with progressive CUDA optimization. This project demonstrates a systematic approach to building computational physics software, progressing from foundational 2D implementations to GPU-accelerated multi-particle systems capable of thermodynamic analysis.

**🔬 Scientific Objective:** Simulate intermolecular interactions using the Lennard-Jones potential: `V(r) = 4ε[(σ/r)¹² - (σ/r)⁶]`

**💻 Technical Objective:** Achieve 10-100x performance improvement through GPU acceleration and algorithmic optimization

## ✨ Key Features

- **Advanced Integration**: Velocity Verlet algorithm with energy conservation validation
- **Optimized Data-Structures**: Force cutoff distance with Verlet List of contributing particles and Linked Cell rebuilding
- **Real-Time Visualization**: Animated particle dynamics using Mimir's CUDA/Vulkan integration
- **Thermodynamic Analysis**: Temperature, pressure, and radial distribution function calculations
- **GPU Acceleration**: CUDA-optimized force calculations with memory optimization
- **Scientific Validation**: Literature-verified physical properties and conservation laws

## 🏗️ Implementation Roadmap

### Week 1: Foundation & 2D Implementation
**🎯 Objective:** Establish theoretical understanding and create working 2D Lennard-Jones simulation

- [x] **Theory mastery**: Lennard-Jones potential derivations and force calculations
- [x] **Environment setup**: Development tools and scientific libraries
- [ ] **Core implementation**: 2D particle system with basic MD algorithms
- [ ] **Validation framework**: Energy conservation testing (< 1% drift over 1000 steps)

**🏆 Milestone:** Validated 2-particle system with correct LJ interactions

### Week 2: Integration & Scaling
**🎯 Objective:** Advanced integration methods and multi-particle scaling

- [ ] **Velocity Verlet algorithm**: High-accuracy numerical integration
- [ ] **System scaling**: Framework supporting 10-50 particles
- [ ] **Real-time visualization**: Animated particle dynamics
- [ ] **Temperature control**: Thermostat implementation (±5% accuracy)

**🏆 Milestone:** Multi-particle simulation with visualization and temperature control

### Week 3: Analysis & Physical Properties
**🎯 Objective:** Thermodynamic analysis and parameter studies

- [ ] **Microscopic thermodynamics**: Temperature and pressure from particle data
- [ ] **Structural analysis**: Radial Distribution Function (RDF) implementation
- [ ] **Parameter studies**: Systematic density/temperature variations
- [ ] **Literature validation**: Comparison with experimental values

**🏆 Milestone:** Complete analysis toolkit with validated parameter studies

### Week 4: Optimization & GPU Integration
**🎯 Objective:** GPU acceleration using CUDA

- [ ] **Performance profiling**: Bottleneck identification and analysis
- [ ] **CUDA implementation**: GPU-accelerated force calculations
- [ ] **Memory optimization**: Efficient data access patterns
- [ ] **Benchmarking**: Performance comparison and speedup analysis

**🏆 Milestone:** GPU-accelerated simulation with comprehensive performance metrics

## 🛠️ Technical Specifications

### Hardware Requirements
- **CPU**: AMD Ryzen 7600X 6-Core Processor (or equivalent)
- **RAM**: 32GB DDR5 (minimum 16GB)
- **GPU**: NVIDIA RTX 5070 (Compute Capability 8.9+)
- **Storage**: 5GB free space for simulation data

### Software Dependencies
```bash
# Core Programming Environment
C++23                    # Primary development language

# Scientific Computing
Eigen >= 3.4.0          # Numerical operations
Mimir >= 0.0.1     # Visualization and plotting

# GPU Computing
CUDA Toolkit 12.9       # GPU acceleration framework

# Development Tools
Git 2.30+               # Version control
CMake 3.20+             # Build system for C++ components
```

### Optional Dependencies
```bash
# Enhanced Visualization
Plotly >= 5.0.0         # Interactive 3D visualizations
Mayavi >= 4.7.0         # Advanced scientific visualization

# Performance Analysis
NVIDIA Nsight Compute   # GPU profiling
AMD uProf               # CPU profiling

# Documentation
Sphinx >= 4.0.0         # Documentation generation
Jupyter >= 1.0.0        # Interactive notebooks
```

## 🚀 Quick Start

### 1. Clone and Setup
```bash
# Clone repository
git clone https://github.com/starman-underground/LJ-Sim
cd lennard-jones-md

# Setup build environment
./scripts/setup_environment.sh

# Build project
cmake -B build
cmake --build build -j
```

### 2. Verify CUDA Installation
```bash
# Check CUDA availability
mkdir tests/build
cd tests/build
cmake ..
cmake --build . --config Release
.\Release\cuda_test.execd 
```

### 3. Run Basic Simulation
```bash
# Week 1: Basic 2D system
./examples/week1_basic_2d/two_particle_system

# Week 2: Multi-particle with visualization
./examples/week2_integration/multi_particle_system

# Week 3: Analysis and RDF
./examples/week3_analysis/rdf_calculation

# Week 4: GPU benchmarking
./examples/week4_optimization/cpu_vs_gpu_benchmark
```

## 📊 Performance Benchmarks

### Target Performance Metrics
| Metric | CPU Target | Actual CPU | GPU Target | Actual GPU |
|--------|-------------|------|------------|------------|
| **Force Calculation** | 1.0x baseline | | 10-50x | TBD |
| **Integration Speed** | 1.0x baseline | | 5-20x | TBD |
| **Memory Throughput** | ~10 GB/s | | ~500 GB/s | TBD |
| **Particle Scaling** | O(N²) | | O(N²) optimized | TBD |

### Validation Criteria
- ✅ **Energy Conservation**: <±1% over 10,000 timesteps
- ✅ **Temperature Control**: <±5% of target value
- ⏳ **Physical Accuracy**: Literature-aligned RDF and thermodynamic properties
- ⏳ **Computational Efficiency**: Reasonable scaling from 2→1000+ particles

## 📁 Project Structure

```
lennard-jones-md/
├── CMakeLists.txt
├── README.md
├── .gitignore
├── docs/
│   ├── theory/
│   │   ├── lennard_jones_derivation.md
│   │   ├── velocity_verlet.md
│   │   └── thermodynamics.md
│   ├── api/
│   └── examples/
├── include/
│   ├── ljmd/
│   │   ├── core/
│   │   │   ├── particle.hpp
│   │   │   ├── system.hpp
│   │   │   ├── forces.hpp
│   │   │   └── integrator.hpp
│   │   ├── analysis/
│   │   │   ├── thermodynamics.hpp
│   │   │   ├── rdf.hpp
│   │   │   └── statistics.hpp
│   │   ├── visualization/
│   │   │   ├── renderer.hpp
│   │   │   └── plotting.hpp
│   │   ├── cuda/
│   │   │   ├── gpu_forces.cuh
│   │   │   ├── gpu_integrator.cuh
│   │   │   └── memory_manager.cuh
│   │   └── utils/
│   │       ├── constants.hpp
│   │       ├── vector2d.hpp
│   │       └── timer.hpp
├── src/
│   ├── core/
│   │   ├── particle.cpp
│   │   ├── system.cpp
│   │   ├── forces.cpp
│   │   └── integrator.cpp
│   ├── analysis/
│   │   ├── thermodynamics.cpp
│   │   ├── rdf.cpp
│   │   └── statistics.cpp
│   ├── visualization/
│   │   ├── renderer.cpp
│   │   └── plotting.cpp
│   ├── cuda/
│   │   ├── gpu_forces.cu
│   │   ├── gpu_integrator.cu
│   │   └── memory_manager.cu
│   └── utils/
│       ├── vector2d.cpp
│       └── timer.cpp
├── examples/
│   ├── week1_basic_2d/
│   │   ├── two_particle_system.cpp
│   │   └── energy_conservation.cpp
│   ├── week2_integration/
│   │   ├── velocity_verlet_demo.cpp
│   │   ├── multi_particle_system.cpp
│   │   └── temperature_control.cpp
│   ├── week3_analysis/
│   │   ├── thermodynamic_properties.cpp
│   │   ├── rdf_calculation.cpp
│   │   └── parameter_studies.cpp
│   └── week4_optimization/
│       ├── cpu_vs_gpu_benchmark.cpp
│       ├── memory_optimization.cpp
│       └── scaling_analysis.cpp
├── tests/
│   ├── unit_tests/
│   │   ├── test_particle.cpp
│   │   ├── test_forces.cpp
│   │   ├── test_integrator.cpp
│   │   └── test_analysis.cpp
│   ├── integration_tests/
│   │   ├── test_energy_conservation.cpp
│   │   ├── test_temperature_control.cpp
│   │   └── test_gpu_equivalence.cpp
│   └── benchmarks/
│       ├── force_calculation_benchmark.cpp
│       └── integration_benchmark.cpp
├── scripts/
│   ├── setup_environment.sh
│   ├── build.sh
│   ├── run_tests.sh
│   └── generate_plots.py
├── data/
│   ├── input/
│   │   ├── argon_parameters.json
│   │   └── initial_conditions.dat
│   └── output/
│       ├── trajectories/
│       ├── analysis/
│       └── plots/
└── third_party/
    ├── eigen/
    ├── mimir/
    └── catch2/
```

## 🧪 Usage Examples

### Basic 2D Simulation
```cpp
#include <iostream>
#include <memory>
#include "ljmd/core/system.hpp"
#include "ljmd/core/particle.hpp"
#include "ljmd/core/forces.hpp"
#include "ljmd/core/integrator.hpp"
#include "ljmd/utils/vector2d.hpp"

using namespace ljmd;

int main() {
    // Create system
    System system(10.0, 10.0);
    
    // Create two particles
    auto particle1 = std::make_shared<Particle>(1.0, 1.0, 1.0);
    auto particle2 = std::make_shared<Particle>(1.0, 1.0, 1.0);
    
    // Set initial positions
    particle1->set_position(Vector2D(4.0, 5.0));
    particle2->set_position(Vector2D(6.0, 5.0));
    
    // Set initial velocities
    particle1->set_velocity(Vector2D(0.1, 0.0));
    particle2->set_velocity(Vector2D(-0.1, 0.0));
    
    // Add particles to system
    system.add_particle(particle1);
    system.add_particle(particle2);
    
    // Set up force calculator and integrator
    system.set_force_calculator(std::make_unique<LennardJonesForces>(2.5));
    system.set_integrator(std::make_unique<EulerIntegrator>());
    
    // Run simulation
    const int num_steps = 1000;
    const double dt = 0.001;
    
    std::cout << "Time\tTotal Energy\tKinetic Energy\tPotential Energy\n";
    
    for (int step = 0; step < num_steps; ++step) {
        system.step(dt);
        
        if (step % 50 == 0) {
            double ke = system.total_kinetic_energy();
            double pe = system.total_potential_energy();
            double total = ke + pe;
            
            std::cout << step * dt << "\t" << total << "\t" 
                     << ke << "\t" << pe << "\n";
        }
    }
    
    return 0;
}
```

## 🤝 Contributing

Contributions are welcome! This project serves as both a learning exercise and a community resource for molecular dynamics education.

### Development Workflow
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-optimization`)
3. Commit changes (`git commit -m 'Add GPU memory pooling'`)
4. Push to branch (`git push origin feature/amazing-optimization`)
5. Open a Pull Request

### Code Standards
- **Python**: Follow PEP 8, use type hints
- **C++/CUDA**: Follow Google C++ Style Guide
- **Documentation**: Include docstrings and inline comments
- **Testing**: Add unit tests for new functionality

## 📚 References and Resources

### Core Literature
- Carter, F., Hitschfeld, N., and Navarro, C. A. (2025). *Mimir: A real-time interactive visualization library for CUDA programs*. University of Chile.
- Nguyen J. (2018). *Shared-Memory Parallelization of Verlet lists*. Technische Universitat Munchen.
- Rizzi M. and Schmitt M. (2022). *Molecular Dynamics: Lennard-Jones Fluid*. M-LAB, Institute of Theoretical Physics, Cologne

### CUDA Programming
- [CUDA Programming Guide](https://docs.nvidia.com/cuda/cuda-c-programming-guide/)
- [CUDA Best Practices Guide](https://docs.nvidia.com/cuda/cuda-c-best-practices-guide/)
- [Molecular Dynamics GPU Optimization](https://developer.nvidia.com/molecular-dynamics)

### Scientific Software Development
- [Best Practices for Scientific Computing](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.1001745)
- [Good Enough Practices](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005510)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📧 Contact

**Project Maintainer**: Sree Kommalapati
- 📧 Email: sree.n.kommalapati@gmail.com
- 🐙 GitHub: [@starman-underground](https://github.com/starman-underground)
- 💼 LinkedIn: [sree-kommalapati](https://www.linkedin.com/in/sree-kommalapati/)
<!-- - 🌐 Website: [yourwebsite.com](https://yourwebsite.com) -->

## 🙏 Acknowledgments

- **Hardware Support**: NVIDIA RTX 5070 for GPU development
- **Scientific Guidance**: Computational physics and molecular dynamics community
- **Open Source Libraries**: CUDA, Eigen, Mimir

---

⭐ **Star this repository if it helps your molecular dynamics journey!**

*Built with ❤️ for the computational physics community*