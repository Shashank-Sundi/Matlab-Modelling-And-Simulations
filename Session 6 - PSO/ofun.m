function f=ofun(x)
%objective function (minimization)
%of=x(1)^2-2*(x(1))-1;
cons1 = x(1)+x(2)+x(3)- 5; 
cons2 = x(1)^2+2*x(2)-x(3); 
lambda1=0.1;
lambda2=0.6;

of=10*(x(1)-1)^2+20*(x(2)-2)^2+30*(x(3)-3)^2 + lambda1*cons1 +lambda2*cons2;
f=of;