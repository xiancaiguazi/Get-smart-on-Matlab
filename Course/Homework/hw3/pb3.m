clear;close;clc

%part(1)
p1 = [6,19,-651,-1449,425,1650];
root1 = roots(p1)


%part(2)
func = '6*x^5+19*x^4-651*x^3-1449*x^2+425*x+1650';
max_zero = fzero(func,10)
%part(3)
syms x
y =  6*x^5+19*x^4-651*x^3-1449*x^2+425*x+1650;
t = -11:0.1:11;
y_value = subs(y,x,t);
plot(t,y_value); %绘图只是为了验证结果
min_x = fminbnd(func,-11,11)
func_rv = char(-y);  %此处需要将函数乘负一，从而继续用fminbnd函数找极大值
max_x = fminbnd(func_rv,-11,11)

