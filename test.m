%% Close all figures, clear workspace and console
close all;
clear;
clc;




%% Application (Maybe Hamming code!!!)


H = [0 1 1 1 1 0 0; 1 0 1 1 0 1 0; 1 1 0 1 0 0 1];
P = H(:,1:4);
G = [eye(4) P'];


u_list = [0 0 0 0;
     0 0 0 1;
     0 0 1 0;
     0 0 1 1;
     0 1 0 0;
     0 1 0 1;
     0 1 1 0;
     0 1 1 1;
     1 0 0 0;
     1 0 0 1;
     1 0 1 0;
     1 0 1 1;
     1 1 0 0;
     1 1 0 1;
     1 1 1 0;
     1 1 1 1];

x = ones(16,7);

for i = 1:16
    x(i,:) = mod(u_list(i,:)*G,2);
end

%% Simulating the Binary Symmetric Channel

% Initialize error prob & data

er = 0.2;

len = 7;
% in_data = randi([0, 1], 1, len); % codeword of length = 7
in_data = x(2,:);
disp("initial data is: "+num2str(in_data));

[out_data,err] = bsc(in_data,er);

disp("output data is: "+num2str(out_data));
disp("errors: "+num2str(err));

%% Graph

var_node = zeros(1,7);
chan_node = zeros(2,7);
check_node = zeros(1,3);

% chan_node = [0.01, 0.01, 0.01, 0.01, 0.99, 0.99, 0.99;...
%         0.99, 0.99, 0.99, 0.99, 0.01, 0.01, 0.01];

% Step_1: Initialize Variable Nodes (Chan to Var)
% var_node = init_var(chan_node, var_node);

var_node = out_data;
% disp(var_node);
temp = mod(H*var_node',2);
disp("temp is: ", num2str(temp));

if temp == 0
    
    disp("There are no errors");
    disp(strcat("Codeword is ", num2str(var_node)));
    
else
    
    % Step_2: Determine Check Node
    check_node(1) = deter_check(var_node(2),var_node(3),var_node(4)+var_node(5));
    check_node(2) = deter_check(var_node(1),var_node(3),var_node(4)+var_node(6));
    check_node(3) = deter_check(var_node(1),var_node(2),var_node(4)+var_node(7));

    % Step_3: Check to Var

    var_node(1) = check_node(2)*check_node(3);
    var_node(2) = check_node(1)*check_node(3);
    var_node(3) = check_node(1)*check_node(2);
    var_node(4) = check_node(1)*check_node(2)*check_node(3);
    var_node(5) = check_node(1);
    var_node(6) = check_node(2);
    var_node(7) = check_node(3);

    % Step_4: Checking if it's a codeword
    temp = mod(H*var_node',2);
    disp("temp is: "+num2str(temp));
    
end




















