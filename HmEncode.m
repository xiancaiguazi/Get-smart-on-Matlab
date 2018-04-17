% 此函数将一个任意位数的二进制数编码为一个汉明码

function HmCode = HmEncode( OrigCode)
%原码的长度
Origlength = length(OrigCode);

%校验码的长度
 Checklength = 1;
while(2^Checklength-1<Origlength+Checklength)
   Checklength=Checklength+1;
end

%最终汉明码的长度
Hmlength = Origlength+Checklength;

%初始化赋值汉明码，注意：这是一个字符向量
Hmcode = [];
for i = 1:Hmlength
    Hmcode = [Hmcode,'0'];
end

%生成计算校验位所需的表格
table = tableGen(Checklength);
table = table(:,1:Hmlength);

%注意！现在把原码颠倒过来
M= fliplr(OrigCode);

%将汉明码的数据位按照位置填充进去
for i = 1:Checklength-1
    if i ~= Checklength-1 
             for j = 2^i+1:2^(i+1)-1  %原码在汉明码中所能填充的数据段编号
                Hmcode(j) = M(j-i-1);
            end
    else
            for j = (2^(i)+1):Hmlength %最后一段数据，填到最末为止
                Hmcode(j) = M(j-i-1);
            end
    end
end

%将汉明码的校验位按照奇校验规则填进去，此时会用到之前生成的矩阵
for i  = 1:Checklength
    Hmcode(2^(i-1)) = num2str(mod(sum(table(i,:).*Hmcode),2));
end

%最终汉明码就已经生成了，记得再颠倒回来
 HmCode = fliplr(Hmcode);
end




