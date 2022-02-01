%************************************************%
%OHM: IM 39003
%Simulated Annealing: In-Class Jan 27, 2022
%Author: Satchidanand Tripathy and Akhilesh Kumar|satchi@iitkgp.ac.in;akumar@iem.iitkgp.ac.in
%************************************************%
clear
clc
close all
%Lower and upper bounds
Lb = [-3 -3];
Ub = [3 3];
u0 = [-3,3];  %(Lb+Ub)/2; %Initial solution
%d = length(Lb); %size of solution 

%SA Parameters
T_init = 1; %Initial Temperature 
max_run = 100; %Maximum Number of runs 
k = 1; %Boltzman constant
T_min = 0.000001; %Minimum temperature for cooling
alpha= 0.5; %cooling factor
opt=[];eval=[];temp=[];best_sol=[];
%Initializing Counters and values
i = 0; j = 0; totaleval = 0; 
T = T_init;
E_init = fobj(u0); 
E_old = E_init; 
E_new= E_old;
best = u0;
max_rej =400; %Maximum Number of Rejections
max_accept =20; %Maximum Number of accepts at a temperature
initial_search=300 ; %Initial search period
accept=0;

%Main Program 
while (T>T_min && j<max_rej)
    i=i+1;

    %To check if max numbers of runs are met
    if(i>=max_run) || (accept>=max_accept)
        i=1;
        j=0;
        T=cooling(alpha,T);
        accept=0;
    end

    if totaleval > initial_search
        ns=u0-0.5*randn;
    end
    %Function evalauations at new locations
    if totaleval<initial_search
        ns=newsolution1(u0,Lb,Ub);    
    end

    totaleval = totaleval+1;
    E_new=fobj(ns);

    %Decision regarding accepting or rejecting a solution
    DeltaE=E_new-E_old;
    %Accept if improved
    if(DeltaE<0)
        best=ns;
        E_old = E_new;
        accept=accept+1;
    end
    % Accept with a probability if not improved
    if (DeltaE>=0 && exp(-DeltaE/(k*T))>rand)
        best = ns;
        E_old = E_new;
        accept=accept+1;
    end 
    if (DeltaE>=0 && exp(-DeltaE/(k*T))<rand)
        j=j+1; % rejected
    end

    %Update the estimated optimal solution
    f_opt=E_old;
    opt=[opt;f_opt]; 
    eval=[eval;totaleval];
    temp=[temp;T];
    best_sol=[best_sol;best];
end

bestsol=best;
f_val=f_opt;
N=totaleval;

tab=table(bestsol,f_val,N)
%M= [best_sol, opt]

figure
%convergaence curve-2d
subplot(2,2,1)
plot(eval,opt)
xlabel('No of iteration')
ylabel('functional evalution f(x)')

%Cooling curve-2d
subplot(2,2,2)
plot(eval,temp,'--r')
xlabel('No of iteration')
ylabel('Temperature')
subplot(2,2,3)
%Function curve-3d
stepSize = [0.05, 0.05];
x = Lb(1):stepSize(1):Ub(1);
y = Lb(2):stepSize(2):Ub(2);
[x_new , y_new] = meshgrid(x,y);
for i = 1: length(x)
    for j = 1 : length(y)
        X = [x_new(i,j) , y_new(i,j)];
        z_new(i,j) = fobj(X);
    end
end
surfc(x_new, y_new, z_new)
hold on
xlabel('x')
ylabel('y')
zlabel('f(x)')
colormap jet
box on

%Contour plot with start and end solution 
subplot(2,2,4)
hold on
pcolor(x_new, y_new, z_new)
view(0,90)
plot(u0(1), u0(2),'-ok', 'markerSize' , 10 , 'markerFaceColor', 'r')
plot(best_sol(end,1), best_sol(end,2), '- dk', 'markerSize' , 10 , 'markerFaceColor', 'g')
shading interp
colormap jet











