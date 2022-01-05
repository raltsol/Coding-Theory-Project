function l = lk(x, y, er)

    l = zeros(1, length(x));

    for i = 1:length(x)
       
        if y(i) == 1
            rk = (1 - er) / er;
        else
            rk = er / (1 - er);
        end
        l(i) = log(rk);
        
    end

end

