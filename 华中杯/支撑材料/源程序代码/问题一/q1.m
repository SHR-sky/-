%%
clear;clc;
filename = "interp.xlsx";
[num,txt,~] = xlsread(filename);
%%
clc;
monthI = [1405,1394,1378,1353,1334,1316,1308,1315,1330,1350,1372,1392];
startDay = datetime('2024-3-21');

nowDay = datetime('2024-12-15'); % 当前日期
nowHour = 12; % 当前时间

w = pi/12*abs(12-nowHour);

%latitude = 35/360*2*pi;
latitude = 30.583/360*2*pi; % latitude in rad

D = days(nowDay-startDay);

delta = asin(sin(2*pi*D/365)*sin(2*pi/360*23.45)); % delta in rad 与当前日期有关

% 太阳高度角 alpha_s in rad 与当前日期与当前时间有关
alpha_s = asin(cos(delta)*cos(latitude)*cos(w)+sin(delta)*sin(latitude)); 

disp(alpha_s*360/2/pi)

kh = 0.6864; % ***待定***
eta_at = 1 - kh; 

theta_k = [0,20,40,60]*2*pi/360;

eta_cos = sin(theta_k+alpha_s);

mu = 0/360*2*pi;

y_s = asin((sin(delta)-sin(alpha_s)*sin(latitude))/(cos(alpha_s)*cos(latitude)));

%%
% Answer 1
clc;
I = zeros(12,4); % I(a,b,c) a是月份，b是角度
sin_y_s = 0;
temp = [0,0,0,0];
maxI = zeros(12,3);
for i = 1:12
    temp = [0,0,0,0];
    nowDay = nowDay + calmonths(1); % 计算当前日期
    %disp(nowDay)
    D = days(nowDay-startDay); % 更新日期差
    delta = asin(sin(2*pi*D/365)*sin(2*pi/360*23.45));
    disp("Month:" + i)
    for j = 1:48 % 从早上6点到晚上18点
        nowHour = 6 + 0.25*j;
        w = pi/12*(nowHour-12);
        alpha_s = asin(cos(delta)*cos(latitude)*cos(w)+sin(delta)*sin(latitude));
        cos_y_s = (sin(delta)-(sin(alpha_s) * sin(latitude))) / (cos(alpha_s) * cos(latitude));
        if nowHour >= 12
            sin_y_s = - sqrt(1-cos_y_s*cos_y_s);
        else 
            sin_y_s = sqrt(1-cos_y_s*cos_y_s);
        end
        eta_cos = -cos(alpha_s)*cos_y_s*sin(theta_k)*cos(mu)+cos(alpha_s)*sin_y_s*sin(theta_k)*sin(mu)+sin(alpha_s)*cos(theta_k);
        %y_s = asin((sin(delta)-sin(alpha_s)*sin(latitude))/(cos(alpha_s)*cos(latitude)));
        %disp(y_s*360/2/pi);
        %disp("Time:" +nowHour+ " "+ sin(alpha_s) + " " + cos(alpha_s) + " " + sin(y_s) + " " + cos(y_s))
        disp("Time:" +nowHour+ " " + sin_y_s);
        %disp(" ("+(-cos(alpha_s)*cos(y_s))+","+cos(alpha_s)*sin(y_s)+","+sin(alpha_s)+")")
        if num(j,2)*(monthI(month(nowDay))/1334)*15*60*eta_cos>=0
            temp = temp + num(j,2)*(monthI(month(nowDay))/1334)*15*60*eta_cos;
        end
        maxI(i,1) = max(maxI(i,1),num(j,2)*(monthI(month(nowDay))/1334)*eta_cos(2));
        maxI(i,2) = max(maxI(i,2),num(j,2)*(monthI(month(nowDay))/1334)*eta_cos(3));
        maxI(i,3) = max(maxI(i,3),num(j,2)*(monthI(month(nowDay))/1334)*eta_cos(4));
    end
    I(i,:) = temp;
end

I = I/1000;
plot(1:12,I(:,2),"LineWidth",2,"DisplayName","20 degree")
hold on;
plot(1:12,I(:,3),"LineWidth",2,"DisplayName","40 degree")
hold on;
plot(1:12,I(:,4),"LineWidth",2,"DisplayName","60 degree")
hold on;
xlabel("month")
ylabel("KJ/m^{2}")
legend