function inv = inv_cost(p_func_cost)
    s = sum(p_func_cost);
    for i = 1:length(p_func_cost)
        inv(i,:) = sqrt(s) / (0.001 + p_func_cost(i,:));
    end
end