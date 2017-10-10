from libcpp.vector cimport vector
from libcpp.pair cimport pair


cdef extern from "MBT_Matrix.h":
	cppclass Bridge_MatrixDouble:
		Bridge_MatrixDouble(unsigned int, unsigned int, const vector[double]&) except +
		double at(const int, const int) const
		pair[int, int] size() const
		vector[double] row(const int) const
		vector[double] column(const int) const

