function population= generate_pop(n)
K=0.15;
D=60;
L=[10 25 4 11 18 3 17 15 9 10];

population=[];
while size(population,1)<n

    % Randomly Generated Chromosome
    sol=rand(1,10);
    for i=1:10
        if sol(i)>0.5
            sol(i)=1;
        else 
            sol(i)=0;
        end
    end

    % Calculate Total Amount of Loans
    total_loan=sum(sol.*L);
    
    % check if constraint is satisfied
    if total_loan<=(1-K)*D
        population=cat(1,population,sol);
    end
 
end

end

