//
//  MBT_Matrix.cpp
//  MBT.iOS
//
//  Created by Emma Barme on 19/10/2015.
//  Copyright (c) 2015 Emma Barme. All rights reserved.
//
//	Update: Emma Barme 10/10/2017 --> Add intermediate typed classes for the Cython bridge


#include "MBT_Matrix.h"

Bridge_MatrixFloat::Bridge_MatrixFloat(unsigned int height, unsigned int width, const std::vector<float>& data) {
	matrix = MBT_Matrix<float>(height, width, data);
}

Bridge_MatrixFloat::~Bridge_MatrixFloat() {
}

float Bridge_MatrixFloat::at(const int row, const int col) {
	return matrix(row, col);
}

std::pair<int, int> Bridge_MatrixFloat::size() const {
	return matrix.size();
}

std::vector<float> Bridge_MatrixFloat::row(const int rowIndex) const {
	return matrix.row(rowIndex);
}

std::vector<float> Bridge_MatrixFloat::column(const int columnIndex) const {
	return matrix.column(columnIndex);
}

MBT_Matrix<float>& Bridge_MatrixFloat::getMatrix() {
	return matrix;
}


Bridge_MatrixDouble::Bridge_MatrixDouble(unsigned int height, unsigned int width, const std::vector<double>& data) {
	matrix = MBT_Matrix<double>(height, width, data);
}

Bridge_MatrixDouble::~Bridge_MatrixDouble() {
}

double Bridge_MatrixDouble::at(const int row, const int col) {
	return matrix(row, col);
}

std::pair<int, int> Bridge_MatrixDouble::size() const {
	return matrix.size();
}

std::vector<double> Bridge_MatrixDouble::row(const int rowIndex) const {
	return matrix.row(rowIndex);
}

std::vector<double> Bridge_MatrixDouble::column(const int columnIndex) const {
	return matrix.column(columnIndex);
}

MBT_Matrix<double>& Bridge_MatrixDouble::getMatrix() {
	return matrix;
}
