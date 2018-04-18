clear;close all;clc
%例题4-3：一维非稳态

%

%已知信息
delta = 0.03;     %1/2板厚
t_init = 0;          %初始温度
t_f = 100;            %流体温度
lambda = 40 ;   %导热系数
h = 1000;         %对流传热系数

%自定义信息
M = 20;              %网格划分：控制体数
time = 0.5;          %时间步长
a = 1e-6;            %热传递系数
n = 2000;          %迭代次数

%导出信息
x = delta/M;            %空间步长
dot = M+1;             %节点数
Fo = a*time/(x*x)   %傅里叶数
Bi = h*x/lambda     %微元体Bi数

%检验稳定性条件
if Fo <= 1/(2*(1+Bi))
    disp('满足稳定性条件');
else
    disp('注意：不满足稳定性条件！！！');
end

%采用显示格式离散方程
T = t_init*ones(n+1,dot);  %温度场，行表示一系列空间点的温度，列表示一个点不同时间的温度


%进行迭代计算
for i = 1:n
    for m = dot:-1:1
        if m ==1 %中心点
            T(i+1,1) = 2*Fo*T(i,2)+(1-2*Fo)*T(i,m);
        elseif m == dot %边界点
            T(i+1,dot) = T(i,m)*(1-2*Fo*Bi-2*Fo)+2*Fo*Bi*t_f;
        else
            T(i+1,m) = Fo*(T(i,m+1)+T(i,m-1))+(1-2*Fo)*T(i,m);
        end
    end
end

%绘图
figure;
plot(0:x:delta,T(1:(n/10):end,:));  %等时间间隔显示10条曲线

