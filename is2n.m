%���ú������ж�һ���������ǲ���2��ָ���������ڲ������ʱ��������λ���������������λ��������λ
function result = is2n(num) 
if num ==1
    result = 1;
elseif mod(num,2) ==1
    result = 0;
else
    result = is2n(num/2);
end
end
