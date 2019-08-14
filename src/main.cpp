#include <iostream>
#include <csignal>

#include "func.h"

class Test
{
public:
    Test()
    { std::cout << "this is a test\n";} //default constructor.
};

int main() {
   // register signal SIGINT and signal handler
   std::signal(SIGINT,
       [](int signum)
           {
               std::cout << "Interrupt signal (" << signum << ") received.\n";
               exit(signum);
           }
   );

    std::cout << "Hello, World!" << std::endl;
    test_func();
    Test test_one;
    return 0;
}
