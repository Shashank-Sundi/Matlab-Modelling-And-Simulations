function[Neighbors] = genNeighbors (X, lb, ub, step)

nVar = length(X.position);
stepVec = zeros(1,nVar);
stepVec(1) = step (1);
stepVec(2)= step (1);

% Everytime we calculate 2 neighbors x+step & x-step
% and also the obj func value at the two new neighboring points

for i= 1:nVar
    % calc. new neigbor = x+step
    Neighbors(1).position = X.position + stepVec;
    % if value of x+step crosses upper or lower bound , we limit it 
    if Neighbors(1).position(i) > ub
        Neighbors(1).position (i)= ub;
    end
    if Neighbors(1).position(i) < lb
        Neighbors(1).position(i)= lb;     
    end
    Neighbors(1).cost = objfunc(Neighbors(1).position(1), ...
                            Neighbors(1).position(2)); 

    % calc. new neigbor = x-step
    Neighbors(2).position = X.position - stepVec;
    if Neighbors(2).position(i) > ub
        Neighbors(2).position (i)= ub;
    end
    if Neighbors(2).position(i) < lb
        Neighbors(2).position(i)= lb;
    end
    
    Neighbors(2).cost = objfunc(Neighbors(2).position(1), ...
                            Neighbors(2).position(2)); 
end