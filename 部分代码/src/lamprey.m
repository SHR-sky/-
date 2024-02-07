clear;clc;

%%

growthM = 0.1; % 雄性相对资源生长率
growthF = 0.08; % 雌性相对资源生长率

deathM = 0.05; % 雄性死亡率
deathF = 0.03; % 雌性死亡率

%%
[t,y] = ode45(@lampreyModel,[0,100],[450,550]);

%%
g = 0.5; % 可繁殖雌性比例
h = 0.5; % 可繁殖雄性比例
c = 1000;
xm = 100000;
r = c*((h*y(:,1)).*(g*y(:,2)))./(y(:,1)+y(:,2)).*(1-y(:,1).*y(:,2)/xm);

%%
subplot(1,2,1)
plot(t(41:end),y(41:end,1),'-b');
hold on;
plot(t(41:end),y(41:end,2),'-r');
hold on;
subplot(1,2,2)
plot(t(41:end),r(41:end),'-g')
hold on;