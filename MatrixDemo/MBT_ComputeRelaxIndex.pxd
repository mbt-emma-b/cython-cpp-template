from libcpp.vector cimport vector
from libcpp.map cimport map
from libcpp.string cimport string
from Bridge_MatrixFloat cimport Bridge_MatrixFloat

cdef extern from "MBT_ComputeRelaxIndex.h":
	cppclass MBT_RelaxIndexComputer:
		MBT_RelaxIndexComputer(const Bridge_MatrixFloat*) except +
		float compute(map[string, vector[float]], const float, const float, const float)
	
