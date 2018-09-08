%
%  Copyright (c) 2018 James Pritts, Denys Rozumnyi, CTU in Prague
%  Licensed under the MIT License (see LICENSE for details)
%
%  Written by James Pritts and Denys Rozumnyi
%
function [] = features_init()
[cmpfeat_base_path, name, ext] = fileparts(mfilename('fullpath'));

addpath(cmpfeat_base_path);
