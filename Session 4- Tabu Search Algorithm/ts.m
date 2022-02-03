% Author : Shashank Sundi
% Roll No. : 19IM10028

clc;
clear;
close all;

%% Problem Definition

%model = CreateModel();      % Create TSP Model
model=CreateModel_activity2();

CostFunction=@(tour) TourLength(tour, model);    % Cost Function

ActionList=CreatePermActionList(model.n);    % Action List

nAction=numel(ActionList);              % Number of Actions


%% Tabu Search Parameters

MaxIt=50;                      % Maximum Number of Iterations

TL=round(0.5*nAction);      % Tabu Length


%% Initialization

% Create Empty Individual Structure
empty_individual.Position=[];
empty_individual.Cost=[];

% Create Initial Solution
sol=empty_individual;
sol.Position=randperm(model.n);
sol.Cost=CostFunction(sol.Position);

% Initialize Best Solution Ever Found
BestSol=sol;

% Array to Hold Best Costs
BestCost=zeros(MaxIt,1);

% Initialize Action Tabu Counters
TC=zeros(nAction,1);


%% Tabu Search Main Loop

for it=1:MaxIt
    
    bestnewsol.Cost=inf;
    
    % Apply Actions
    for i=1:nAction
        if TC(i)==0
            newsol.Position=DoAction(sol.Position,ActionList{i});
            newsol.Cost=CostFunction(newsol.Position);
            newsol.ActionIndex=i;

            if newsol.Cost<=bestnewsol.Cost
                bestnewsol=newsol;
            end
        end
    end
    
    % Update Current Solution
    sol=bestnewsol;
    
    % Update Tabu List
    for i=1:nAction
        if i==bestnewsol.ActionIndex
            TC(i)=TL;               % Add To Tabu List
        else
            TC(i)=max(TC(i)-1,0);   % Reduce Tabu Counter
        end
    end
    
    % Update Best Solution Ever Found
    if sol.Cost<=BestSol.Cost
        BestSol=sol
    end
    
    % Save Best Cost Ever Found
    BestCost(it)=BestSol.Cost;
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    
    % Plot Best Solution -- at each iteration
    PlotSolution(BestSol, model);
    pause(0.1);
    
    % If Global Minimum is Reached
    if BestCost(it)==0
        break;
    end
    
end

OptimalSolution=BestCost(it);

%% Results

figure;
plot(BestCost,'LineWidth',2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;
