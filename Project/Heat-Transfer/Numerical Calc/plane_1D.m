clear;close all;clc
%例题4-3：一维非稳态

%

%已知信息
delta = 0.03;     %1/2板厚
t_init = 100;          %初始温度
t_f = 0;            %流体温度
lambda = 40 ;   %导热系数
h = 1000;         %对流传热系数

%自定义信息
M = 6;              %网格划分：控制体数
time = 0.5;          %时间步长
a = 1e-6;            %热扩散系数
iter = 4;               %迭代次数
line_num = 4;            %在图中绘制的线条数
line_which = [1+10,1+60,1+300,1+600,1+900,1+1200,1+1800,1+2400,1+3600,1+4800]; %指定显示迭代结果中的哪些曲线
%10s,1min,3min,5min,10min,20min,30min,40min,60min,80min
Fo = 1                        %（1）直接给出傅里叶数


%导出信息
x = delta/M;            %空间步长
dot = M+1;             %节点数
%Fo = a*time/(x*x)   %（2）或者导出傅里叶数
Bi = h*x/lambda     %微元体Bi数

%检验稳定性条件
if Fo <= 1/(2*(1+Bi))
    checkinfo='稳定';
else
    checkinfo='不稳定!';
end
disp(checkinfo);
%采用显示格式离散方程
T = t_init*ones(iter+1,dot);  %温度场，行表示一系列空间点的温度，列表示一个点不同时间的温度


%进行迭代计算
for i = 1:iter
    for m = 1:dot
        if m ==1 %中心点
            T(i+1,1) = 2*Fo*T(i,2)+(1-2*Fo)*T(i,m);
        elseif m == dot %边界点
            T(i+1,dot) = T(i,m)*(1-2*Fo*Bi-2*Fo)+2*Fo*T(i,dot-1)+2*Fo*Bi*t_f;
        else
            T(i+1,m) = Fo*(T(i,m+1)+T(i,m-1))+(1-2*Fo)*T(i,m);
        end
    end
end

%绘图
Spec = ['ox+*sdv^><ph';'------------']; %具体某一条曲线的样式
figure;
for i = 1:line_num
plot(0:x:delta,T(i+1,:),Spec(:,i));  %等时间间隔显示Line_num条曲线
hold on;
end
grid on;
%pic_name = ['t0=',num2str(t_init),'℃,t∞=',num2str(t_f),'℃,节点数m=',num2str(dot),',△x=',num2str(x),',△τ=',num2str(time),',Fo=',num2str(Fo,4),',Bi=',num2str(Bi),',',checkinfo];
pic_name = ['t0=',num2str(t_init),'℃,t∞=',num2str(t_f),'℃,节点数m=',num2str(dot),',△x=',num2str(x),',Fo=',num2str(Fo,4),',Bi=',num2str(Bi),',',checkinfo];
title(pic_name);
xlabel('x');
ylabel('温度T/℃');
%legend('τ=10s','τ=1min','τ=5min','τ=10min','τ=15min','τ=20min','τ=30min','τ=40min','τ=60min','τ=80min'); %给每条曲线标注
legend('n=0','n=1','n=2','n=3')
