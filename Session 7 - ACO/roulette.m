function [i] = roulette(prob)
r = rand();
sum = 0;
for i=1:length(prob)
    sum = sum+ prob(i);
    if sum >= r
           break;
    end
end
