
%% Name: MSTV
% MSTV for Hyperspectral image classification
% Copyright(c) 2018 Puhong Duan
% All Rights Reserved.
%
% ----------------------------------------------------------------------
% Permission to use, copy, or modify this software and its documentation
% for educational and research purposes only and without fee is here
% granted, provided that this copyright notice and the original authors'
% names appear on all copies and supporting documentation. This program
% shall not be used, rewritten, or adapted as the basis of a commercial
% software or hardware product without first obtaining permission of the
% authors. The authors make no representations about the suitability of
% this software for any purpose. It is provided "as is" without express
% or implied warranty.
%----------------------------------------------------------------------
%
% This is an implementation of the method for Hyperspectral image
% classification which is robust to Gaussian noise via multi-scale total variation

% if you use this code, Please cite the following paper:
%
%  P. Duan et al.,"Noise-Robust Hyperspectral Image Classification via Multi-Scale Total Variation"
% IEEE Journal of Selected Topics in Applied Earth Observations and Remote Sensing, 2019.
%%
clc,clear
close all
%%%%%
addpath(genpath('functions'))
addpath(genpath('libsvm-3.22'))
%% Load hyperspectral image
path='.\Dataset\';
inputs = 'IndiaP';% Indian dataset
location = [path,inputs];
load (location);
%% Multi-scale total variation method
[OA,AA,kappa,CA]=MSTV(img,GroundT);
%% Evaluation
OA_mean=mean(OA);
AA_mean=mean(AA);
kappa_mean=mean(kappa);
CA_mean=mean(CA,2);
disp('%%%%%%%%%%%%%%%%%%% Classification Results of MSTV Method %%%%%%%%%%%%%%%%')
disp(['OA',' = ',num2str(OA_mean),' ||  ','AA',' = ',num2str(AA_mean),'  ||  ','Kappa',' = ',num2str(kappa_mean)])

