% 𝑓(𝑥1, 𝑥2) = −(2 ∗ 𝑥12 − 𝑥22) −1 ≤ 𝑥1, 𝑥2 ≤ 1
% Initial solution 𝑋0 = [−0.5, 0.9]

function[val]=objfunc(x0,x1)
val=-(2*x0.^2 - x1.^2);
