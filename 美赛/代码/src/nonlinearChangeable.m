function F = nonlinearChangeable(t)
%LAMPREYMODEL2 此处显示有关此函数的摘要
%   此处显示详细说明
% t(1)是M,t(2)是F,t(3)是U

%parameter
epsilon1 = 0.000005;
epsilon2 = 0.00005;

a1 = 0.9;
a2 = 1.1;
beta = 0.05;
h = 0.2;
lambda = 1000;
c = 1;
Ram = 2700;

r = c*t(2)*t(1)/(t(1)+t(2))^2;
Ra = epsilon1*t(3)*(a1*t(2)+a2*t(1))/r;
alpha = 0.56+(Ram-Ra)/(Ram)*0.4;
F(1) = (alpha-1/lambda)*epsilon1*t(3)*(a1*t(2)+a2*t(1))-beta*t(1);
F(2) = (1-alpha-1/lambda)*epsilon1*t(3)*(a1*t(2)+a2*t(1))-beta*t(2);
F(3) = -epsilon2*t(3)*(a1*t(2)+a2*t(1))+h*t(3);
end



