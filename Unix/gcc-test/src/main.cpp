#include <iostream>

//#include "printer.h" // dico quando compilo che si trova in include (gcc ... -I include/) 

//#include "my_static_lib/printer.h"
#include "my_dynamic_lib/printer.h"

int main()
{
    //print();
    //my_static_library::print();
    my_dynamic_library::print();

    return 0;
}
