
%************************************************%
%OHM: IM 39003
%Plotting 3D Surface and Mesh: In-Class Jan 13, 2021
%Author: Akhilesh Kumar akumar@iem.iitkgp.ac.in
%************************************************%
clc
clear all
close all
%2x1^2+x2^2
lb = [-1 -1];
ub = [1 1];
stepSize = [0.05 , 0.05]
x = lb(1):stepSize(1):ub(1);
y = lb(2):stepSize(2):ub(2);
[x_new , y_new] = meshgrid(x,y);

for i = 1: length(x)
    for j = 1 : length(y)
        X = [x_new(i,j) , y_new(i,j)];
        z_new(i,j) = objFun(X);
    end
end

figure
subplot(1,2,1)
surfc(x_new, y_new, z_new)
hold on
xlabel('x')
ylabel('y')
zlabel('f(x)')
%shading interp
colormap jet
box on


%Plotting a trajectory of an algorithm

x0 = [-1 -1] %initial point 
z_init = objFun(x0) %initial objfun value

traj = [x0;-0.8 -0.8; -0.8 -0.7; -0.5 -0.5; -0.3 -0.2; -0.1 -0.1; 0 0]  

for i = 1: length(traj)
        z(i)= objFun(traj(i,:));
end
    traj_x = traj(:,1);
    traj_y = traj(:,2);
    traj_z = z;

plot3(traj_x,traj_y,traj_z, '- .k', 'lineWidth' , 1)
plot3(x0(1),x0(2),z_init, '-dk', 'markerSize' , 10 , 'markerFaceColor', 'g')
                                       
plot3(traj_x(end),traj_y(end),traj_z(end), '- dk', 'markerSize' , 10 , 'markerFaceColor', 'r')
                                       
                                   
subplot(1,2,2) % Top view of the 3d surface
hold on
pcolor(x_new, y_new, z_new)
view(0,90)
plot(traj_x,traj_y, '- .k', 'lineWidth' , 1)
plot(x0(1),x0(2), '-dk', 'markerSize' , 10 , 'markerFaceColor', 'g')
plot(traj_x(end),traj_y(end), '- dk', 'markerSize' , 10 , ...
                                                       'markerFaceColor', 'r')
shading interp
colormap jet
