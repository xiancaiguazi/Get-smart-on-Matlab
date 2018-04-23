%  �˺���������һ��skeleton.txt�ļ�
%  �����еĵ��ƶ�Ӧ�ĹǼܽڵ���������index.txt�У����ҷ���index����
%  �����е����йǼܽڵ��������skeleton.txt�У����ҷ���skeleton����

function [index,skeleton,vertex_num,skeleton_num]=freadskeleton(skname,indexname,dotname)

fidin=fopen(skname);                                       % �򿪵���tree_skeleton.txt�ļ�             
fidout1=fopen(indexname,'w');                        % ����index.txt�ļ�,�洢���ƶ�Ӧ�ĹǼܽڵ�����
fidout2=fopen(dotname,'w');                            % ����skeleton.txt�ļ����洢���йǼܽڵ�����

skeleton_num = str2num(fgetl(fidin));              %���ļ��ĵ�һ�о��ǹǼ���
vertex_num = str2num(fgetl(fidin));                 %���ļ��ĵڶ����Ƕ�����
%��ȡtree_skeleton .txt �ļ�
while ~feof(fidin)                                            % �ж��Ƿ�Ϊ�ļ�ĩβ               
    tline=fgetl(fidin);                                         % ���ļ���һ��   
    if length(tline)<4                                       % �ж��ַ�����С��4����ʾ�����index
       fprintf(fidout1,'%s\n\n',tline);               % �ѱ�ʾ�������������д���ļ�vertex.txt 
    elseif length(tline)>3
        fprintf(fidout2,'%s\n\n',tline);              % �ѱ�ʾ�Ǽܵ����������д���ļ�skeleton.txt
    else
       continue                                         % ���������������һ��ѭ��
    end
end
fclose(fidout1);
fclose(fidout2);
fclose(fidin);
%����������������
index = importdata(indexname);
skeleton = importdata(dotname);

end