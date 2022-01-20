function[Neighbors] = genNeighbors (X, Lb, Ub, step)

nVar = length(X.position);
idx = 0;

% Everytime we calculate 2 neighbors x+step & x-step
% and also the obj func value at the two new neighboring points

for i= 1:nVar
    idx = idx+1; 
    stepVec = zeros(1,nVar);
    stepVec(i) = step (i);
    Neighbors(idx).position = X.position + stepVec;
    
    % if value of x+step crosses upper or lower bound , we limit it 

    if Neighbors(idx).position(i) > Ub(i) 
        Neighbors(idx).position (i)= Ub(i)
    end
    if Neighbors(idx).position(i) < Lb(i) 
        Neighbors(idx).position(i)= Lb(i)
    end
    
    Neighbors(idx).cost = objFun(Neighbors(idx).position); 

    
    idx = idx+1
    
    stepVec = zeros(1,nVar);
    stepVec(i) = step (i);
    Neighbors(idx).position = X.position - stepVec;
    
    if Neighbors(idx).position(i) > Ub(i) 
        Neighbors(idx).position (i)= Ub(i)
    end
    if Neighbors(idx).position(i) < Lb(i) 
        Neighbors(idx).position(i)= Lb(i)
    end
    
    Neighbors(idx).cost = objFun(Neighbors(idx).position); 
end