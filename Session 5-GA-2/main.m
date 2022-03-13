%% Author : Shashank Sundi :19IM10028
%% Session 6 - Genetic Algorithm 2

clc
clear
close all
format short

%% algoritm parameter
xmax = [5, 5];
xmin = [-5, -5];
Dpop = length(xmax);
Npop = 10;
maxit = 50;
crossover_probability = 0.7;
mutation_probability = 0.02;

for i = 1:Npop
    pop(i, :) = xmin + rand (1, Dpop) .* [xmax - xmin];
    p_func_cost(i, 1) = obj_fcn([pop(i, :)]);
end

p_inv_cost = inv_cost(p_func_cost);

p_cost = sortrows([pop,p_func_cost,p_inv_cost], Dpop+2);
Gbestcost = p_cost(Npop,Dpop+1);
Gbestsol = p_cost(Npop,1:Dpop);



%% main loop
for j = 1:maxit

    %SELECTING PARENT POOL
    p_inv_cost = p_cost(1:Npop, Dpop+2);
    pop = p_cost(1:Npop, 1:Dpop);

    F = abs(p_inv_cost-p_inv_cost(1,:));
    FF = sum(F);
    p = F / FF;
    c(1, 1) = p(1, 1);
    for i = 2:Npop
        c(i, 1) = c(i-1, 1) + p(i, 1);
    end

    parent_pool = [];
    for i = 1:Npop
        if length(parent_pool) == 0
            len = 0;
        else
            len = parent_pool(end);
        end
        parent_pool = [parent_pool, roulette(c, len, 0)];
    end

    
    
    %LINEAR CROSSOVER
    parent_pop = pop(parent_pool,:);
    crossed_pool = linear_crossover(parent_pop,j,maxit);
    
    %PREPARING NEW POPULATION
    pop_new = [];
    %for i = 1:Dpop
    for i = 1:2:Npop
        if crossover_probability > rand
            pop_new = [pop_new; crossed_pool(i:i+1,:)];
        else
            pop_new = [pop_new; parent_pop(i:i+1,:)];
        end
    end

    pop_new;
    %end
    %for i = 1:Dpop
        %if crossover_probability > rand
            %popchild2(:, i) = popmother_cross(:, i);
        %else
            %popchild2(:, i) = popmother(:, i);
        %end
    %end
    %pop_new = [popchild1; popchild2];

    if mutation_probability > rand
        o = floor(Npop * rand + 1);
        if o<0
            o = 0;
        elseif o > Npop
            o = Npop;
        end
        pop_new(o, :) = pop_new (o, :) .* rand(1, Dpop);
    end

    for i = 1:Npop
        p_func_cost(i, 1) = obj_fcn([pop_new(i, :)]);
    end

    p_inv_cost = inv_cost(p_func_cost);

    p_cost = sortrows([pop_new,p_func_cost,p_inv_cost], Dpop+2);
    
    gbestcost = p_cost(Npop, Dpop+1);
    if gbestcost < Gbestcost
        Gbestcost = gbestcost;
        Gbestsol = p_cost(Npop,1:Dpop);
    end

    disp(['Iteration ', num2str(j), ':   Best Cost = ', num2str(Gbestcost)]);
    l1(j, 1) = j;
    l2(j, 1) = Gbestcost;

end

%% final result
result = [l1, l2];
pop_new(1, 1:2)
plot(l1, l2);
xlabel('No of iteration')
ylabel('Best cost f (x)')
hold on
xlim([1, maxit])
