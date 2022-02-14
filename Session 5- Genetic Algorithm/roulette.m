function [i] = roulette(values,fitness)
n_rand = rand()*fitness;
sum_fit = 0;
for i=1:length(values)
    sum_fit = sum_fit + values(i);
    if sum_fit >= n_rand
           break;
    end
end

%This method is implemented as follows:
%1.  Sum the total expected value of the individuals in the population. Let it be T.
%2.  Repeat N times:
%i.  Choose a random integer ‘r’ between o and T.
%ii.  Loop through the individuals in the population, summing the expected values,until the sum is greater than or equal to ‘r’. 
%The individual whose expected valueputs the sum over this limit is the one selected.



% function [index] =  roulette(gen_1_fvalues)
% len = length(gen_1_fvalues);
% % if input is one element then just return rightaway
% if len ==1
%     index =1;
%     return;
% end
% if (~isempty(find(gen_1_fvalues<1, 1)))
%     if (min(gen_1_fvalues) ~=0)
%     gen_1_fvalues = 1/min(gen_1_fvalues)*gen_1_fvalues;
%     else
%     temp= gen_1_fvalues;
%     temp(gen_1_fvalues==0) = inf;
%     gen_1_fvalues = 1/min(temp)*gen_1_fvalues;
%     end
% end
% temp = 0;
% tempProb = zeros(1,len);
% for i= 1:len
%     tempProb(i) = temp + gen_1_fvalues(i);
%     temp = tempProb(i);
% end
% i = fix(rand*floor(tempProb(end)))+1;
% index = find(tempProb >= i, 1 );
% 
%   