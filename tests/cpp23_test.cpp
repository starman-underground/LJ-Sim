#include <iostream>
#include <vector>
#include <ranges>

int main() {
    std::vector<int> numbers = {1, 2, 3, 4, 5};
    std::vector<int> correct_even_numbers = {2, 4};
    auto even_numbers = numbers | std::views::filter([](int n) { return n % 2 == 0; });
    std::vector<int> even_numbers_vec(even_numbers.begin(), even_numbers.end());
    if (even_numbers_vec == correct_even_numbers) {
        std::cout << "C++23 Test PASSING!" << std::endl;
    } else {
        std::cout << "C++23 Test FAILING!" << std::endl;
    }
    return 0;
}