
from _test import *
from PyCppMatrix import *
from PyComputeRelaxIndex import PyComputeRelaxIndex

print("\n\n")

print("testing the class directly")
test_the_cppclass()
print("\n")

print("trying to create a memory leak")
test_memory_leak()
print("Did it work?")
print("\n")

print("testing the wrapped class")
test_the_wrapped_class()
print("\n")

print("testing the wrapped class as context manager")
test_as_context_manager()
print("\n")

print("testing with C++ object on the stack")
test_with_raii()
print("\n")

print("testing wrapped class directly in Python")
T = PyTestClass()
T.x = 15
print("Should be 15:")
print(T.x)
print("Should be True:")
print(T.signOfa())
T = None
T = PyTestClass(-3)
print("Should be False:")
print(T.signOfa())
T = None
print("\n")


print("testing wrapped matrix class")
print("float")
M = PyCppMatrixFloat(4, 2, [2.0, 1.2, 3.4, 9.0, 3.1, 3.9, 5.8, 4.5])
print("Should be 3.1:")
print(M.at(2,0))
print("Should be (4,2)")
print(M.size())
print("Should be [3.4, 9.0]")
print(M.row(1))
print("Should be [2.0, 3.4, 3.1, 5.8]")
print(M.column(0))
M = None
print("double")
M = PyCppMatrixDouble(4, 2, [2.0, 1.2, 3.4, 9.0, 3.1, 3.9, 5.8, 4.5])
print("Should be 3.1:")
print(M.at(2,0))
print("Should be (4,2)")
print(M.size())
print("Should be [3.4, 9.0]")
print(M.row(1))
print("Should be [2.0, 3.4, 3.1, 5.8]")
print(M.column(0))
M = None
print("\n")

print("testing relax index computer")
C = PyComputeRelaxIndex(4, 2, [2.0, 1.2, 3.4, 9.0, 3.1, 3.9, 5.8, 4.5])
print("Should be 0.2:")
print(C.compute({"param": [0.3, 0.123]}, 0.250, 0.12, 0.34))
C = None


