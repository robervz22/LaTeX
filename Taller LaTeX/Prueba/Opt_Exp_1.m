function x=Opt_Exp_1
tic 
close all
clear all
clc
%% Our experimental data
t_exp=[   0    0.5000    1.0000    2.0000    4.0000    6.0000 ];%  24.0000]; % Time of measurement, in hours
y_exp=[0.0126    1.6059    0.8196    0.7323    0.5339    0.5613 ];%   0.1898]; % pStatStat3



%% Optimization
% A random initial population for our genetic algorithm

S=2.5;
x1 = abs(rand(1,6));
x2 = abs(rand(1,6));
x3 = abs(rand(1,6));
x4 = abs(rand(1,6));
x5 = abs(rand(1,6));
x6 = abs(rand(1,6));
x7 = abs(rand(1,6));
x8 = abs(rand(1,6));
x9 = abs(rand(1,6));
x10 = abs(rand(1,6));
x11 = abs(rand(1,6));
x12 = abs(rand(1,6));
x13 = abs(rand(1,6));
x14 = abs(rand(1,6));
x15 = abs(rand(1,6));
x16 = abs(rand(1,6));
% 
P = {x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16};
% Run the optimization!
x = GeneticosNoNeg(@(x)CostFunction(x,S, t_exp, y_exp), P, 50, 0.02);

%% The graph of our optimized parameters
%Run the model with the parameter we found

% The extraction of the lag in our system
lag=x(6);

tspan=t_exp(1):0.1:t_exp(end)+1;  %integration interval

%the initial equilibrium
root1 = (x(5)*(x(2) - ((x(5)*x(2)^2 + 4*x(1)*x(3)*x(4)*0)/x(5))^(1/2)))/(2*x(3)*x(4));
root2 = (x(2) - ((x(5)*x(2)^2 + 4*x(1)*x(3)*x(4)*0)/x(5))^(1/2))/(2*x(3));
hist = abs([root1 root2]);

t = linspace(0, t_exp(end), 1000);

if x(6) <= 0
    x(6) = 0.000001;
end

%The DDE system is solved numerically
sol = dde23(@(t,y,Z)negative_feedback_dde(t,y, Z, x, S), lag, hist, tspan);

%The solutions obtained in the numerical integration are evaluated
y = deval(sol, t);

Cost = CostFunction(x,S,t_exp,y_exp)

%The optimal solution is graphed
plot(t,y(1,:), 'b',t_exp, y_exp, 'bo','MarkerSize', 10,'LineWidth',2)
xlabel('Time [h]', 'FontSize', 12);
ylabel('pStat3/Stat3','FontSize', 12);
title(['Ks=' num2str(x) ', cost=' num2str(Cost)],'FontSize', 12);

axis square
xlim([0, t(end)]);
x
toc

end


function Cost=CostFunction(k, S, t_exp, y_exp)



%% Solve the DDE - with these parameters


%integration interval
tspan = [0,6];

if k(6) <= 0
    k(6) = 0.000001;
end
lags=k(6);  %hour(s)

%the initial equilibrium

root1 = (k(5)*(k(2) - ((k(5)*k(2)^2 + 4*k(1)*k(3)*k(4)*0)/k(5))^(1/2)))/(2*k(3)*k(4));
root2 = (k(2) - ((k(5)*k(2)^2 + 4*k(1)*k(3)*k(4)*0)/k(5))^(1/2))/(2*k(3));
hist = abs([root1 root2]);

% Call the ODE solver 
sol = dde23(@(t,y,Z)negative_feedback_dde(t,y, Z, k, S), lags, hist, tspan);
Y_pre_Interpol = deval(sol,t_exp);    

%% Calculate the cost of the predition vs. the experimental data
Cost=(sum((Y_pre_Interpol(1,:)-y_exp).^2));

end
