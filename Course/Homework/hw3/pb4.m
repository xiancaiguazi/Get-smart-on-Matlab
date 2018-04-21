clear;close;clc
%原始数据
x= -1:0.1:1;
y = [1.1 -0.21 -0.88 -0.98 -1 -0.5 0.04 0.24 0.8 0.86 0.89 0.95 0.63 0.23 -0.15 -0.46 -0.86 -1.03 -0.86 -0.18 0.9];
plot(x,y,'*')

%part(1)
p4 = polyfit(x,y,4);

a = p4(1)
b = p4(2)
c = p4(3)
d = p4(4)
e = p4(5)

%part(2)
Xa = linspace(-1,1,101);
Ya = polyval(p4,Xa);
hold on;
plot(Xa,Ya,'-')
title('第四题，数据点的多项式拟合');
legend('数据点','拟合曲线');
xlabel('x');
ylabel('y');