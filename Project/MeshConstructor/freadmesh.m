%  此函数，读入一个meshname.txt文件
%  将其中的三角面片存入facename.txt中，并且返回face矩阵；
%  将其中的点存入vertexname.txt中，并且返回vertex矩阵；


function [vertex,face] = freadmesh(meshname,vertexname,facename)
 %读取tree_mesh.txt文件
fidin=fopen(meshname);                               % 打开点云mesh.txt文件             
fidout1=fopen(vertexname,'w');                       % 创建顶点vertex.txt文件
fidout2=fopen(facename,'w');                          % 创建面片face.txt文件
while ~feof(fidin)                                            % 判断是否为文件末尾               
    tline=fgetl(fidin);                                         % 从文件读一行   
    if tline(1) =='v'                                            % 判断首字符是v，表示顶点
       fprintf(fidout1,'%s\n\n',tline(2:end));       % 把表示顶点的坐标数据写入文件vertex.txt
    elseif tline(1) =='f'                                       % 判断首字符是f，表示三角形面片
        fprintf(fidout2,'%s\n\n',tline(2:end));      % 把表示三角形面片的数据写入文件face.txt
    else
       continue                                         % 如果是其他继续下一次循环
    end
end
%读取原文件结束，关闭
fclose(fidout1);
fclose(fidout2);
fclose(fidin);
%导入数据至工作区
vertex = importdata('vertex.txt');
face = importdata('face.txt');
end