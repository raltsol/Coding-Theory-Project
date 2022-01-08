function check_node_receive = var2check(H, n, pos, flag)
    
    cols_H = size(H,2);
    check_node_receive = zeros(2, cols_H);
    
    if flag == 1
        for i = 1:cols_H

            if H(n,i) == 1
                check_node_receive(1,i) = pos(i);
                check_node_receive(2,i) = i;
            end
            
        end
        
    elseif flag == 0
         for i = 1:cols_H

            if H(n,i) == 1

                check_node_receive(1,i) = 0;
                check_node_receive(2,i) = i;
            end
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


