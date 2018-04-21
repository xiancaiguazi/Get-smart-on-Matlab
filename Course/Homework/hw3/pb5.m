clear;close;clc

x = [0:10,10.5,13 15 18 20 23 25 28 ];
y = [5 -2 -13 -22 -23 -10 23 82 173 302 475 579 1318 2481 4163 6457 9458 13256 17953];
Xa = 0:0.2:28;
Ya = interp1(x,y,Xa,'cubic');
plot(x,y,'bo',Xa,Ya,'r.');
title('第五题，插值问题');
legend('样本点','插值点');
xlabel('x');
ylabel('y');