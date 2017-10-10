from libcpp.vector cimport vector
from libcpp.pair cimport pair


cdef extern from "MBT_Matrix.h":
	cppclass Bridge_MatrixFloat :
		Bridge_MatrixFloat(unsigned int, unsigned int, const vector[float]&) except +
		float at(const int, const int) const
		pair[int, int] size() const
		vector[float] row(const int) const
		vector[float] column(const int) const

