% �˺�����һ������λ���Ķ�����������Ϊһ��������

function HmCode = HmEncode( OrigCode)
%ԭ��ĳ���
Origlength = length(OrigCode);

%У����ĳ���
 Checklength = 1;
while(2^Checklength-1<Origlength+Checklength)
   Checklength=Checklength+1;
end

%���պ�����ĳ���
Hmlength = Origlength+Checklength;

%��ʼ����ֵ�����룬ע�⣺����һ���ַ�����
Hmcode = [];
for i = 1:Hmlength
    Hmcode = [Hmcode,'0'];
end

%���ɼ���У��λ����ı��
table = tableGen(Checklength);
table = table(:,1:Hmlength);

%ע�⣡���ڰ�ԭ��ߵ�����
M= fliplr(OrigCode);

%�������������λ����λ������ȥ
for i = 1:Checklength-1
    if i ~= Checklength-1 
             for j = 2^i+1:2^(i+1)-1  %ԭ���ں������������������ݶα��
                Hmcode(j) = M(j-i-1);
            end
    else
            for j = (2^(i)+1):Hmlength %���һ�����ݣ����ĩΪֹ
                Hmcode(j) = M(j-i-1);
            end
    end
end

%���������У��λ������У��������ȥ����ʱ���õ�֮ǰ���ɵľ���
for i  = 1:Checklength
    Hmcode(2^(i-1)) = num2str(mod(sum(table(i,:).*Hmcode),2));
end

%���պ�������Ѿ������ˣ��ǵ��ٵߵ�����
 HmCode = fliplr(Hmcode);
end




