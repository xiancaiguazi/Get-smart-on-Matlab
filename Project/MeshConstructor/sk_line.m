
%�˺���������skeleton��������line���󣬼�¼�Ǽܵ��߶���Ϣ��һ�����ݱ�ʾһ���߶ε������˵㣬���ز�©

function [line,line_num] = sk_line(skeleton,skeleton_num)

line = [];
line_num = 0;
for i = 1: skeleton_num
    for j = 4:7
        if isnan(skeleton(i,j))
            break;
        elseif skeleton(i,j)>i  %ȷ��ÿ���߶�ֻ����¼һ��
        line = [line; i,skeleton(i,j)];
        line_num = line_num+1;
        end
    end
end

end