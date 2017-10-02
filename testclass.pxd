
# Using a .pxd file gives us a separate namespace for
# the C++ declarations. Using a .pxd file also allows
# us to reuse the declaration in multiple .pyx modules.

from libcpp cimport bool

cdef extern from "testclass.h":

    cppclass TestClass:
        int x,y
        TestClass() except +  # NB! std::bad_alloc will be converted to MemoryError
        TestClass(int) except +
        bool signOfa()
        int Multiply(int a, int b)





