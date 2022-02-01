
%************************************************%
%OHM: IM 39003
%Plotting 3D Surface and Mesh: In-Class Jan 13, 2021
%Author: Akhilesh Kumar akumar@iem.iitkgp.ac.in
%************************************************%
clc
clear all
close all
lb = [-3 -3];
ub = [3 3];
stepSize = [0.05 , 0.05];
x = lb(1):stepSize(1):ub(1);
y = lb(2):stepSize(2):ub(2);
[x_new , y_new] = meshgrid(x,y);

for i = 1: length(x)
    for j = 1 : length(y)
        X = [x_new(i,j) , y_new(i,j)];
        z_new(i,j) = fobj(X);
    end
end
figure
surfc(x_new, y_new, z_new)
hold on
xlabel('x')
ylabel('y')
zlabel('f(x)')
colormap jet
box on


id = find(z_new == min(z_new, [], 'all'))
min_sol = [x_new(id),y_new(id), z_new(id)]

