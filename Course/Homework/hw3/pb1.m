clear;close;clc
%��һ��


%part(1):��������ͼ��

%����һ����ֵ��ͼ
y = [];
for i = -5:0.1:5
    y = [y,f1(i)];
end
x = -5:0.1:5;
plot(x,y);
xlabel('x');
ylabel('y');
title('����ͼ��');
set(gca,'XTick',-5:1:5);

%part��2�������㡾-3,3���Ļ���
%����һ����ֵ����
yint1 = trapz(x,y)

%�����������ź�������
syms x
y1= -x;
y2 = x*x;
y3 = x;

yint2 = int(y1,x,-5,-1)+int(y2,x,-1,1)+int(y3,x,1,5)

