#pragma once
#include <Eigen/Dense>

namespace ljmd {

    class Particle {
    private:
        double mass_;
        double sigma_;
        double epsilon_;
        Eigen::Vector3d position_;
        Eigen::Vector3d velocity_;
        Eigen::Vector3d force_;

    public:
        Particle(double mass, double sigma, double epsilon)
            : mass_(mass), sigma_(sigma), epsilon_(epsilon),
              position_(Eigen::Vector3d::Zero()),
              velocity_(Eigen::Vector3d::Zero()),
              force_(Eigen::Vector3d::Zero()) {}

        void set_position(double x, double y, double z) {
            position_ << x, y, z;
        }

        void set_velocity(double vx, double vy, double vz) {
            velocity_ << vx, vy, vz;
        }

        void set_force(double fx, double fy, double fz) {
            force_ << fx, fy, fz;
        }

        const Eigen::Vector3d& position() const { return position_; }
        const Eigen::Vector3d& velocity() const { return velocity_; }
        const Eigen::Vector3d& force() const { return force_;}
        Eigen::Vector3d& position() { return position_; }
        Eigen::Vector3d& velocity() { return velocity_; }
        Eigen::Vector3d& force() { return force_;}
        
        double mass() const { return mass_; }
        double sigma() const { return sigma_; }
        double epsilon() const { return epsilon_; }

        double kinetic_energy() const {
            return 0.5 * mass_ * velocity_.squaredNorm();
        }
    };
} // namespace ljmd