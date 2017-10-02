#include <iostream>

#include "testclass.h"

TestClass::TestClass(): a(0)
{
    std::cout << "Calling constructor" << std::endl;
}

TestClass::TestClass(int a): a(a)
{
    std::cout << "Calling constructor with arg " << a << std::endl;
}

TestClass::~TestClass()
{
    std::cout << "Calling destructor" << std::endl;
}

bool TestClass::signOfa() {
    return (a >= 0);
}





    
    
