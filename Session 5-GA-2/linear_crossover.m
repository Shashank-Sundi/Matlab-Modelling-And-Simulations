function children = linear_crossover(pop,j,maxit)
children = [];
n1 = 1.5*(maxit-j+1)/maxit;
n2 = 0.5*(maxit-j+1)/maxit;
for i = 1:2:length(pop)
    p1 = pop(i,:);
    p2 = pop(i+1,:);
    c1 = (p1+p2)./2;
    if mean(p2)>mean(p1)
        c2 = p2.*n1-p1.*n2;
        c3 = p1.*n1-p2.*n2;
    else
        c2 = p1.*n1-p2.*n2;
        c3 = p2.*n1-p1.*n2;
    end
    child = [c1;c2;c3];
    for i=1:length(child)
        obj(i,1) = obj_fcn(child(i,:));
    end
    child = sortrows([child,obj],3);
    child = child(1:2,1:2);
    children = [children;child];
end