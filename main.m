%% Close all figures, clear workspace and console
close all;
clear;
clc;

%% Simulating the Binary Symmetric Channel

% Initialize error prob & data

% er = 0.01;
% 
% len = 7;
% in_data = randi([0, 1], 1, len); % codeword of length = 7
% disp("initial data is: "+num2str(in_data));
% [out_data,err] = bsc(in_data,er);
% 
% disp("output data is: "+num2str(out_data));



%% Application (Not Hamming code!!!)


H = [1 1 0 1 0 0 0; 0 0 1 1 0 1 0; 0 0 0 1 1 0 1];

var_node = zeros(1,7);
chan_node = zeros(2,7);
check_node = zeros(1,3);

chan_node = [0.01, 0.01, 0.01, 0.01, 0.99, 0.99, 0.99;...
        0.99, 0.99, 0.99, 0.99, 0.01, 0.01, 0.01];

% Step_1: Initialize Variable Nodes (Chan to Var)
var_node = init_var(chan_node, var_node);
disp(var_node);

% Step_2: Determine Check Node
check_node(1) = deter_check(var_node(1),var_node(2),var_node(4));
check_node(2) = deter_check(var_node(3),var_node(4),var_node(6));
check_node(3) = deter_check(var_node(4),var_node(5),var_node(7));

% Step_3: Check to Var


<<<<<<< HEAD
=======
[ndata,err] = bsc(data,er);
a = 2;
b = 6;
>>>>>>> b9ffd38a894062ce7e5844010100ca5e820d67a4



