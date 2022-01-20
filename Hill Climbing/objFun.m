function [f] = objFun(x)
%f= -x.^2; 

if x>=1 && x<=2 
    f = 2 - (x-4).^2;
elseif x>2 && x<=4
    f = 4;
else 
    f= 8-(x-2).^2;
end 
    