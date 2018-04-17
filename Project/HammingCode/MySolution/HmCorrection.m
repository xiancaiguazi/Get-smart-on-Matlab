%此函数检测一个已经是汉明码的二进制数是不是正确编码
%如果不是，那么假设有一位错误，给出纠正这一位错误后的汉明码

function result = HmCorrection(Hmcode)

Hmlength = length(Hmcode);
%此汉明码的校验位数
 Checklength = 2;
while(2^Checklength-1<Hmlength)
   Checklength=Checklength+1;
end
%此汉明码的数据位位数
Origlength = Hmlength-Checklength;

%初始化汉明码的数据位
Origcode = [];
for i = 1:Origlength
   Origcode = [Origcode,'0'];
end
%初始化汉明码的校验位
Checkcode = [];
for i = 1:Checklength
   Checkcode = [Checkcode,'0'];
end
%赋初值 ‘00000……’
newCheckcode = Checkcode;
Result = Checkcode;
expectResult = Checkcode;

%颠倒汉明码！！！
Hmcode = fliplr(Hmcode);

%提取汉明码的数据位
for i = 1:Checklength-1
    if i ~= Checklength-1 
             for j = 2^i+1:2^(i+1)-1  %原码在汉明码中所能填充的数据段编号
                Origcode(j-i-1) = Hmcode(j);
            end
    else
            for j = (2^(i)+1):Hmlength %最后一段数据，填到最末为止
                Origcode(j-i-1) = Hmcode(j);
            end
    end
    
end

%提取汉明码的校验位
for i = 1:Checklength
Checkcode(i) = Hmcode(2^(i-1));
end


%对数字位进行汉明码编码
Origcode = fliplr(Origcode);
newHmcode = HmEncode(Origcode);
newHmcode = fliplr(newHmcode);

%同样的，提取新编码的校验位
for i = 1:Checklength
newCheckcode(i) = newHmcode(2^(i-1));
end
%比较新校验位和原校验位
for i = 1:Checklength
if newCheckcode(i)==Checkcode(i)
    Result(i) = '0';
else
    Result(i) = '1';
end
end

if Result == expectResult
    disp('这是正确的汉明码');
else
    disp('这是错误的汉明码');
    %然后纠正这个错误的汉明码
    
    %确定第几位有问题
    problemBit = bin2dec(fliplr(Result));
    fprintf('第%d位错了\n',problemBit);
    
    if  Hmcode(problemBit) == '0'
        Hmcode(problemBit) = '1';
    else
        Hmcode(problemBit) = '0';
    end
    result = fliplr(Hmcode);
    disp('纠正后的汉明码是');
    disp(result);
    
end

end
