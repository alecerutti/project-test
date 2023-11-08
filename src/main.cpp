#include <iostream>

#include "cmake-test/printer.h"
#include "my_static_lib/printer.h"
#include "my_dynamic_lib/printer.h"

int main()
{
    print();
    my_static_library::print();
    my_dynamic_library::print();

    return 0;
}