from distutils.core import setup
from Cython.Build import cythonize

setup(
    ext_modules = cythonize(['pytestclass.pyx', 'MatrixDemo/PyCppMatrix.pyx', 'MatrixDemo/PyComputeRelaxIndex.pyx', '_test.pyx'])
)

