clear;close;clc
%第一题


%part(1):画出函数图像

%方法一：数值绘图
y = [];
for i = -5:0.1:5
    y = [y,f1(i)];
end
x = -5:0.1:5;
plot(x,y);
xlabel('x');
ylabel('y');
title('函数图像');
set(gca,'XTick',-5:1:5);

%part（2）：计算【-3,3】的积分
%方法一：数值计算
yint1 = trapz(x,y)

%方法二：符号函数积分
syms x
y1= -x;
y2 = x*x;
y3 = x;

yint2 = int(y1,x,-5,-1)+int(y2,x,-1,1)+int(y3,x,1,5)

