function dydt = lampreyModel(t,y)
xm = 100000; % 最大数量
g = 0.5; % 可繁殖雌性比例
h = 0.5; % 可繁殖雄性比例
alpha = 0.5; % 转化为雄性的比例
beta = 0.1; % 死亡率
c = 1000;

%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
% y(1)是M,y(2)是F
r = c*((h*y(1))*(g*y(2)))/(y(1)+y(2))*(1-y(1)*y(2)/xm); % 出生率
dydt = zeros(2,1);
dydt(1) = r*alpha*(y(1)+y(2))-beta*y(1);
dydt(2) = r*(1-alpha)*(y(1)+y(2))-beta*y(2);
end

