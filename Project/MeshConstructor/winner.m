clear;close;clc
%对大作业的解决思考

%如何读取txt文件，绘制图像；
fidin=fopen('tree_mesh.txt');                          % 打开点云tree_mesh.txt文件             
fidout1=fopen('vertex.txt','w');                       % 创建顶点vertex.txt文件
fidout2=fopen('face.txt','w');                          % 创建顶点vertex.txt文件
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
fclose(fidout1);
fclose(fidout2);
vertex = importdata('vertex.txt');
face = importdata('face.txt');

x_v = vertex(:,1);
y_v = vertex(:,2);
z_v = vertex(:,3);
scatter(x_v,y_v,z_v,'.');
%如何给骨架分段，得到最优切割方案，如何判断一组点是一起的？
        % 骨架模型由骨架点和连接骨架点的线段组成。
        % 可以比较骨架模型中线段与打印平面的夹角，由此确定该条线段 对应的 一段网格模型是否需要支撑结构。
        % 假设有一系列线段要打印。3D打印有一个打印平面，打印方向与它垂直，只要满足每条打印线段与打印平面的夹角 大于 theta角，就可以不需要支撑结构同时打印这些线段。
        % 作为切割节点的骨架点编号可以自行通过绘图读取


%如何给分段后的树画断面

%如何单独显示每科子树