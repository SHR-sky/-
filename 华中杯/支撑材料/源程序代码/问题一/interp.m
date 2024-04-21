%%
clear;clc;
filename = "1.xlsx";
[num,txt,~] = xlsread(filename);
newX = 0.25:0.010417:0.79;
newY = interp1(num(:,1),num(:,2),newX,'spline');
scatter(newX.*24,newY,'red',"filled","o",'DisplayName',"The light intensity with interpolation",SizeData=15);
xlabel("Time",FontSize=16)
ylabel("I",FontSize=16)
hold on;
scatter(num(:,1).*24,num(:,2),'blue',"filled","o","DisplayName","Origin Data",SizeData=20);
legend;

%%
% export
colName = ["time","I"];
k = [newX;newY]';
T = array2table(k, 'VariableNames', colName);
writetable(T, "interp.xlsx", 'Sheet', 1, 'Range', 'A1');

k = ["["+num(:,1).*24+",",num(:,2)+"],"];
T = array2table(k, 'VariableNames', colName);
writetable(T, "origin.xlsx", 'Sheet', 1, 'Range', 'A1');
%%
