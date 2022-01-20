%************************************************%
% Hill Climbing:Jan 20, 2022
% Author: Shashank Sundi - 19IM10028
%************************************************%
close all 
clc 

%Define objective function 1 variable f= -x.^2
Lb = -5;
Ub =  5; 

%Initialization 
Xo = 5; 
f_Xo = objFun(Xo);
step = 0.05;

% Structure array to hold x and f(x) 
X.position = Xo;
X.cost = f_Xo;

%counters 
Sol_found = 0; 
improve = 0; 
id = 0; 

while Sol_found == 0
    improve = 0; 
    id = id+1; 
    traj(id).position = X.position;
    traj(id).cost     = X. cost;
    
    %Generating neighbors 
    Neighbors = genNeighbors (X, Lb, Ub, step);
  
  % in this loop , we check if any of the generated neighbors are
  % giving better solutions or not. If yes , then we replace the old
  % soln with the neighbor

  for  i = 1:length(Neighbors)
    Xnew = Neighbors (i); 
    if Xnew.cost > X.cost 
        improve =1;    % if neighbor gives better sol , improve=1
        X.cost = Xnew.cost;
        X.position = Xnew.position;
    end
  end

  % this loop checks , if neither of the neighbors give 
  % better solution.If they don't give better soln , then improve=0 , we set
  % sol_found=1 , which ends the while loop

  % we also store the value and position of the current best solution , to
  % plot trajectory later on
  if improve == 0
      Sol_found = 1;
      traj(id).position = X.position;
      traj(id).cost = X.cost; 
  end

end

figure 

a = Lb(1):0.05:Ub(1)
for l= 1: length(a)
    f_val(l) = objFun(a(l));
end 

% Plotting the function

plot(a, f_val)
hold on 
xlabel('x')
ylabel('f(x)')

% Plotting the trajectory oh hill climbing algo

for m = 1: length(traj)
    traj_x(m) = traj(m).position;
    traj_y(m) = traj(m).cost;
end 

plot(traj_x, traj_y, '-or')

% Plotting the starting and end points of trajectory of the solution

plot(Xo, f_Xo, '-dr', 'markerSize', 10, 'markerFaceColor', 'k')
plot(traj_x(end), traj_y(end), '-dg', 'markerSize', 10, 'markerFaceColor', 'k')




