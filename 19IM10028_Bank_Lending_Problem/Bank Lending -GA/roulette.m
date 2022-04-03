function index = roulette(pop_fitness)
index=[];
cum_fitness=pop_fitness(1);
for i=2:length(pop_fitness)
    cum_fitness=[cum_fitness pop_fitness(i)+cum_fitness(i-1)];
end
roulette_prob=cum_fitness./sum(pop_fitness);
for i=1:6
    r=rand();
    for j=1:length(pop_fitness)
        if roulette_prob(j)>r
            index=[index j];
            break
        end
    end
end
end

