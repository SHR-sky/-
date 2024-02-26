function dydt = lampreyModel2(t,y,alpha,Ram)
%LAMPREYMODEL2 此处显示有关此函数的摘要
%   此处显示详细说明
dydt = zeros(3,1);
% y(1)是M,y(2)是F,y(3)是U

%parameter
epsilon1 = 0.000005;
epsilon2 = 0.00005;

a1 = 0.9;
a2 = 1.1;
%beta = 0.05;
h = 0.2;
lambda = 1000;
c = 1;

r = c*y(2)*y(1)/(y(1)+y(2))^2;
Ra = epsilon1*y(3)*(a1*y(2)+a2*y(1))/r;
%alpha = 0.56+(Ram-Ra)/(Ram)*0.4;
dydt(1) = (alpha-1/lambda)*epsilon1*y(3)*(a1*y(2)+a2*y(1))-beta*y(1) + randn()*800;
dydt(2) = (1-alpha-1/lambda)*epsilon1*y(3)*(a1*y(2)+a2*y(1))-beta*y(2) + randn()*800;
dydt(3) = -epsilon2*y(3)*(a1*y(2)+a2*y(1))+h*y(3) + 8000*randn(); 
end

