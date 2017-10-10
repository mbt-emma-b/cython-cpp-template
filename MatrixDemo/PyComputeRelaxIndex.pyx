# distutils: language = c++
# distutils: sources = MatrixDemo/MBT_ComputeRelaxIndex.cpp MatrixDemo/MBT_Matrix.cpp

from MBT_ComputeRelaxIndex cimport MBT_RelaxIndexComputer
from Bridge_MatrixFloat cimport Bridge_MatrixFloat
from libcpp.vector cimport vector
from libcpp.map cimport map
from libcpp.string cimport string

cdef class PyComputeRelaxIndex:
	cdef:
		MBT_RelaxIndexComputer *_thisptr

	def __cinit__(PyComputeRelaxIndex self, int height, int width, vector[float] data):
		# Initialize the "this pointer" to NULL so __dealloc__
		# knows if there is something to deallocate. Do not 
		# call new TestClass() here.
		self._thisptr = NULL

	def __init__(PyComputeRelaxIndex self, int height, int width, vector[float] data):
		# Constructing the C++ object might raise std::bad_alloc
		# which is automatically converted to a Python MemoryError
		# by Cython. We therefore need to call "new TestClass()" in
		# __init__ instead of __cinit__.

		self._thisptr = new MBT_RelaxIndexComputer(new Bridge_MatrixFloat(height, width, data)) 

	def __dealloc__(PyComputeRelaxIndex self):
		# Only call del if the C++ object is alive, 
		# or we will get a segfault.
		if self._thisptr != NULL:
			del self._thisptr

	cdef int _check_alive(PyComputeRelaxIndex self) except -1:
		# Beacuse of the context manager protocol, the C++ object
		# might die before PyTestClass self is reclaimed.
		# We therefore need a small utility to check for the
		# availability of self._thisptr
		if self._thisptr == NULL:
			raise RuntimeError("Wrapped C++ object is deleted")
		else:
			return 0

	def compute(PyComputeRelaxIndex self, map[string,vector[float]] parametersFromCalibration, const float sampRate, const float IAFinf, const float IAFsup):
		return self._thisptr.compute(parametersFromCalibration, sampRate, IAFinf, IAFsup)

	# The context manager protocol allows us to precisely
	# control the liftetime of the wrapped C++ object. del
	# is called deterministically and independently of 
	# the Python garbage collection.
	def __enter__(self):
		self._check_alive()
		return self

	def __exit__(PyComputeRelaxIndex self, exc_tp, exc_val, exc_tb):
		if self._thisptr != NULL:
			del self._thisptr 
			self._thisptr = NULL # inform __dealloc__
		return False # propagate exceptions
