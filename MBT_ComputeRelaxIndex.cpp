//
//  MBT_ComputeRelaxIndex.cpp
//
//  Created by Fanny Grosselin on 06/01/2017.
//  Copyright (c) 2017 myBrain Technologies. All rights reserved.
//
//  Update: Fanny Grosselin 2017/01/16 --> Remove the normalization of SNR because we do that after smoothing and not before.
//          Fanny Grosselin 2017/02/03 --> Get the Bounds (from parametersFromCalibration) to detect the outliers of the signal.
// 		    Fanny Grosselin 2017/03/23 --> Change float by double for the functions not directly used by Andro�d. For the others, keep inputs and outputs in double, but do the steps with double.
//          Fanny Grosselin 2017/03/27 --> Fix all the warnings.
//          Fanny Grosselin 2017/09/18 --> Remove Bounds from the input of MBT_ComputeSNR
//          Katerina Pandremmenou 2017/09/20 --> Change the preprocessing (use the bounds from calibration and set the outliers to NaN
//                                               interpolate the nan values between the channels, interpolate each channel across itself,
//                                               remove possible remaining nan values in the beginning or the end of an MBT_Matrix.
//                                               Change all implicit type castings to explicit ones
//          Katerina Pandremmenou 2017/09/28 --> Put all the block with outliers to nan, interpolatation between and across channels, 
//                                               in the case where the calibration is good.
//                                           --> Put outliers of BOTH channels to NaN. Put in comments the function for ignoring remaining nan values. (This is done in MBT_ComputeSNR file).
//
//		Emma Barme : 2017/10/10 Make dummy for bridging

#include "MBT_ComputeRelaxIndex.h"

float MBT_ComputeRelaxIndex(MBT_Matrix<float> sessionPacket, std::map<std::string, std::vector<float> > parametersFromCalibration, const float sampRate, const float IAFinf, const float IAFsup)
{
	return (float) 0.2;
}

MBT_RelaxIndexComputer::MBT_RelaxIndexComputer(Bridge_MatrixFloat* matrix) {
	data = matrix;
}

MBT_RelaxIndexComputer::~MBT_RelaxIndexComputer() {
	delete data;
}

float MBT_RelaxIndexComputer::compute(std::map<std::string, std::vector<float> > parametersFromCalibration, const float sampRate, const float IAFinf, const float IAFsup) {
	return MBT_ComputeRelaxIndex(data->getMatrix(), parametersFromCalibration, sampRate, IAFinf, IAFsup);
}
