function penalty = constraints(x1,x2)
    multiplier = 30;    % Penalty 30%
    constraint = x1^2+x1-x2+1.5;  %x1^2+x1-x2+1.5<=0
    penalty = 0;
    if constraint >0
        penalty = penalty + multiplier*constraint;
    end
   
end