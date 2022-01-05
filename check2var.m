function check_node_sent = check2var(check_node_receive, n)
    
    check_node_sent = cell(1, n);
    
    for cell_counter = 1:n
        c = check_node_receive{cell_counter};
        
        for i = 1:size(c,2)

            columns = [1:i-1 i+1:size(c,2)];
            num = c(1,columns);
            % l is a row vector
            l = 2*atanh(prod(tanh(num/2)));
            check_node_sent{cell_counter}(1, i) = l;
            check_node_sent{cell_counter}(2, i) = check_node_receive{cell_counter}(2, i);
            
        end
    end

end