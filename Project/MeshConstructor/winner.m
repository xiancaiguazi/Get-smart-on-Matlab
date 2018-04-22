clear;close;clc
%�Դ���ҵ�Ľ��˼��

%��ζ�ȡtxt�ļ�������ͼ��
fidin=fopen('tree_mesh.txt');                          % �򿪵���tree_mesh.txt�ļ�             
fidout1=fopen('vertex.txt','w');                       % ��������vertex.txt�ļ�
fidout2=fopen('face.txt','w');                          % ��������vertex.txt�ļ�
while ~feof(fidin)                                            % �ж��Ƿ�Ϊ�ļ�ĩβ               
    tline=fgetl(fidin);                                         % ���ļ���һ��   
    if tline(1) =='v'                                            % �ж����ַ���v����ʾ����
       fprintf(fidout1,'%s\n\n',tline(2:end));       % �ѱ�ʾ�������������д���ļ�vertex.txt
    elseif tline(1) =='f'                                       % �ж����ַ���f����ʾ��������Ƭ
        fprintf(fidout2,'%s\n\n',tline(2:end));      % �ѱ�ʾ��������Ƭ������д���ļ�face.txt
    else
       continue                                         % ���������������һ��ѭ��
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
%��θ��ǼֶܷΣ��õ������и��������ж�һ�����һ��ģ�
        % �Ǽ�ģ���ɹǼܵ�����ӹǼܵ���߶���ɡ�
        % ���ԱȽϹǼ�ģ�����߶����ӡƽ��ļнǣ��ɴ�ȷ�������߶� ��Ӧ�� һ������ģ���Ƿ���Ҫ֧�Žṹ��
        % ������һϵ���߶�Ҫ��ӡ��3D��ӡ��һ����ӡƽ�棬��ӡ����������ֱ��ֻҪ����ÿ����ӡ�߶����ӡƽ��ļн� ���� theta�ǣ��Ϳ��Բ���Ҫ֧�Žṹͬʱ��ӡ��Щ�߶Ρ�
        % ��Ϊ�и�ڵ�ĹǼܵ��ſ�������ͨ����ͼ��ȡ


%��θ��ֶκ����������

%��ε�����ʾÿ������