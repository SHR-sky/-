function F = nonlinearModel4Fixed(t,alpha)
%LAMPREYMODEL2 此处显示有关此函数的摘要
%   此处显示详细说明
% t(1)是M,t(2)是F,t(3)是U

%parameter
epsilon1 = 0.000005;
epsilon2 = 0.00005;
epsilon3 = 0;
epsilon4 = 0.00001;

a1 = 0.9;
a2 = 1.1;
beta1 = 0.05;
beta2 = 0.04;
h = 0.2;
lambda = 1000;
c = 1;
theta1 = 0;
theta2 = 0.00005;
h1 = 0.2;
h2 = 0.2;
Ram = 2700;

F(1) = (alpha-1/lambda)*epsilon1*t(3)*(a1*t(2)+a2*t(1))-beta1*t(1)-epsilon3*t(1)*t(4)-theta1*a1*t(1)*t(5);
F(2) = (1-alpha-1/lambda)*epsilon1*t(3)*(a1*t(2)+a2*t(1))-beta1*t(2)-epsilon3*t(2)*t(4)-theta1*a2*t(2)*t(5);
F(3) = -epsilon2*t(3)*(a1*t(2)+a2*t(1))+h1*t(3);
F(4) = -beta2*t(4)+epsilon4*(a1*t(2)+a2*t(1))*t(4);
F(5) = h2*t(5) - theta2*(a1*t(2)+a2*t(1))*t(5);
end



