#include <iostream>
#include <catch.hpp>

class Test
{
public:
    Test()
    { std::cout << "this is a test\n";}; //default constructor.
};

int main() {
    std::cout << "Hello, World!" << std::endl;

    Test test_one;
    return 0;
}