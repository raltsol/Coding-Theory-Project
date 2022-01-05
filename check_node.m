function y = check_node(H, n, lk)

    y = zeros(2, size(H,2));
    % y = 100000 * ones(2, size(H, 2));
    
    for i = 1:size(H,2)
        
        if H(n,i) == 1
            
           
            y(1,i) = lk(i);
            y(2,i) = i;
           
        end
        
    end
   
    for column = 1:size(H,2)
    
        if y(:, column) ~= 0
            y(:, column) = y(:, column) + 1;
        end
    end
    
    y = [nonzeros(y(1,:))'; nonzeros(y(2,:))'];
    
    y = y-1;
    
end


