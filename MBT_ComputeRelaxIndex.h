//
//  MBT_ComputeRelaxIndex.h
//
//  Created by Fanny Grosselin on 06/01/2017.
//  Copyright (c) 2017 myBrain Technologies. All rights reserved.
//
//  Update: 2017/03/23 by Fanny Grosselin --> Change float by double for the functions not directly used by Androïd.
//		Fanny Grosselin : 2017/09/05 Change the pathes.
//		Emma Barme : 2017/10/10 Make dummy for bridging

#ifndef MBT_COMPUTERELAXINDEX_H_INCLUDED
#define MBT_COMPUTERELAXINDEX_H_INCLUDED

#include <stdio.h>
#include <iostream>
#include <vector>
#include <map>
#include <string>
#include <errno.h>
#include <math.h>
#include <limits>
#include <algorithm>
#include "MBT_Matrix.h"


/*
 * @brief Computes the relaxation index of the signal of the channel which had the best quality during the calibration. For now, only takes the first two channels into account.
          The relaxation index is computed each second with segments of 4s with a sliding window of 1s.
 * @param sessionPacket MBT_Matrix holding the signal.
 * @param parametersFromCalibration A dictionnary holding the various parameter values.
 * @param sampRate The signal sampling rate.
 * @param IAFinf Lower bound of the frequency range which will be used to compute SNR. For example IAFinf = 7 to compute SNR alpha.
 * @param IAFsup Upper bound of the frequency range which will be used to compute SNR. For example IAFsup = 13 to compute SNR alpha.
 * @return The relaxation index value.
 */
float MBT_ComputeRelaxIndex(MBT_Matrix<float> sessionPacket, std::map<std::string, std::vector<float> > parametersFromCalibration, const float sampRate, const float IAFinf, const float IAFsup);

/**
 * Wrapper for Cython bridge
 */
class MBT_RelaxIndexComputer {
private:
	Bridge_MatrixFloat* data;
public:
	MBT_RelaxIndexComputer(Bridge_MatrixFloat* matrix);
	~MBT_RelaxIndexComputer();
	float compute(std::map<std::string, std::vector<float> > parametersFromCalibration, const float sampRate, const float IAFinf, const float IAFsup);
};


#endif // MBT_COMPUTERELAXINDEX_H_INCLUDED

