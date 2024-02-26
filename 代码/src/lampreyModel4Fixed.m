function dydt = lampreyModel4Fixed(t,y,alpha,Ram)
%LAMPREYMODEL2 此处显示有关此函数的摘要
%   此处显示详细说明
dydt = zeros(5,1);
% y(1)是M,y(2)是F,y(3)是U,y(4)是P,y(5)是H

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

dydt(1) = (alpha-1/lambda)*epsilon1*y(3)*(a1*y(2)+a2*y(1))-beta1*y(1)-epsilon3*y(1)*y(4)-theta1*a1*y(1)*y(5);
dydt(2) = (1-alpha-1/lambda)*epsilon1*y(3)*(a1*y(2)+a2*y(1))-beta1*y(2)-epsilon3*y(2)*y(4)-theta1*a2*y(2)*y(5);
dydt(3) = -epsilon2*y(3)*(a1*y(2)+a2*y(1))+h1*y(3);
dydt(4) = -beta2*y(4)+epsilon4*(a1*y(2)+a2*y(1))*y(4);
dydt(5) = h2*y(5) - theta2*(a1*y(2)+a2*y(1))*y(5);
end

