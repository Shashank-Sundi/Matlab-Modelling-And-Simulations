function index = roulette(c, id, count)
    num = rand;
    flag = 1;
    for i = length(c):-1:1
        if num>c(i,1)
            if id == (i+1) && count <5
                roulette(c,id, count + 1);
            else
                index = i+1;
                flag = 0;
                break;
            end
        end
    end
    if flag == 1
        index = 1;
    end
end