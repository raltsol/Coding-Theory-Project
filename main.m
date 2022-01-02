%% Close all figures, clear workspace and console
close all;
clear;
clc;

%% Simulating the Binary Symmetric Channel

% Initialize error prob & data
er = 0.1;

len = 10;
data = randi([0, 1], 1, len);

[ndata,err] = bsc(data,er);
a = 2;



