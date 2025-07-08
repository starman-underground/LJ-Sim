#include <iostream>
#include <Eigen/Dense>

int main() {
    // Test basic Eigen operations
    Eigen::Matrix3d rotation = Eigen::Matrix3d::Identity();
    Eigen::Vector3d position(1.0, 2.0, 3.0);

    std::cout << "Eigen working! Position vector:\n" << position << std::endl;
    std::cout << "Matrix determinant:\n" << rotation.determinant() << std::endl;

    // Test math ops related to LJ simulation
    Eigen::Vector3d force = position * 2.5;
    std::cout << "Fource calculation: " << force.transpose() << std::endl;

    return 0;
}