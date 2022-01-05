%% Close all figures, clear workspace and console
close all;
clear;
clc;




%% Application (Maybe Hamming code!!!)


n = 3;
H = ham_par(n)
P = H(:, 1:(2^n-1-n));
G = [eye(2^n-1-n) P']
m = 2^n - n - 1;                % rows of G

u_list = dec2bin(0:2^m-1)-'0';



codewords = ones(2^m,2^n-1);

for i = 1:2^m
    codewords(i,:) = mod(u_list(i,:)*G,2);
end
codewords;

%% Simulating the Binary Symmetric Channel

% Initialize error prob & data

er = 0.1;
len = size(codewords, 2);
% Random codeword ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
in_data = codewords(3,:);
x = zeros(1, len);

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

y = zeros(1, len);
for i = 1:length(out_data)
    
    if out_data(i) == 0
        y(i) = 1;
    else
        y(i) = -1;
    end
    
end
disp("y = " + num2str(y))

%% Graph
% Initialize
chan_node = lk(x, y, er);

check_nodes_receive = cell(1, n);
for i = 1:n
    
   check_nodes_receive{i} = check_node(H,i,chan_node);
    
end


% Iterations
limit = 100;
counter = 0;
SUM = 1000;

while (counter <= limit) && SUM ~= 0
    
    counter = counter + 1
    check_nodes_sent = check2var(check_nodes_receive, n);
    var_nodes_receive = var_rec(check_nodes_sent);
    var_values = map_detection(var_nodes_receive);
    
    % x^ = 1 - 2x => x = (1 - x^) / 2
    % x = x, x^ = var_values
    var_values_01 = (1 - var_values) / 2;
    temp = mod(H*var_values_01',2)
    SUM = sum(temp);
    
    for i = 1:n
    
        check_nodes_receive{i} = check_node(H,i,var_nodes_receive);
    
    end
    
end

display(' ');
disp("x^= " + num2str(var_values));
disp("x = " + num2str(x))
disp("Errors: " + num2str(sum(abs(x-var_values))/2));
disp("x = " + num2str(in_data));
disp("x^= " + num2str(var_values_01));
