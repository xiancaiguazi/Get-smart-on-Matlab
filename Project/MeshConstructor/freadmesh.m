%  �˺���������һ��meshname.txt�ļ�
%  �����е�������Ƭ����facename.txt�У����ҷ���face����
%  �����еĵ����vertexname.txt�У����ҷ���vertex����


function [vertex,face] = freadmesh(meshname,vertexname,facename)
 %��ȡtree_mesh.txt�ļ�
fidin=fopen(meshname);                               % �򿪵���mesh.txt�ļ�             
fidout1=fopen(vertexname,'w');                       % ��������vertex.txt�ļ�
fidout2=fopen(facename,'w');                          % ������Ƭface.txt�ļ�
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
%��ȡԭ�ļ��������ر�
fclose(fidout1);
fclose(fidout2);
fclose(fidin);
%����������������
vertex = importdata('vertex.txt');
face = importdata('face.txt');
end