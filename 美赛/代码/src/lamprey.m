%%
clear;clc;
dataset = [2007 0.53 3126 1666 1460;
2008 0.57 2228 1264 964;
2009 0.54 2725 1485 1240;
2010 0.58 8841 5146 3695;
2011 0.60 10912 6555 4357;
2012 0.60 14047 8442 5605;
2013 0.61 8947 5495 3452;
2014 0.59 8696 5131 3565];
scatter(dataset(:,1),dataset(:,5));

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
% Model 1 M+W - M/W 关系绘制
clear;clc;
figure;
Ram = 10000;
for i = 0:5
alpha = i*(0.8-0.3)/5+0.3;
[t,y] = ode45(@(t,y) lampreyModel(t,y,alpha,Ram),[0,800],[800,1200]);
plot(y(:,1)./y(:,2),y(:,1)+y(:,2),'DisplayName',['Num with \alpha=',num2str(alpha)],'LineWidth',1.5);
hold on;
end
xlabel("N_{M}/N_{F}");
ylabel("N_{M}+N_{F}")
legend;

%%
% Model 1 RA-Time关系绘制
clear;clc;
figure;
Ram = 10000;
for i = 0:5
alpha = i*(0.8-0.3)/5+0.3;
[t,y] = ode45(@(t,y) lampreyModel(t,y,alpha,Ram),[0,80],[800,1200]);
plot(t,Ram-y(:,1)-y(:,2),'DisplayName',['RA with \alpha=',num2str(alpha)],'LineWidth',3.5);
hold on;
end
title('RA vs. \alpha in detail')
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
Ramin = min(RaM);
alphaMin = x(find(RaM==Ramin));
plot(x,RaM,'LineWidth',1.5,'DisplayName','RA');
hold on;
title('RA vs. \alpha')
legend;

%%
% Model 1 RA-HeatMap
clear;clc;
x = [1,2,3,4,5,6,7,8,9,10,11,13,15,19,25,30,45,75,110,150];
Ram = 10000;
data = zeros(400,3);
loopTmp = 0
for i = 1:20
    alpha = i*1/20;
    [t,y] = ode45(@(t,y) lampreyModel(t,y,alpha,Ram),[0,200],[800,1200]);
    RA = Ram - y(:,1)-y(:,2);
    for j = 1:20
        index = find(ceil(t)==x(j));
        while isempty(index)
            loopTmp = loopTmp + 1;
            index = find(ceil(t)==x(j)+loopTmp);
        end
        loopTmp = 0;
        data(20*(i-1)+j,:) = [i-1,j-1,ceil(RA(index(1))/100)];
    end
end
filename = 'output.csv';
writematrix(data, filename);



%%
% Model 2
clear;clc;
alpha = 0.2;
Ram = 2700;
beta = 0.05;
%[t,y] = ode45(@(t,y) lampreyModel2(t,y,alpha,Ram),[0,600],[1000,800,20000]);
[t,y] = ode45(@(t,y) lampreyModel2changed(t,y,Ram,beta),[0,30000],[1000,800,20000]);
%{
plot(y(ceil(end*0.98):end,1)+y((ceil(end*0.98)):end,2),y(ceil(end*0.98):end,3), ...
    'LineWidth',1,'DisplayName','Lamprey vs. Prey with changeable \alpha');
hold on;
%}

figure;
title('Num vs. Time')
yyaxis("left");
plot(t,y(:,1),"DisplayName","Male","LineStyle","--",'LineWidth',1);
hold on;
plot(t,y(:,2),"DisplayName","Female","LineStyle",":",'LineWidth',2);
hold on;
yyaxis("right");
plot(t,y(:,3),"DisplayName","Prey");
ylabel("Num");
legend;
hold off;

%{
figure;
plot(y(:,1)./y(:,2),y(:,1)+y(:,2),'DisplayName',['Num'],'LineWidth',1.5);
hold on;
xlabel("N_{M}/N_{F}");
ylabel("N_{M}+N_{F}");
title("N_{M}+N_{F} vs. N_{M}/N_{F} with changeable \alpha")
legend;
%}

%{
figure;
yyaxis("left");
epsilon1 = 0.000005;
c = 1;
a1 = 0.9;
a2 = 1.1;
r = c*y(:,2).*y(:,1)./(y(:,1)+y(:,2)).^2;
Ra = epsilon1*y(:,3).*(a1*y(:,2)+a2*y(:,1))./r;
plot(t,y(:,1)+y(:,2),"DisplayName","W+M");
hold on;
plot(t,Ra);
hold on;
yyaxis("right");
plot(t,y(:,1)./(y(:,1)+y(:,2)));
legend;
%}

%{
for i = 1:4
    alpha = i*1/5;
    [t,y] = ode45(@(t,y) lampreyModel2(t,y,alpha,Ram),[0,1000],[1000,800,20000]);
    plot(y(ceil(end*0.9):end,1)+y((ceil(end*0.9)):end,2),y(ceil(end*0.9):end,3), ...
        'LineWidth',1,'DisplayName',['Lamprey vs. Prey with \alpha=',num2str(alpha)]);
    hold on;
end
legend;
%}
%{
figure;
for i = 1:4
    alpha = i*1/5;
    [t,y] = ode45(@(t,y) lampreyModel2(t,y,alpha,Ram),[0,10000],[1000,800,20000]);
    plot(y(:,1)./y(:,2),y(:,1)+y(:,2),'DisplayName',['Num with \alpha=',num2str(alpha)],'LineWidth',1.5);
    hold on;
end
xlabel("N_{M}/N_{F}");
ylabel("N_{M}+N_{F}");
title("N_{M}+N_{F} vs. N_{M}/N_{F} with changeable \alpha")
legend;
%}

%%
% Model 3 with changeable alpha
clear;clc;
Ram = 2700;
[t,y] = ode45(@(t,y) lampreyModel2changed(t,y,Ram),[0,30000],[1000,800,20000]);
y0 = max(y(ceil(end*0.99):end,:));

%%
% Model 3 with fixed alpha
%clear;clc;
alpha = 0.5;
Ram = 2700;
[t,y] = ode45(@(t,y) lampreyModel2(t,y,alpha,Ram),[0,10000],[1000,800,20000]);
y0 = max(y(ceil(end*0.9):end,:));

%% 
% Model 3 index with Fixed
clear;clc
syms M W U;
epsilon1 = 0.000005;
epsilon2 = 0.00005;

a1 = 0.9;
a2 = 1.1;
beta = 0.05;
h = 0.2;
lambda = 1000;
c = 1;
Ram = 2700;

matrix = zeros(50,4);
for i=1:50
    alpha = i*1/50;
%alpha = 0.5;
f = @(M,W,U) (alpha-1/lambda)*epsilon1*U*(a1*W+a2*M)-beta*M;
g = @(M,W,U) (1-alpha-1/lambda)*epsilon1*U*(a1*W+a2*M)-beta*W;
k = @(M,W,U) -epsilon2*U*(a1*W+a2*M)+h*U;
y0 = fsolve(@(t) nonlinearFixed(t,alpha),[1000,800,20000]);
%r = c*W*M/(W+M)^2;
%Ra = epsilon1*U*(a1*W+a2*M)/r;
%alpha = 0.56+(Ram-(epsilon1*U*(a1*W+a2*M)/r))/(Ram)*0.4;
%f = @(M,W,U) ((0.56+(Ram-(epsilon1*U*(a1*W+a2*M)/(c*W*M/(W+M)^2)))/(Ram)*0.4)-1/lambda)*epsilon1*U*(a1*W+a2*M)-beta*M;
%g = @(M,W,U) (1-(0.56+(Ram-(epsilon1*U*(a1*W+a2*M)/(c*W*M/(W+M)^2)))/(Ram)*0.4)-1/lambda)*epsilon1*U*(a1*W+a2*M)-beta*W;
%k = @(M,W,U) -epsilon2*U*(a1*W+a2*M)+h*U;
F = [f(M, W, U); g(M, W, U); k(M, W, U)];
J = jacobian(F, [M, W, U]);

J_eq = double(subs(J, [M, W, U], y0));
eigenvalues = eig(J_eq);
lyapunov_exponents = real(log(abs(eigenvalues)));
matrix(i,:) = [alpha lyapunov_exponents'];
end
plot(matrix(:,1),matrix(:,2),"DisplayName","Male",LineWidth=1);
hold on;
plot(matrix(:,1),matrix(:,3),"DisplayName","Female",LineWidth=1);
hold on;
plot(matrix(:,1),matrix(:,4),"DisplayName","Prey",LineWidth=1);
hold on;
legend;

%%
%% 
% Model 3 index with Changeable alpha
clear;clc
syms M W U;
epsilon1 = 0.000005;
epsilon2 = 0.00005;

a1 = 0.9;
a2 = 1.1;
beta = 0.05;
h = 0.2;
lambda = 1000;
c = 1;
Ram = 2700;

matrix = zeros(50,4);

y0 = fsolve(@(t) nonlinearChangeable(t),[1000,800,20000]);
r = c*W*M/(W+M)^2;
Ra = epsilon1*U*(a1*W+a2*M)/r;
%alpha = 0.56+(Ram-(epsilon1*U*(a1*W+a2*M)/r))/(Ram)*0.4;
f = @(M,W,U) ((0.56+(Ram-(epsilon1*U*(a1*W+a2*M)/(c*W*M/(W+M)^2)))/(Ram)*0.4)-1/lambda)*epsilon1*U*(a1*W+a2*M)-beta*M;
g = @(M,W,U) (1-(0.56+(Ram-(epsilon1*U*(a1*W+a2*M)/(c*W*M/(W+M)^2)))/(Ram)*0.4)-1/lambda)*epsilon1*U*(a1*W+a2*M)-beta*W;
k = @(M,W,U) -epsilon2*U*(a1*W+a2*M)+h*U;
F = [f(M, W, U); g(M, W, U); k(M, W, U)];
J = jacobian(F, [M, W, U]);

J_eq = double(subs(J, [M, W, U], y0));
eigenvalues = eig(J_eq);
lyapunov_exponents = real(log(abs(eigenvalues)));

%% 
% Model 4 lyapunov index M W U P H系统
clear;clc
syms M W U P H;
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

y0 = fsolve(@(t) nonlinearModel4(t),[1000,800,20000,180,1800]);
f = @(M,W,U,P,H) ((0.56+(Ram-(epsilon1*U*(a1*W+a2*M)/(c*W*M/(W+M)^2)))/(Ram)*0.4)-1/lambda)*epsilon1*U*(a1*W+a2*M)-beta1*M;
g = @(M,W,U,P,H) (1-(0.56+(Ram-(epsilon1*U*(a1*W+a2*M)/(c*W*M/(W+M)^2)))/(Ram)*0.4)-1/lambda)*epsilon1*U*(a1*W+a2*M)-beta1*W;
k = @(M,W,U,P,H) -epsilon2*U*(a1*W+a2*M)+h*U;
m = @(M,W,U,P,H) -beta2*P + epsilon4*(a1*W+a2*M)*P;
n = @(M,W,U,P,H) h2*H-theta2*(a1*W+a2*M)*H;
F = [f(M,W,U,P,H); g(M,W,U,P,H); k(M,W,U,P,H); m(M,W,U,P,H); n(M,W,U,P,H)];
J = jacobian(F, [M, W, U, P, H]);
J_eq = double(subs(J, [M, W, U, P, H], y0));
eigenvalues = eig(J_eq);
lyapunov_exponents = real(log(abs(eigenvalues)));

%% 
% Model 4 M W U P H
clear;clc;
% Ram = 2700;
Ram = 2700;
[t,y] = ode45(@(t,y) lampreyModel4(t,y,Ram),[0,200],[1000,800,20000,180,1800]);

plot(t,y(:,3)/10,"DisplayName","U/10",LineWidth=1);
hold on;
plot(t,(y(:,1)+y(:,2))/10,"DisplayName","TNL/10",LineWidth=1);
hold on;
plot(t,y(:,1),"DisplayName","N_M",LineWidth=1);
hold on;
plot(t,y(:,2),"DisplayName","N_F",LineWidth=1);
hold on;
plot(t,y(:,4),"DisplayName","P",LineWidth=1);
hold on;
plot(t,y(:,5),"DisplayName","H",LineWidth=1);
hold on;
legend;

figure;
title('Num/Sex Ratio vs. Time')
yyaxis("left");
plot(t,y(:,3)/10,"DisplayName","U/10","LineStyle","--",'LineWidth',1);
hold on;
plot(t,y(:,4),"DisplayName","P","LineStyle",":",'LineWidth',2);
hold on;
plot(t,y(:,5),"DisplayName","H","LineStyle","-.",'LineWidth',1.5);
hold on;
yyaxis("right");
plot(t,y(:,1)./(y(:,1)+y(:,2)),"DisplayName","Sex Ratio");
legend;
hold off;
%{
figure;
plot(t,y(:,1)./(y(:,1)+y(:,2)),'DisplayName','Sex ratio');
legend;
%}

%%
% Model 4 M W U P H with fixed alpha
Ram = 2700;
%for i = 1:5
alpha = 0.6;
[t,y] = ode45(@(t,y) lampreyModel4Fixed(t,y,alpha,Ram),[0,10000],[1000,800,20000,180,1800]);

plot(t,y(:,3)/10,"DisplayName","U/10",LineWidth=1);
hold on;
plot(t,(y(:,1)+y(:,2))/10,"DisplayName","TNL/10",LineWidth=1);
hold on;
plot(t,y(:,1),"DisplayName","N_M",LineWidth=1);
hold on;
plot(t,y(:,2),"DisplayName","N_F",LineWidth=1);
hold on;
plot(t,y(:,4),"DisplayName","P",LineWidth=1);
hold on;
plot(t,y(:,5),"DisplayName","H",LineWidth=1);
hold on;

legend;

%end

%%
% Model 4 M W U P H fixed index
clear;clc;
syms M W U P H;
matrix = zeros(50,6);
yMatrix = zeros(50,6);

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

for i=1:50
    alpha = i*1/50;
    y0 = fsolve(@(t) nonlinearModel4Fixed(t,alpha),[1000,800,20000,180,1800]);
    f = @(M,W,U,P,H) (alpha-1/lambda)*epsilon1*U*(a1*W+a2*M)-beta1*M;
    g = @(M,W,U,P,H) (1-alpha-1/lambda)*epsilon1*U*(a1*W+a2*M)-beta1*W;
    k = @(M,W,U,P,H) -epsilon2*U*(a1*W+a2*M)+h1*U;
    m = @(M,W,U,P,H) -beta2*P + epsilon4*(a1*W+a2*M)*P;
    n = @(M,W,U,P,H) h2*H-theta2*(a1*W+a2*M)*H;
F = [f(M,W,U,P,H); g(M,W,U,P,H); k(M,W,U,P,H); m(M,W,U,P,H); n(M,W,U,P,H)];
J = jacobian(F, [M, W, U, P, H]);
J_eq = double(subs(J, [M, W, U, P, H], y0));
    eigenvalues = eig(J_eq);
    lyapunov_exponents = real(log(abs(eigenvalues)));
    matrix(i,:) = [alpha lyapunov_exponents'];
    yMatrix(i,:) = [alpha y0];
end

plot(matrix(:,1),min(matrix(:,2:6),[],2),'DisplayName','Lyapunov exponent');
hold on;
plot(matrix(:,1),ones(50,1)*-35.1782,'LineStyle','--','DisplayName','Lyapunov exponent with changeable \alpha')
hold on;
legend;


%{
plot(yMatrix(:,1),yMatrix(:,2)+yMatrix(:,3),'DisplayName','TNL','LineWidth',1.5);
hold on;
plot(yMatrix(:,1),yMatrix(:,2),'DisplayName','N_M','LineWidth',1.5);
hold on;
plot(yMatrix(:,1),yMatrix(:,3),'DisplayName','N_F','LineWidth',1.5);
hold on;
plot(yMatrix(:,1),yMatrix(:,4),'DisplayName','U','LineWidth',1.5);
hold on;
plot(yMatrix(:,1),yMatrix(:,4),'DisplayName','P','LineWidth',1.5);
hold on;
plot(yMatrix(:,1),yMatrix(:,6),'DisplayName','H','LineWidth',1.5);
hold on;
legend;
%}


%%
% Model 4 M W U P H lyapunov index
clear;clc;
syms M W U P H

% parameter
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

betaMatrix = zeros(50,2);
for i = 0:49
    beta1 = i*0.5/100;
y0 = fsolve(@(t) nonlinearModel4(t,beta1),[1000,800,20000,180,1800]);
f = @(M,W,U,P,H) ((0.56+(Ram-(epsilon1*U*(a1*W+a2*M)/(c*W*M/(W+M)^2)))/(Ram)*0.4)-1/lambda)*epsilon1*U*(a1*W+a2*M)-beta1*M;
g = @(M,W,U,P,H) (1-(0.56+(Ram-(epsilon1*U*(a1*W+a2*M)/(c*W*M/(W+M)^2)))/(Ram)*0.4)-1/lambda)*epsilon1*U*(a1*W+a2*M)-beta1*W;
k = @(M,W,U,P,H) -epsilon2*U*(a1*W+a2*M)+h1*U;
m = @(M,W,U,P,H) -beta2*P + epsilon4*(a1*W+a2*M)*P;
n = @(M,W,U,P,H) h2*H-theta2*(a1*W+a2*M)*H;
F = [f(M,W,U,P,H); g(M,W,U,P,H); k(M,W,U,P,H); m(M,W,U,P,H); n(M,W,U,P,H)];
J = jacobian(F, [M, W, U, P, H]);
J_eq = double(subs(J, [M, W, U, P, H], y0));
eigenvalues = eig(J_eq);
lyapunov_exponents = real(log(abs(eigenvalues)));
betaMatrix(i+1,:) = [beta1 min(lyapunov_exponents)];
end
scatter(betaMatrix(:,1),betaMatrix(:,2));

%%
subplot(1,2,1)
plot(t(1:end),y(1:end,1),'-b');
hold on;
plot(t(1:end),y(1:end,2),'-r');
hold on;
plot(t,y(:,1)+y(:,2),'-g')
subplot(1,2,2)
plot(t,y(:,1)./(y(:,1)+y(:,2)));
hold on;

%%
[t,y] = ode45(@test,[0,100],[100,100]);
plot(t,y(:,1));
hold on;
plot(t,y(:,2));
hold on;