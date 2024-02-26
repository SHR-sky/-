%%
clear;clc
blocks = zeros(200,200,8);

for i = 1:200
    x = randi([1,200]);
    y = randi([1,200]);
    blocks(x,y,1) = 2;
    blocks(x,y,2) = 1000;
end
for i = 1:200
    x = randi([1,200]);
    y = randi([1,200]);
    blocks(x,y,1) = 3;
    blocks(x,y,2) = 1000;
end

for i = 1:200
    x = randi([1,200]);
    y = randi([1,200]);
    blocks(x,y,1) = 1;
    blocks(x,y,2) = 150;
end

%%

% (x,y,z) x,y为位置
% z=1为种类，1是lamprey，2是竞争者，3是捕食者
% (x,y,1)=0时，空白格子
% (x,y,1)=1时，z=2~8代表 总数量，增长率，死亡率，性别比例，被捕食率，被竞争率
% (x,y,1)=2时，z=2~5代表 总数量，增长率，死亡率，捕食率
% (x,y,1)=3时，z=2~5代表 总数量，增长率，死亡率，竞争率
% (x,y,8)是移动进去的数目

for step = 1:200
for i=1:200
    for j = 1:200
        if(blocks(i,j,1)==0)
            drawData(i,j) = 0;
        end
        if(blocks(i,j,1)==1)
            drawData(i,j) = 1;
        end
        if(blocks(i,j,1)==2)
            drawData(i,j) = 2;
        end
        if(blocks(i,j,1)==3)
            drawData(i,j) = 3;
        end
    end
end
imagesc(drawData);
colorMatrix = [86/256,181/256,191/256;80/256,200/256,189/256;101/256,217/256,177/256;141/256,231/256,156/256;192/256,242/256,132/256;249/256,248/256,113/256];
colorbar;
colormap(colorMatrix);
input('continue...')
blocks = applyRule(blocks);
drawData = zeros(200,200);
end



%%

imagesc(drawData);
colorbar;

%%

function new_blocks = applyRule(blocks)
    % 移动
    for i = 1:200
        for j = 1:200
            num = blocks(i,j,2);
            if(num<1)
                continue;
            end
            moveNum = movePos(num);
            whe = randi([0,1]);
            if(whe&&blocks(stdIndex(i+1),stdIndex(j+1),1)==0||blocks(stdIndex(i+1),stdIndex(j+1),1)==blocks(i,j,1))
                blocks(stdIndex(i+1),stdIndex(j+1),8) = blocks(stdIndex(i+1),stdIndex(j+1),8) + moveNum(7);
                blocks(i,j,8) = blocks(i,j,8) - moveNum(7);
                blocks(stdIndex(i+1),stdIndex(j+1),1) = blocks(i,j,1);
            end
            whe = randi([0,1]);
            if(whe&&blocks(stdIndex(i+1),stdIndex(j-1),1)==0||blocks(stdIndex(i+1),stdIndex(j-1),1)==blocks(i,j,1))
                blocks(stdIndex(i+1),stdIndex(j-1),8) = blocks(stdIndex(i+1),stdIndex(j-1),8) + moveNum(8);
                blocks(i,j,8) = blocks(i,j,8) - moveNum(8);
                blocks(stdIndex(i+1),stdIndex(j-1),1) = blocks(i,j,1);
            end
            whe = randi([0,1]);
            if(whe&&blocks(stdIndex(i-1),j,1)==0||blocks(stdIndex(i-1),j,1)==blocks(i,j,1))
                blocks(stdIndex(i-1),j,8) = blocks(stdIndex(i-1),j,8) + moveNum(1); % 外部记录迁入
                blocks(i,j,8) = blocks(i,j,8) - moveNum(1); % 本身记录迁出
                blocks(stdIndex(i-1),j,1) = blocks(i,j,1); % 更改格子种类
            end
            whe = randi([0,1]);
            if(whe&&blocks(stdIndex(i+1),j,1)==0||blocks(stdIndex(i+1),j,1)==blocks(i,j,1))
                blocks(stdIndex(i+1),j,8) = blocks(stdIndex(i+1),j,8) + moveNum(2);
                blocks(i,j,8) = blocks(i,j,8) - moveNum(2);
                blocks(stdIndex(i+1),j,1) = blocks(i,j,1);
            end
            whe = randi([0,1]);
            if(whe&&blocks(i,stdIndex(j-1),1)==0||blocks(i,stdIndex(j-1),1)==blocks(i,j,1))
                blocks(i,stdIndex(j-1),8) = blocks(i,stdIndex(j-1),8) + moveNum(3);
                blocks(i,j,8) = blocks(i,j,8) - moveNum(3);
                blocks(i,stdIndex(j-1),1) = blocks(i,j,1);
            end
            whe = randi([0,1]);
            if(whe&&blocks(i,stdIndex(j+1),1)==0||blocks(i,stdIndex(j+1),1)==blocks(i,j,1))
                blocks(i,stdIndex(j+1),8) = blocks(i,stdIndex(j+1),8) + moveNum(4);
                blocks(i,j,8) = blocks(i,j,8) - moveNum(4);
                blocks(i,stdIndex(j+1),1) = blocks(i,j,1);
            end
            whe = randi([0,1]);
            if(whe&&blocks(stdIndex(i-1),stdIndex(j-1),1)==0||blocks(stdIndex(i-1),stdIndex(j-1),1)==blocks(i,j,1))
                blocks(stdIndex(i-1),stdIndex(j-1),8) = blocks(stdIndex(i-1),stdIndex(j-1),8) + moveNum(5);
                blocks(i,j,8) = blocks(i,j,8) - moveNum(5);
                blocks(stdIndex(i-1),stdIndex(j-1),1) = blocks(i,j,1);
            end
            whe = randi([0,1]);
            if(whe&&blocks(stdIndex(i-1),stdIndex(j+1),1)==0||blocks(stdIndex(i-1),stdIndex(j+1),1)==blocks(i,j,1))
                blocks(stdIndex(i-1),stdIndex(j+1),8) = blocks(stdIndex(i-1),stdIndex(j+1),8) + moveNum(6);
                blocks(i,j,8) = blocks(i,j,8) - moveNum(6);
                blocks(stdIndex(i-1),stdIndex(j+1),1) = blocks(i,j,1);
            end
        end
    end
    % 计算移动后的格子
    for i = 1:200
        for j = 1:200
            blocks(i,j,2) = blocks(i,j,2) + blocks(i,j,8);
            blocks(i,j,8) = 0;
        end
    end

    % parameter 
    genderC = 0.1;
    lampreyIncC1 = 3.2;
    lampreyIncC2 = 0.5;
    beComplete = 0.6;
    bePredation = 0.7;
    deathBeCom = 1;
    deathBePre = 1;
    deathLamprey = 1;

    completeDeath = 1.51;
    completeC = 1.6;
    completeIncC = 1.5;

    preyDeath = 2.7;
    preyIncC = 1.65;
    preyC = 1;
    % 计算各个参数
    for i = 1:200
        for j = 1:200
            if(blocks(i,j,1)==0)
                continue;
            end
            %if(blocks(i,j,2)<1)
            %    blocks(i,j,1) = 0;
            %    continue;
            %end
            if(blocks(i,j,1)==1)
                blocks(i,j,5) = genderC*findBlockNum(i,j,blocks,0); % 性别比例
                blocks(i,j,3) = blocks(i,j,5)*lampreyIncC1 + lampreyIncC2; % 增长率
                blocks(i,j,6) = bePredation*findBlockNum(i,j,blocks,3); % 被捕食率
                blocks(i,j,7) = beComplete*findBlockNum(i,j,blocks,2); % 被竞争率
                blocks(i,j,4) = deathBeCom*blocks(i,j,7) + deathBePre*blocks(i,j,6) + deathLamprey; % 死亡率
                blocks(i,j,2) = blocks(i,j,2) + blocks(i,j,2)*(blocks(i,j,3)-blocks(i,j,4));
            end
            if(blocks(i,j,1)==2) % 竞争者
                blocks(i,j,5) = completeC*findBlockNum(i,j,blocks,1);
                blocks(i,j,3) = completeIncC - blocks(i,j,5);
                blocks(i,j,4) = completeDeath;
                blocks(i,j,2) = blocks(i,j,2) + blocks(i,j,2)*(blocks(i,j,3)-blocks(i,j,4));
            end
            if(blocks(i,j,1)==3) % 捕食者
                blocks(i,j,5) = preyC*findBlockNum(i,j,blocks,1);
                blocks(i,j,3) = blocks(i,j,5) + preyIncC;
                blocks(i,j,4) = preyDeath;
                blocks(i,j,2) = blocks(i,j,2) + blocks(i,j,2)*(blocks(i,j,3)-blocks(i,j,4));
            end
        end
    end
    new_blocks = blocks;
end

function moveNum = movePos(total)
    randNum = rand(1,9);
    randNum = randNum / sum(randNum);
    value(1,1:8) = randNum(1,1:8)*total;
    value(9) = total-sum(value);
    moveNum = value;
end

function index = stdIndex(a)
    index = mod(a-1,200)+1;
end

function blockNum = findBlockNum(i,j,blocks,kind)
    cnt = 0;
    if(blocks(stdIndex(i-1),stdIndex(j-1),1)==kind)
        cnt = cnt + 1;
    end
    if(blocks(stdIndex(i-1),stdIndex(j),1)==kind)
        cnt = cnt + 1;
    end
    if(blocks(stdIndex(i-1),stdIndex(j+1),1)==kind)
        cnt = cnt + 1;
    end
    if(blocks(stdIndex(i),stdIndex(j-1),1)==kind)
        cnt = cnt + 1;
    end
    if(blocks(stdIndex(i),stdIndex(j+1),1)==kind)
        cnt = cnt + 1;
    end
    if(blocks(stdIndex(i+1),stdIndex(j-1),1)==kind)
        cnt = cnt + 1;
    end
    if(blocks(stdIndex(i+1),stdIndex(j),1)==kind)
        cnt = cnt + 1;
    end
    if(blocks(stdIndex(i+1),stdIndex(j+1),1)==kind)
        cnt = cnt + 1;
    end
    blockNum = cnt;
end