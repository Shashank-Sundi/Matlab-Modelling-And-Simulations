function child = crossover(parent1,parent2)
i=randsample(10,1);
child=cat(2,parent1(:,1:i),parent2(:,i+1:10));
end

