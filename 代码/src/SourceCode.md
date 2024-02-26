# Model 1

- lampreyModel1.m

```matlab
function dydt = lampreyModel(t,y,alpha,Ram)
    % paramater
    a1 = 1.1; a2 = 0.9;
    c = 1; s = 1;
    beta = 0.05; lambda = 1000;

    dydt = zeros(2,1); % y(1)是M,y(2)是W
    r = c*y(1)*y(2)/((y(1)+y(2)))^2;
    x = y(1) + y(2);
    Ra = s*(Ram-a1*y(1)-a2*y(2));

    dydt(1) = r*alpha*Ra-beta*y(1)-r*Ra/lambda;
    dydt(2) = r*(1-alpha)*Ra-beta*y(2)-r*Ra/lambda;
end
```

- lamprey.m

```matlab
%%
% Model 1 RA绘图 M,F,X-Time关系绘制
clear;clc;
figure
alpha = 0.8;
Ram = 10000;
[t,y] = ode45(@(t,y) lampreyModel(t,y,alpha,Ram),[0,80],[800,1200]);
plot(t,y(:,1)+y(:,2),'DisplayName','Number of Lampreys','LineWidth',1);
hold on;
plot(t,y(:,1),'DisplayName','Number of Male Lampreys','LineWidth',1);
hold on;
plot(t,y(:,2),'DisplayName','Number of Female Lampreys','LineWidth',1);
hold on;
title(['Number of Lamprey vs. Time with \alpha=',num2str(alpha)],'FontSize',16)
set(gcf,'Position',[50,50,600,500]);
xlabel('Time','FontSize',16);
ylabel('Num','FontSize',16);
legend('Location','southeast');
hold on;

%%
% Model 1 RA-Time关系绘制
clear;clc;
figure;
Ram = 10000;
for i = 0:5
    alpha = i*(0.8-0.3)/5+0.3;
    [t,y] = ode45(@(t,y) lampreyModel(t,y,alpha,Ram),[0,80],[800,1200]);
    plot(t,Ram-y(:,1)-y(:,2),'DisplayName',['RA with \alpha=',num2str(alpha)],'LineWidth',1.5);
    hold on;
end
title('RA vs. \alpha')
legend;
hold off;

%%
% Model 1 RA-Alpha关系绘制
clear;clc;
figure;
Ram = 10000;
RaM = zeros(1000,1);
x = [(1:1000)*1/1000];
for i = 1:1000
    alpha = i*1/1000;
    [t,y] = ode45(@(t,y) lampreyModel(t,y,alpha,Ram),[0,200],[800,1200]);
    RaM(i) = Ram-y(end,1)-y(end,2);
end
plot(x,RaM,'LineWidth',1.5,'DisplayName','RA');
hold on;
title('RA vs. \alpha')
legend;
```
