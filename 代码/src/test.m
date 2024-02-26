function dydt = test(t,y)
%TEST 此处显示有关此函数的摘要
%   此处显示详细说明
dydt = zeros(2,1);
dydt(1) = y(1)*(3-0.5*y(2));
dydt(2) = y(2)*(-1+2*y(1));
end

function dydt = lampreyModel2(t,y,alpha,Ram)
%LAMPREYMODEL2 此处显示有关此函数的摘要
%   此处显示详细说明
dydt = zeros(3,1);
% y(1)是X,y(2)是M,y(3)是U

%parameter
epsilon1 = 0.00005;
epsilon2 = 0.00005;

a1 = 0.9;
a2 = 1.1;
beta = 0.1;
h = 10;
lambda = 1000;

% r = c*y(2)*(y(1)-y(2))/y(1)^2;
% Ra = epsilon1*y(3)*(a1*y(2)+a2*(y(1)-y(2)))/r;
dydt(1) = (alpha-1/lambda)*epsilon1*y(3)*(a1*y(2)+a2*y(1))-beta*y(1);
dydt(2) = (1-alpha-1/lambda)*epsilon1*y(3)*(a1*y(2)+a2*y(1))-beta*y(2);
dydt(3) = -epsilon2*y(3)*(a1*y(2)+a2*y(1))+h*y(3);
end
