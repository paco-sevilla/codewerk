#include <Eigen/Dense>
#include <iostream>

int main() {
  Eigen::Matrix2d m;
  m << 1, 2, //
      3, 4;
  std::cout << m << std::endl;
}