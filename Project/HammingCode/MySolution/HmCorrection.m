%�˺������һ���Ѿ��Ǻ�����Ķ��������ǲ�����ȷ����
%������ǣ���ô������һλ���󣬸���������һλ�����ĺ�����

function result = HmCorrection(Hmcode)

Hmlength = length(Hmcode);
%�˺������У��λ��
 Checklength = 2;
while(2^Checklength-1<Hmlength)
   Checklength=Checklength+1;
end
%�˺����������λλ��
Origlength = Hmlength-Checklength;

%��ʼ�������������λ
Origcode = [];
for i = 1:Origlength
   Origcode = [Origcode,'0'];
end
%��ʼ���������У��λ
Checkcode = [];
for i = 1:Checklength
   Checkcode = [Checkcode,'0'];
end
%����ֵ ��00000������
newCheckcode = Checkcode;
Result = Checkcode;
expectResult = Checkcode;

%�ߵ������룡����
Hmcode = fliplr(Hmcode);

%��ȡ�����������λ
for i = 1:Checklength-1
    if i ~= Checklength-1 
             for j = 2^i+1:2^(i+1)-1  %ԭ���ں������������������ݶα��
                Origcode(j-i-1) = Hmcode(j);
            end
    else
            for j = (2^(i)+1):Hmlength %���һ�����ݣ����ĩΪֹ
                Origcode(j-i-1) = Hmcode(j);
            end
    end
    
end

%��ȡ�������У��λ
for i = 1:Checklength
Checkcode(i) = Hmcode(2^(i-1));
end


%������λ���к��������
Origcode = fliplr(Origcode);
newHmcode = HmEncode(Origcode);
newHmcode = fliplr(newHmcode);

%ͬ���ģ���ȡ�±����У��λ
for i = 1:Checklength
newCheckcode(i) = newHmcode(2^(i-1));
end
%�Ƚ���У��λ��ԭУ��λ
for i = 1:Checklength
if newCheckcode(i)==Checkcode(i)
    Result(i) = '0';
else
    Result(i) = '1';
end
end

if Result == expectResult
    disp('������ȷ�ĺ�����');
else
    disp('���Ǵ���ĺ�����');
    %Ȼ������������ĺ�����
    
    %ȷ���ڼ�λ������
    problemBit = bin2dec(fliplr(Result));
    fprintf('��%dλ����\n',problemBit);
    
    if  Hmcode(problemBit) == '0'
        Hmcode(problemBit) = '1';
    else
        Hmcode(problemBit) = '0';
    end
    result = fliplr(Hmcode);
    disp('������ĺ�������');
    disp(result);
    
end

end
