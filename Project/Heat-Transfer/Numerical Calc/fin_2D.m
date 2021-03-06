clear;close all;clc
%例题4-5：二维非稳态，肋片效率计算

%已知信息
t_init = 100;  %初始温度
t_f = 20;           %流体温度
delta = 0.02;       %肋片厚度
%工况1
% h = 50;             %对流传热系数
% lambda = 100;  %导热系数
% H = 0.04;           %肋片高度
% % 工况2
h = 400;        %对流传热系数
lambda = 8;  %导热系数
H = 0.08;       %肋片高度

%自定义信息
M = 4;     %横向划分的控制体数
iter = 0;  %迭代次数,用于显示达到结果最后迭代进行的次数
threshold = 1e-6; %迭代结束阈值

%导出信息
x = H/M;            %delta x：横向步长
y = x;                   %delta y：纵向步长,划分为正方形网格
N = delta/y;       %纵向划分的控制体数
m = M+1;            %横向节点数
n = N+1;              %纵向节点数
Bi = h*delta/lambda      %注意：肋片的特征长度是其厚度
Bi_delta = h*x/lambda ; %对于面积元而言，其特征长度和步长相同

%初始温度场建立
theta = (t_init-t_f)*ones(m,n); %赋初值，为初始过余温度

%进行迭代计算
while 1
    tmp = theta; %用于对比迭代前后的值，确定是否可以终止迭代
    iter=iter+1;%记录迭代次数
    %高斯-赛德尔迭代
    for j = 1: m %横向
        for k = 1:n %纵向
            %根据节点的位置分为6种情况
            
            if j>1&&j<m&&k==1;%1:肋中心，一边绝热，三边导热
                theta(j,k) = (theta(j+1,1)+theta(j-1,1)+2*theta(j,2))/4;
                
            elseif (j>1&&j<m)&&(k>1&&k<n);%2:肋中，四边传热
                theta(j,k) = (theta(j+1,k)+theta(j-1,k)+theta(j,k+1)+theta(j,k-1))/4; 
                
            elseif (j>1&&j<m)&&(k==n);%3:肋侧，一边对流，三边导热
                theta(j,k) = (theta(j+1,n)+theta(j-1,n)+2*theta(j,k-1))/(4+2*Bi_delta);
                
            elseif (j==m)&&(k>1&&k<n);%4:肋顶端，一边对流，三边导热
                theta(j,k) = (theta(m,k-1)+theta(m,k+1)+2*theta(j-1,k))/(4+2*Bi_delta);
                
            elseif (j==m)&&(k==n);%5：肋顶端边缘角，两边对流
                theta(j,k) = (theta(m,n-1)+theta(m-1,n))/(2+2*Bi_delta);
                
            elseif  (j==m)&&(k==1);%6：肋顶端中心，一边对流，一边绝热
                theta(j,k) = (theta(m,2)+theta(m-1,1))/(2+2*Bi_delta);
            
            end 
        end
    end
    %判断是否可以结束迭代
    if max(tmp-theta)<threshold %最大值小于阈值则结束迭代
        break;
    end
    
end

%对肋效率的计算
eta = (0.5*(theta(1,n)+theta(m,1))+sum(theta(2:m,n))+sum(theta(m,2:n-1)))/((m+n-2)*(t_init-t_f))


%绘制图形

[X, Y] = meshgrid(0:y:delta,0:x:H);

%绘制三维图

%1：网格
figure;
mesh(X,Y,theta);
title('工况2')
xlabel('δ/2/m');
ylabel('H/m');
zlabel('θ/℃');
%2：面片
figure;
surf(X,Y,theta,'EdgeColor','none');
title('工况2')
xlabel('δ/2/m');
ylabel('H/m');
zlabel('θ/℃');
% figure;
% surfc(X,Y,theta,'EdgeColor','none');

%绘制等温线
figure;
contourf(X,Y,theta,30);
colorbar;
title('工况2')
xlabel('δ/2/m');
ylabel('H/m');
