function table = tableGen(checkBit)

%�˺�������һ����񣬹����������ʱȷ��һ��У��λ���Ǽ�������λȷ��
%ע�⣺˳�����λ�����Ǵӵ�λ����λ����Ӧ�˱��Ǵ�1�����
totalBit  = 2^checkBit-1;
table = zeros(checkBit,totalBit);

for i = 1:checkBit
    for j = 1: totalBit
        %����Ǽ���λ����0
        if(is2n(j)) 
            table(i,j) = 0;
            continue;
        end
         %���������λ���ж����Ƿ��Ӧĳ��У��λ
       tempBin = dec2bin(j,checkBit) ;
       tempBin = fliplr(tempBin);
        if tempBin(i) =='1'
            table(i,j) = 1;
        end
    end
end
        
end

