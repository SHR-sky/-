% Lyapunov Exponents
syms M W U P H;
y0 = fsolve(@(t) lampreyModel4(t,Ram),[1000,800,20000,180,1800]);
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

% Part of Cell Auto Machine
% State transition function
function new_blocks = applyRule(blocks)
    % move
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
            % ... And other 7 direction
        end
    end
    for i = 1:200
        for j = 1:200
            blocks(i,j,2) = blocks(i,j,2) + blocks(i,j,8);
            blocks(i,j,8) = 0;
        end
    end
    % parameter 
    % ...
    % Calculate all parameter
    for i = 1:200
        for j = 1:200
            if(blocks(i,j,1)==0)
                continue;
            end
            if(blocks(i,j,1)==1)
                blocks(i,j,5) = genderC*findBlockNum(i,j,blocks,0); % sex ratio
                blocks(i,j,3) = blocks(i,j,5)*lampreyIncC1 + lampreyIncC2; % increasing ratio
                blocks(i,j,6) = bePredation*findBlockNum(i,j,blocks,3); % be prey ratio
                blocks(i,j,7) = beComplete*findBlockNum(i,j,blocks,2); % be complete ratio
                blocks(i,j,4) = deathBeCom*blocks(i,j,7) + deathBePre*blocks(i,j,6) + deathLamprey; % death ratio
                blocks(i,j,2) = blocks(i,j,2) + blocks(i,j,2)*(blocks(i,j,3)-blocks(i,j,4));
            end
            % ... And blocks(i,j,2),blocks(i,j,3)
        end
    end
    new_blocks = blocks;
end


% Model 3&4
function dydt = lampreyModel4(t,y,Ram)
dydt = zeros(5,1);
% y(1)是M,y(2)是F,y(3)是U,y(4)是P,y(5)是H
%parameter
epsilon1 = 0.000005;epsilon2 = 0.00005;epsilon3 = 0;epsilon4 = 0.00001;
a1 = 0.9;a2 = 1.1;beta1 = 0.05;beta2 = 0.04;lambda = 1000;c = 1;
theta1 = 0;theta2 = 0.00005;h1 = 0.2;h2 = 0.2;
r = c*y(2)*y(1)/(y(1)+y(2))^2;
Ra = epsilon1*y(3)*(a1*y(2)+a2*y(1))/r;
alpha = 0.56+(Ram-Ra)/(Ram)*0.4;
dydt(1) = (alpha-1/lambda)*epsilon1*y(3)*(a1*y(2)+a2*y(1))-beta1*y(1)-epsilon3*y(1)*y(4)-theta1*a1*y(1)*y(5);
dydt(2) = (1-alpha-1/lambda)*epsilon1*y(3)*(a1*y(2)+a2*y(1))-beta1*y(2)-epsilon3*y(2)*y(4)-theta1*a2*y(2)*y(5);
dydt(3) = -epsilon2*y(3)*(a1*y(2)+a2*y(1))+h1*y(3);
dydt(4) = -beta2*y(4)+epsilon4*(a1*y(2)+a2*y(1))*y(4);
dydt(5) = h2*y(5) - theta2*(a1*y(2)+a2*y(1))*y(5);
end
