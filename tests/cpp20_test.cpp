#include <iostream>
#include <vector>
#include <algorithm>
#include <ranges>

int main() {
    std::vector<int> numbers = {5, 3, 1, 4, 2};
    std::vector<int> sorted_numbers = {1, 2, 3, 4, 5};
    std::ranges::sort(numbers);
    if (numbers == sorted_numbers) {
        std::cout << "C++20 Test PASSING!" << std::endl;
    } else {
        std::cout << "C++20 Test FAILING!" << std::endl;
    }
    return 0;
}