%************************************************%
% Assignment-7 OHM Lab
% Solvng Job Sequencing Problem using ANT COLONY OPTIMISATION 
% Author: Shashank Sundi 
%************************************************%

clc
clear all
close all

% *******Initialise Parameters**********% 
maxiters=10;
n_ants=100;
alpha=1;
beta=1;
evap_coeff=0.05;
init_pherm=100;
%***************************************%
BestCost=zeros(maxiters,1);
best.tardiness=inf;
phermone_mat=init_pherm*ones(5,n_ants);
for iter=1:maxiters

    % send ants looking for solution
    for n=1:n_ants
       ant(n).seq=[];

       % each ant must choose sequence of doing the 5 jobs
       for i=1:5
            % choose job to be done and add it to seq
            P=phermone_mat(:,i).^alpha; %.*mu(:,i).^beta;
            P(ant(n).seq)=0;
            P=P/sum(P);
            j=roulette(P);
            ant(n).seq=[ant(n).seq j];
       end

       ant(n).tardiness=tardiness(ant(n).seq);

       if ant(n).tardiness<best.tardiness 
           best=ant(n);
       end
    end
    disp(sprintf('Best Solution Iter:%1g ------------',iter))
    disp(best)

    % Update Phermones
    for i=1:n_ants
        sequence=ant(i).seq;
        %each ant deposits (Q/tardiness) phermones on the path
        %traversed.Given Q=100
        for j=1:5
            phermone_mat(sequence(j),j)=phermone_mat(sequence(j),j)+100/ant(i).tardiness;
        end
    end

    % Updating Pheromones , evaporation
    phermone_mat=(1-evap_coeff)*phermone_mat;

    BestCost(iter)=best.tardiness;

end

%% Results
figure;
plot(BestCost,'LineWidth',2);
xlabel('Iteration');
ylabel('Tardiness');



