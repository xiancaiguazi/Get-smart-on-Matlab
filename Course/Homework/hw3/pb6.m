clear;close;clc

syms t a b
x = (cos(t))^3;
y = (sin(t))^3;

temp = (diff(x,t,1)^2+diff(y,t,1)^2)^0.5;

length = int(temp,t,0,pi/2)