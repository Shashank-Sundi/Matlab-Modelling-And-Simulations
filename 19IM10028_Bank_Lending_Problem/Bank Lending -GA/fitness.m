function fitness = fitness(lend_decision)

rl=[0.021 0.022 0.021 0.027 0.025 0.026 0.023 0.021 0.028 0.022];
L=[10 25 4 11 18 3 17 15 9 10];
K=0.15;
D=60;
lambda=[0.0002 0.0058 0.0001 0.0003 0.0024 0.0002 0.0058 0.0002 0.001 0.001];
rd=0.009;

% Institutional transaction cost  
T=(1-K)*D-L;

%loan revenue
loan_revenue=sum(lend_decision.*rl.*L-lambda.*lend_decision);

%loans cost
loans_cost=sum(L.*0.0025.*lend_decision);

%total transaction cost
total_trans_cost=sum(lend_decision.*rl.*T);

% cost of demand deposit
cost_demand_deposit=D*rd;

fitness=(loan_revenue + total_trans_cost-cost_demand_deposit - sum(lambda));
end

