clear;close;clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                %读取txt文件，绘制图像；
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%读取tree_mesh.txt文件
[vertex,face]=freadmesh('tree_mesh.txt','vertex.txt','face.txt');

%读取tree_skeleton .txt 文件
[index,skeleton,vertex_num,skeleton_num] = freadskeleton('tree_skeleton.txt','index.txt','skeleton.txt');

%寻找点云的中心
vertex_center =  [max(vertex(:,1))+min(vertex(:,1)),max(vertex(:,2))+min(vertex(:,2)),max(vertex(:,3))+min(vertex(:,3))]/2;

%将点云的中心放在圆点
for i = 1:vertex_num 
    vertex(i,:) = vertex(i,:)-vertex_center;
end

%将点云单位化
length_max = max([max(vertex(:,1))-min(vertex(:,1)),max(vertex(:,2))-min(vertex(:,2)),max(vertex(:,3))-min(vertex(:,3))]);
vertex = vertex/length_max;
vertex = [vertex,index];

%寻找骨架点的中心
%skeleton_center = [max(skeleton(:,1))+min(skeleton(:,1)),max(skeleton(:,2))+min(skeleton(:,2)),max(skeleton(:,3))+min(skeleton(:,3))]/2

%这段代码提取了骨架节点1对应的点云，验证了我的猜想：同一个节点对应的点云是聚集的一块
% vertex1 = [];
% for i  = 1: vertex_num
%     if vertex(i,4) == 2
%         vertex1 = [vertex1;vertex(i,:)];
%     end
% end
% scatter3(vertex1(:,1),vertex1(:,2),vertex1(:,3),'or');

%生成记录骨架线段端点信息的矩阵line
[line,line_num] = sk_line(skeleton,skeleton_num);

%绘制点云和骨架图

%绘制点云 如果觉得灰色太浅，可以换成0.7451
scatter3(vertex(:,1),vertex(:,2),vertex(:,3),10,[0.82745,0.82745,0.82745],'.');
hold on;
%绘制骨架节点
scatter3(skeleton(:,1),skeleton(:,2),skeleton(:,3),'MarkerFaceColor','r','MarkerEdgeColor','r');
%绘制骨架线段
for i = 1:line_num
    hold on;
    plot3([skeleton(line(i,1),1),skeleton(line(i,2),1)],[skeleton(line(i,1),2),skeleton(line(i,2),2)],[skeleton(line(i,1),3),skeleton(line(i,2),3)],'r-','LineWidth',2);
end




%对大作业的解决思考

% 如何遍历一个符合角度要求的子树，不重不漏？
% 是不是需要一个矩阵记录相关的信息？
%如何给骨架分段，得到最优切割方案，如何判断一组点是一起的？
        % 骨架模型由骨架点和连接骨架点的线段组成。
        % 可以比较骨架模型中线段与打印平面的夹角，由此确定该条线段 对应的 一段网格模型是否需要支撑结构。
        % 假设有一系列线段要打印。3D打印有一个打印平面，打印方向与它垂直，只要满足每条打印线段与打印平面的夹角 大于 theta角，就可以不需要支撑结构同时打印这些线段。
        % 作为切割节点的骨架点编号可以自行通过绘图读取


%如何给分段后的树画断面



%如何单独显示每科子树


