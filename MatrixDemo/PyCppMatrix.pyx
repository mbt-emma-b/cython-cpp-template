# distutils: language = c++
# distutils: sources = MatrixDemo/MBT_Matrix.cpp

from Bridge_MatrixFloat cimport Bridge_MatrixFloat
from Bridge_MatrixDouble cimport Bridge_MatrixDouble
from libcpp.vector cimport vector
from libcpp.pair cimport pair

cdef class PyCppMatrixFloat:

	""" 
	Cython wrapper class for C++ class Bridge_MatrixFloat
	"""
	cdef:
		Bridge_MatrixFloat *_thisptr


	def __cinit__(PyCppMatrixFloat self, int height, int width, vector[float] data):
		# Initialize the "this pointer" to NULL so __dealloc__
		# knows if there is something to deallocate. Do not 
		# call new TestClass() here.
		self._thisptr = NULL

	def __init__(PyCppMatrixFloat self, int height, int width, vector[float] data):
		# Constructing the C++ object might raise std::bad_alloc
		# which is automatically converted to a Python MemoryError
		# by Cython. We therefore need to call "new TestClass()" in
		# __init__ instead of __cinit__.
		self._thisptr = new Bridge_MatrixFloat(height, width, data) 

	def __dealloc__(PyCppMatrixFloat self):
		# Only call del if the C++ object is alive, 
		# or we will get a segfault.
		if self._thisptr != NULL:
			del self._thisptr

	cdef int _check_alive(PyCppMatrixFloat self) except -1:
		# Beacuse of the context manager protocol, the C++ object
		# might die before PyTestClass self is reclaimed.
		# We therefore need a small utility to check for the
		# availability of self._thisptr
		if self._thisptr == NULL:
			raise RuntimeError("Wrapped C++ object is deleted")
		else:
			return 0



	def at(PyCppMatrixFloat self, int row, int col):
		return self._thisptr.at(row, col)

	def size(PyCppMatrixFloat self):
		return self._thisptr.size()

	def row(PyCppMatrixFloat self, int rowIndex):
		return self._thisptr.row(rowIndex)

	def column(PyCppMatrixFloat self, int columnIndex):
		return self._thisptr.column(columnIndex)


	# The context manager protocol allows us to precisely
	# control the liftetime of the wrapped C++ object. del
	# is called deterministically and independently of 
	# the Python garbage collection.
	def __enter__(PyCppMatrixFloat self):
		self._check_alive()
		return self

	def __exit__(PyCppMatrixFloat self, exc_tp, exc_val, exc_tb):
		if self._thisptr != NULL:
			del self._thisptr 
			self._thisptr = NULL # inform __dealloc__
		return False # propagate exceptions


cdef class PyCppMatrixDouble:
	""" 
	Cython wrapper class for C++ class Bridge_MatrixDouble
	"""
	cdef:
		Bridge_MatrixDouble *_thisptr


	def __cinit__(PyCppMatrixDouble self, int height, int width, vector[double] data):
		# Initialize the "this pointer" to NULL so __dealloc__
		# knows if there is something to deallocate. Do not 
		# call new TestClass() here.
		self._thisptr = NULL

	def __init__(PyCppMatrixDouble self, int height, int width, vector[double] data):
		# Constructing the C++ object might raise std::bad_alloc
		# which is automatically converted to a Python MemoryError
		# by Cython. We therefore need to call "new TestClass()" in
		# __init__ instead of __cinit__.
		self._thisptr = new Bridge_MatrixDouble(height, width, data) 

	def __dealloc__(PyCppMatrixDouble self):
		# Only call del if the C++ object is alive, 
		# or we will get a segfault.
		if self._thisptr != NULL:
			del self._thisptr

	cdef int _check_alive(PyCppMatrixDouble self) except -1:
		# Beacuse of the context manager protocol, the C++ object
		# might die before PyTestClass self is reclaimed.
		# We therefore need a small utility to check for the
		# availability of self._thisptr
		if self._thisptr == NULL:
			raise RuntimeError("Wrapped C++ object is deleted")
		else:
			return 0


	def at(PyCppMatrixDouble self, int row, int col):
		return self._thisptr.at(row, col)

	def size(PyCppMatrixDouble self):
		return self._thisptr.size()

	def row(PyCppMatrixDouble self, int rowIndex):
		return self._thisptr.row(rowIndex)

	def column(PyCppMatrixDouble self, int columnIndex):
		return self._thisptr.column(columnIndex)


	# The context manager protocol allows us to precisely
	# control the liftetime of the wrapped C++ object. del
	# is called deterministically and independently of 
	# the Python garbage collection.
	def __enter__(PyCppMatrixDouble self):
		self._check_alive()
		return self

	def __exit__(PyCppMatrixDouble self, exc_tp, exc_val, exc_tb):
		if self._thisptr != NULL:
			del self._thisptr 
			self._thisptr = NULL # inform __dealloc__
		return False # propagate exceptions




