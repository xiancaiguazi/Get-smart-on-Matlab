clear;close;clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                %��ȡtxt�ļ�������ͼ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%��ȡtree_mesh.txt�ļ�
[vertex,face]=freadmesh('tree_mesh.txt','vertex.txt','face.txt');

%��ȡtree_skeleton .txt �ļ�
[index,skeleton,vertex_num,skeleton_num] = freadskeleton('tree_skeleton.txt','index.txt','skeleton.txt');

%Ѱ�ҵ��Ƶ�����
vertex_center =  [max(vertex(:,1))+min(vertex(:,1)),max(vertex(:,2))+min(vertex(:,2)),max(vertex(:,3))+min(vertex(:,3))]/2;

%�����Ƶ����ķ���Բ��
for i = 1:vertex_num 
    vertex(i,:) = vertex(i,:)-vertex_center;
end

%�����Ƶ�λ��
length_max = max([max(vertex(:,1))-min(vertex(:,1)),max(vertex(:,2))-min(vertex(:,2)),max(vertex(:,3))-min(vertex(:,3))]);
vertex = vertex/length_max;
vertex = [vertex,index];

%Ѱ�ҹǼܵ������
%skeleton_center = [max(skeleton(:,1))+min(skeleton(:,1)),max(skeleton(:,2))+min(skeleton(:,2)),max(skeleton(:,3))+min(skeleton(:,3))]/2

%��δ�����ȡ�˹Ǽܽڵ�1��Ӧ�ĵ��ƣ���֤���ҵĲ��룺ͬһ���ڵ��Ӧ�ĵ����Ǿۼ���һ��
% vertex1 = [];
% for i  = 1: vertex_num
%     if vertex(i,4) == 2
%         vertex1 = [vertex1;vertex(i,:)];
%     end
% end
% scatter3(vertex1(:,1),vertex1(:,2),vertex1(:,3),'or');

%���ɼ�¼�Ǽ��߶ζ˵���Ϣ�ľ���line
[line,line_num] = sk_line(skeleton,skeleton_num);

%���Ƶ��ƺ͹Ǽ�ͼ

%���Ƶ��� ������û�ɫ̫ǳ�����Ի���0.7451
scatter3(vertex(:,1),vertex(:,2),vertex(:,3),10,[0.82745,0.82745,0.82745],'.');
hold on;
%���ƹǼܽڵ�
scatter3(skeleton(:,1),skeleton(:,2),skeleton(:,3),'MarkerFaceColor','r','MarkerEdgeColor','r');
%���ƹǼ��߶�
for i = 1:line_num
    hold on;
    plot3([skeleton(line(i,1),1),skeleton(line(i,2),1)],[skeleton(line(i,1),2),skeleton(line(i,2),2)],[skeleton(line(i,1),3),skeleton(line(i,2),3)],'r-','LineWidth',2);
end




%�Դ���ҵ�Ľ��˼��

% ��α���һ�����ϽǶ�Ҫ������������ز�©��
% �ǲ�����Ҫһ�������¼��ص���Ϣ��
%��θ��ǼֶܷΣ��õ������и��������ж�һ�����һ��ģ�
        % �Ǽ�ģ���ɹǼܵ�����ӹǼܵ���߶���ɡ�
        % ���ԱȽϹǼ�ģ�����߶����ӡƽ��ļнǣ��ɴ�ȷ�������߶� ��Ӧ�� һ������ģ���Ƿ���Ҫ֧�Žṹ��
        % ������һϵ���߶�Ҫ��ӡ��3D��ӡ��һ����ӡƽ�棬��ӡ����������ֱ��ֻҪ����ÿ����ӡ�߶����ӡƽ��ļн� ���� theta�ǣ��Ϳ��Բ���Ҫ֧�Žṹͬʱ��ӡ��Щ�߶Ρ�
        % ��Ϊ�и�ڵ�ĹǼܵ��ſ�������ͨ����ͼ��ȡ


%��θ��ֶκ����������



%��ε�����ʾÿ������


