function y = check_node(H, n, lk)

    y = zeros(2, size(H,2));

    for i = 1:size(H,2)
        
        if H(n,i) == 1
            
           
            y(1,i) = lk(i);
            y(2,i) = i;
           
        end
        
    end
   
    
    y = [nonzeros(y(1,:))'; nonzeros(y(2,:))'];
    
end