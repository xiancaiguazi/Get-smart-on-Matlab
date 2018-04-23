
%此函数可以由skeleton矩阵生成line矩阵，记录骨架的线段信息，一对数据表示一个线段的两个端点，不重不漏

function [line,line_num] = sk_line(skeleton,skeleton_num)

line = [];
line_num = 0;
for i = 1: skeleton_num
    for j = 4:7
        if isnan(skeleton(i,j))
            break;
        elseif skeleton(i,j)>i  %确保每条线段只被记录一次
        line = [line; i,skeleton(i,j)];
        line_num = line_num+1;
        end
    end
end

end