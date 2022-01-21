%************************************************%
% Hill Climbing:Jan 20, 2022
% Author: Shashank Sundi - 19IM10028
%************************************************%

lb=-1;
ub=1;
X0 = [-0.5,0.9];
step=0.05;
X.position=X0;
X.cost=objfunc(X0(1),X0(2));

% optimization loop 
a=1;
iterations=0;
while a==1
    improve=0;
    iterations=iterations+1;
    trajectory(iterations).position=X.position;
    trajectory(iterations).cost=X.cost;

    Neighbors=genNeighbors(X,lb,ub,step); % Neigbors- 2x2 marix / struct
    for i= 1:length(Neighbors)
        Xnew = Neighbors(i);
        if Xnew.cost>X.cost   % max
            improve=1;
            X.position=Xnew.position;
            X.cost=Xnew.cost;
        end
    end
    
    if improve==0
        a=a+1;
        iterations=iterations+1;
        trajectory(iterations).position=X.position;
        trajectory(iterations).cost=X.cost;
    end

end

% Show the trajectory of the solution on the 3-d plot of the function
x = -1:0.05:1;
y = -1:0.05:1;
[x_new , y_new] = meshgrid(x,y);

for i = 1: length(x)
    for j = 1 : length(y)
        z_new(i,j) = objfunc(x_new(i,j) , y_new(i,j));
    end
end

figure
subplot(1,3,1)
surf(x_new, y_new, z_new)
hold on
xlabel('x')
ylabel('y')
zlabel('f(x)')
traj_x=zeros(1,iterations);
traj_y=zeros(1,iterations);
traj_z=zeros(1,iterations);

for i= 1:iterations
   traj_x(i)=trajectory(i).position(1);
   traj_y(i)=trajectory(i).position(2);
   traj_z(i)=trajectory(i).cost(1);
end
plot3(traj_x,traj_y,traj_z, '- *k', 'lineWidth' ,2)
plot3(X0(1),X0(2),objfunc(X0(1),X0(2)), '-dk', 'markerSize' , 10 , 'markerFaceColor', 'g') 
plot3(traj_x(end),traj_y(end),traj_z(end), '- dk', 'markerSize' , 10 , 'markerFaceColor', 'r')
set(gca,'Color',[ 0.5843 0.8157 0.9882])

% Show the trajectory of the solution on the 2-d plot of the function
subplot(1,3,2)
%pcolor(x_new, y_new, z_new)
[M,c]=contour(x_new, y_new, z_new,70);
c.LineWidth = 2;
hold on
plot(traj_x,traj_y, '- *k', 'lineWidth' ,2)
plot(X0(1),X0(2), '-dk', 'markerSize' , 10 , 'markerFaceColor', 'g') 
plot(traj_x(end),traj_y(end), '- dk', 'markerSize' , 10 , 'markerFaceColor', 'r')
xlabel('x')
ylabel('y')

% Show the iterations vs objective functions on a 2-d plot
subplot(1,3,3)
plot(1:iterations,traj_z, '- *k', 'lineWidth' ,2)
hold on
xlabel('Iterations')
ylabel('f(X)')
set(gca,'Color',[ 0.5843 0.8157 0.9882])
