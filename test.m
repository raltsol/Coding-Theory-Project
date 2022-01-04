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

codewords = ones(16,7);

for i = 1:16
    codewords(i,:) = mod(u_list(i,:)*G,2);
end

%% Simulating the Binary Symmetric Channel

% Initialize error prob & data

er = 0.1;

len = 7;
% in_data = randi([0, 1], 1, len); % codeword of length = 7
in_data = codewords(2,:);
x = zeros(1,7);
for i = 1:length(in_data)
    if in_data(i) == 0
        x(i) = 1;
    else
        x(i) = -1;
    end
end
disp("x = " + num2str(x))
%disp("initial data is: "+num2str(in_data));
[out_data,err] = bsc(in_data,er);
%disp("output data is: "+num2str(out_data));
disp("errors: "+num2str(err));

y = zeros(1,7);
for i = 1:length(out_data)
    if out_data(i) == 0
        y(i) = 1;
    else
        y(i) = -1;
    end
end
disp("y = " + num2str(y))

%% Graph

var_node = zeros(1,7);
chan_node = lk(x, y, er);
<<<<<<< HEAD
 


check_node_1 = check_node(H,1,chan_node);
check_node_2 = check_node(H,2,chan_node);
check_node_3 = check_node(H,3,chan_node);

check_node_1_sent = check_node_1;
check_node_2_sent = check_node_2;
check_node_3_sent = check_node_3;

% check1_to_var
=======
% check_node = zeros(1,3);

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% Step_1: Initialize Variable Nodes (Chan to Var)
var_node = chan_node;
% temp = mod(H*var_node',2);
% disp(strcat("temp initial is: ", num2str(temp')));








>>>>>>> 9c504b097df2f41c25e559a8b0a017b5d12767c5


for i = 1:size(check_node_1,2)
    
    columns = [1:i-1 i+1:size(check_node_1,2)];
    
    num = check_node_1(1,columns);
    l = 2*atanh(prod(tanh(num/2)));
    
    check_node_1_sent(1,i) = l;
    
    
end

<<<<<<< HEAD







%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% Step_1: Initialize Variable Nodes (Chan to Var)
var_node = chan_node;
% temp = mod(H*var_node',2);
% disp(strcat("temp initial is: ", num2str(temp')));


% if temp == 0
%     
%     disp("There are no errors");
%     disp(strcat("Codeword is ", num2str(var_node)));
%     
% else
%     
%     N = 0;
%     SUM = 1000;
%     
%     while N < 20 && SUM ~= 0 
%         
%         N = N + 1
%         % Step_2: Determine Check Node
%         check_node(1) = deter_check(var_node(2),var_node(3),var_node(4)+var_node(5));
%         check_node(2) = deter_check(var_node(1),var_node(3),var_node(4)+var_node(6));
%         check_node(3) = deter_check(var_node(1),var_node(2),var_node(4)+var_node(7));
% 
%         % Step_3: Check to Var
% 
%         var_node(1) = check_node(2)*check_node(3);
%         var_node(2) = check_node(1)*check_node(3);
%         var_node(3) = check_node(1)*check_node(2);
%         var_node(4) = check_node(1)*check_node(2)*check_node(3);
%         var_node(5) = check_node(1);
%         var_node(6) = check_node(2);
%         var_node(7) = check_node(3);
% 
%         % Step_4: Checking if it's a codeword
%         temp = mod(H*var_node',2);
%         disp(strcat("temp is: ", num2str(temp')));
%         SUM = sum(temp);
%         
%     end
% end
% 
% fprintf('\nFinished decoding\n');
% disp(strcat("Codeword is ", num2str(in_data)));
% disp(strcat("Fixed codeword is ", num2str(var_node)));
% disp(sum(abs(in_data - var_node)))
% disp(sum(abs(in_data - out_data)))
=======
fprintf('\nFinished decoding\n');
disp(strcat("Codeword is ", num2str(in_data)));
disp(strcat("Fixed codeword is ", num2str(var_node)));
disp(sum(abs(in_data - var_node)))
disp(sum(abs(in_data - out_data)))
>>>>>>> 9c504b097df2f41c25e559a8b0a017b5d12767c5
