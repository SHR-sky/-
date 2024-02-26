%%
% 定义初始状态矩阵
M = 1000;
W = 800;
U = 20000;

size_x = 50;
size_y = 50;
states = zeros(50,4*50);
states(25,25*4-3:25*4)=[M,W,U,0];
% 1:male    2:female 3:prey  4:combination
% getNum(x,y)获取x,y坐标系下1，2，3，4的数量
num_steps = 50;
drawM = zeros(50,4);
for step = 1:num_steps
    %imagesc(states); % 显示当前状态
    %colormap(gray); % 设置颜色图
    %drawnow;
    %pause(0.5); % 暂停一段时间，以便观察状态变化
    [states,M,W,U] = apply_rule(states,M,W,U); % 计算下一个状态
    drawM(step,:) = [step,M,W,U];
end
%%
drawData = zeros(25,25);
for i=1:25
    for j = 1:25
        if(states(i,4*j-3)>=states(i,4*j-2))
            drawData(i,j) = 0;
        end
        if(states(i,4*j-2)>=states(i,4*j-3))
            drawData(i,j) = 1;
        end
    end
end

%%
figure;

imagesc(drawData);
colorbar;

%%
figure;
yyaxis('left');
plot(drawM(:,1),drawM(:,2),"DisplayName","Male");
hold on;
plot(drawM(:,1),drawM(:,3),"DisplayName","Female");
hold on;
yyaxis('right');
plot(drawM(:,1),drawM(:,4),"DisplayName","Prey");
hold on;
legend;

%%
% 定义规则函数
% 先移动
% 再生殖，死亡
% 再捕食
function [new_states,M,W,U] = apply_rule(states,M,W,U)
    new_states = states; % 初始化新状态矩阵
    %disp(states);
    %input('continue..\n')
    a1 = 0.9;
    a2 = 1.1;
    h = 0.2;
    c = 1;
    Ram = 10000;
    epsilon1 = 0.000005;
    epsilon2 = 0.00005;
    lambda = 1000;
    beta = 0.05;
    
    r = c*W*M/(W+M)^2;
    Ra = epsilon1*U*(a1*W+a2*M)/r;
    alpha = 0.56+(Ram-Ra)/(Ram)*0.22;
    if(alpha>1)
        alpha = 1;
    end
    for i = 1:50
        for j = 1:50
               currentNum = getNum(i,j,states);
               moveMale = movePos(currentNum(1));
               moveFemale = movePos(currentNum(2));
               movePrey = movePos(currentNum(3));
               states(stdIndex(i-1),4*stdIndex(j-1)-3:4*stdIndex(j-1)) = states(stdIndex(i-1),4*stdIndex(j-1)-3:4*stdIndex(j-1)) + [moveMale(1) moveFemale(1) movePrey(1) 0];
               states(stdIndex(i-1),4*stdIndex(j)-3:4*stdIndex(j)) = states(stdIndex(i-1),4*stdIndex(j)-3:4*stdIndex(j)) + [moveMale(2) moveFemale(2) movePrey(2) 0];
               states(stdIndex(i-1),4*stdIndex(j+1)-3:4*stdIndex(j+1)) = states(stdIndex(i-1),4*stdIndex(j+1)-3:4*stdIndex(j+1)) + [moveMale(3) moveFemale(3) movePrey(3) 0];
               states(stdIndex(i),4*stdIndex(j-1)-3:4*stdIndex(j-1)) = states(stdIndex(i),4*stdIndex(j-1)-3:4*stdIndex(j-1)) + [moveMale(4) moveFemale(4) movePrey(4) 0];
               states(stdIndex(i),4*stdIndex(j)-3:4*stdIndex(j)) = states(stdIndex(i),4*stdIndex(j)-3:4*stdIndex(j)) + [moveMale(5) moveFemale(5) movePrey(5) 0];
               states(stdIndex(i),4*stdIndex(j+1)-3:4*stdIndex(j+1)) = states(stdIndex(i),4*stdIndex(j+1)-3:4*stdIndex(j+1)) + [moveMale(6) moveFemale(6) movePrey(6) 0];
               states(stdIndex(i+1),4*stdIndex(j-1)-3:4*stdIndex(j-1)) = states(stdIndex(i+1),4*stdIndex(j-1)-3:4*stdIndex(j-1)) + [moveMale(7) moveFemale(7) movePrey(7) 0];
               states(stdIndex(i+1),4*stdIndex(j)-3:4*stdIndex(j)) = states(stdIndex(i+1),4*stdIndex(j)-3:4*stdIndex(j)) + [moveMale(8) moveFemale(8) movePrey(8) 0];
               states(stdIndex(i+1),4*stdIndex(j+1)-3:4*stdIndex(j+1)) = states(stdIndex(i+1),4*stdIndex(j+1)-3:4*stdIndex(j+1)) + [moveMale(9) moveFemale(9) movePrey(9) 0];
        end
    end
    %disp(states)
    %input('continue...\n');
    for i = 1:50
        for j = 1:50
            % 变化模型
            states(i,4*j-3) = states(i,4*j-3) + ceil(states(i,4*j-3)/M*((alpha-1/lambda)*epsilon1*U*(a1*W+a2*M)-beta*M));
            states(i,4*j-2) = states(i,4*j-2) + ceil(states(i,4*j-2)/W*((1-alpha-1/lambda)*epsilon1*U*(a1*W+a2*M)-beta*W));
            states(i,4*j-1) = states(i,4*j-1) + ceil(states(i,4*j-1)/U*(h*U-epsilon2*U*(a1*W+a2*M)));
        end
    end
    nowM = 0;
    nowW = 0;
    nowU = 0;
    for i = 1:50
        for j = 1:50
            nowM = nowM + states(i,4*j-3);
            nowW = nowW + states(i,4*j-2);
            nowU = nowU + states(i,4*j-1);
        end
    end
    %disp([nowM,nowW,nowU])
    M = nowM;
    W = nowW;
    U = nowU;
end

function num = getNum(x,y,states)
    num = states(x,4*y-3:4*y);
end

function moveNum = movePos(total)
    randNum = rand(1,9);
    randNum = randNum / sum(randNum);
    value(1,1:8) = randNum(1,1:8)*total;
    value(9) = total-sum(value);
    moveNum = value;
end

function index = stdIndex(a)
    index = mod(a,50)+1;
end