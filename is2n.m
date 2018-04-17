%内置函数，判断一个正整数是不是2的指数倍，用于产生表格时跳过检验位，方便后续用数字位产生检验位
function result = is2n(num) 
if num ==1
    result = 1;
elseif mod(num,2) ==1
    result = 0;
else
    result = is2n(num/2);
end
end
