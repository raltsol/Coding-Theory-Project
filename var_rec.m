function var_receive = var_rec(check_node_sent)
    
    n = length(check_node_sent); 
    var_receive = zeros(1, 2^n - 1);
    
    for cell_counter = 1:n
        
        my_cell = check_node_sent{cell_counter};
        for j = 1:size(my_cell, 2);
            
            var_receive(my_cell(2, j)) = var_receive(my_cell(2, j)) + ...
                                         my_cell(1, j);
            
        end
    end
    
end