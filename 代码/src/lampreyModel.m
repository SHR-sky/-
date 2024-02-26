%{
function dydt = lampreyModel(t,y)
xm = 10000; % 最大数量
R0 = 2000;
Ramax = 2000;
Ramin = 500;
k = 0.0005;
lamda = 1000;
c = 1;

%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
% y(1)是M,y(2)是F
r = c*y(1)*y(2)/((y(1)+y(2))^2)*(1-(y(1)+y(2))/xm); % 出生率
Ra = R0*exp(1)^(-k*((y(1)+y(2))));
alpha = 0.78 - (Ra-Ramin)/(Ramax-Ramin)*(0.78-0.56);
dydt = zeros(2,1);
dydt(1) = r*alpha*Ra-r*Ra/lamda;
dydt(2) = r*(1-alpha)*Ra-r*Ra/lamda;
end
%}

function dydt = lampreyModel(t,y,alpha,Ram)

%paramater
a1 = 0.9;
a2 = 1.1;
c = 1;
s = 1;
%alpha = 0.7;
beta = 0.05;
lambda = 1000;

dydt = zeros(2,1);
% y(1)是M,y(2)是W
r = c*y(1)*y(2)/((y(1)+y(2)))^2;
x = y(1) + y(2);
Ra = s*(Ram-a1*y(1)-a2*y(2));

dydt(1) = r*alpha*Ra-beta*y(1)-r*Ra/lambda;
dydt(2) = r*(1-alpha)*Ra-beta*y(2)-r*Ra/lambda;
end