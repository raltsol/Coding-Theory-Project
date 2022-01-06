function check_node_receive = var2check(H, n, chan_node)
    
    cols_H = size(H,2);
    check_node_receive = zeros(2, cols_H);
    
    for i = 1:cols_H
        
        if H(n,i) == 1
 
            check_node_receive(1,i) = chan_node(i);
            check_node_receive(2,i) = i;
        end
        
    end
   
    for column = 1:size(H,2)
    
        if check_node_receive(2, column) ~= 0  
            check_node_receive(:, column) = check_node_receive(:, column) + 1;
        end
    end
    
    check_node_receive = [nonzeros(check_node_receive(1,:))'; nonzeros(check_node_receive(2,:))'];
    check_node_receive = check_node_receive-1;
    
end


