%  此函数，读入一个skeleton.txt文件
%  将其中的点云对应的骨架节点索引存入index.txt中，并且返回index矩阵；
%  将其中的所有骨架节点坐标存入skeleton.txt中，并且返回skeleton矩阵；

function [index,skeleton,vertex_num,skeleton_num]=freadskeleton(skname,indexname,dotname)

fidin=fopen(skname);                                       % 打开点云tree_skeleton.txt文件             
fidout1=fopen(indexname,'w');                        % 创建index.txt文件,存储点云对应的骨架节点索引
fidout2=fopen(dotname,'w');                            % 创建skeleton.txt文件，存储所有骨架节点坐标

skeleton_num = str2num(fgetl(fidin));              %该文件的第一行就是骨架数
vertex_num = str2num(fgetl(fidin));                 %该文件的第二行是顶点数
%读取tree_skeleton .txt 文件
while ~feof(fidin)                                            % 判断是否为文件末尾               
    tline=fgetl(fidin);                                         % 从文件读一行   
    if length(tline)<4                                       % 判断字符长度小于4，表示顶点的index
       fprintf(fidout1,'%s\n\n',tline);               % 把表示顶点的坐标数据写入文件vertex.txt 
    elseif length(tline)>3
        fprintf(fidout2,'%s\n\n',tline);              % 把表示骨架点坐标的数据写入文件skeleton.txt
    else
       continue                                         % 如果是其他继续下一次循环
    end
end
fclose(fidout1);
fclose(fidout2);
fclose(fidin);
%导入数据至工作区
index = importdata(indexname);
skeleton = importdata(dotname);

end