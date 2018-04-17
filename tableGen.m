function table = tableGen(checkBit)

%此函数返回一个表格，供汉明码编码时确定一个校验位由那几个数字位确定
%注意：顺序对数位来讲是从低位到高位，对应此表是从1到最后
totalBit  = 2^checkBit-1;
table = zeros(checkBit,totalBit);

for i = 1:checkBit
    for j = 1: totalBit
        %如果是检验位，置0
        if(is2n(j)) 
            table(i,j) = 0;
            continue;
        end
         %如果是数字位，判断其是否对应某个校验位
       tempBin = dec2bin(j,checkBit) ;
       tempBin = fliplr(tempBin);
        if tempBin(i) =='1'
            table(i,j) = 1;
        end
    end
end
        
end

