
function cost = obj_fcn(x)
    x1 = x(1, 1);
    x2 = x(1, 2);
    cost = (1-x1)^2 + 100*(x2-x1^2)^2;
    
    cost= cost+constraints(x1,x2);
end
