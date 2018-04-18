clear;close all;clc
%����4-3����ά����̬����ƬЧ�ʼ���

%

%��֪��Ϣ
t_init = 100;  %��ʼ�¶�
t_f = 20;           %�����¶�
delta = 0.02;       %��Ƭ���
%����1
h = 50;             %��������ϵ��
lambda = 100;  %����ϵ��
H = 0.04;           %��Ƭ�߶�
%����2
h = 400;        %��������ϵ��
lambda = 8;  %����ϵ��
H = 0.08;       %��Ƭ�߶�

%�Զ�����Ϣ
M = 80;     %���򻮷ֵĿ�������
iter = 0;  %��������,������ʾ�ﵽ������������еĴ���
threshold = 1e-6;

%������Ϣ
x = H/M;  %delta x�����򲽳�
y = x;                   %delta y�����򲽳�,����Ϊ����������
N = delta/y;       %���򻮷ֵĿ�������
m = M+1; %����ڵ���
n = N+1;%����ڵ���
Bi = h*x/lambda;

%��ʼ�¶ȳ�����
theta = (t_init-t_f)*ones(m,n); %����ֵ��Ϊ��ʼ�����¶�

%���е�������
while 1
    tmp = theta; %���ڶԱȵ���ǰ���ֵ��ȷ���Ƿ������ֹ����
    iter=iter+1;%��¼��������
    %��˹���¶�����
    for j = 1: m %����
        for k = 1:n %����
            %���ݽڵ��λ�÷�Ϊ6�����
            
            if j>1&&j<m&&k==1;%1:�����ģ�һ�߾��ȣ����ߵ���
                theta(j,k) = (theta(j+1,1)+theta(j-1,1)+2*theta(j,2))/4;
                
            elseif (j>1&&j<m)&&(k>1&&k<n);%2:���У��ıߴ���
                theta(j,k) = (theta(j+1,k)+theta(j-1,k)+theta(j,k+1)+theta(j,k-1))/4; 
                
            elseif (j>1&&j<m)&&(k==n);%3:�߲࣬һ�߶��������ߵ���
                theta(j,k) = (theta(j+1,n)+theta(j-1,n)+2*theta(j,k-1))/(4+2*Bi);
                
            elseif (j==m)&&(k>1&&k<n);%4:�߶��ˣ�һ�߶��������ߵ���
                theta(j,k) = (theta(m,k-1)+theta(m,k+1)+2*theta(j-1,k))/(4+2*Bi);
                
            elseif (j==m)&&(k==n);%5���߶��˱�Ե�ǣ����߶���
                theta(j,k) = (theta(m,n-1)+theta(m-1,n))/(2+2*Bi);
                
            elseif  (j==m)&&(k==1);%6���߶������ģ�һ�߶�����һ�߾���
                theta(j,k) = (theta(m,2)+theta(m-1,1))/(2+2*Bi);
            
            end 
        end
    end
    %�ж��Ƿ���Խ�������
    if max(tmp-theta)<threshold %���ֵС����ֵ���������
        break;
    end
    
end

%����Ч�ʵ�Ӱ������

%����ͼ��
figure;
[X, Y] = meshgrid(0:y:delta,0:x:H);

mesh(X,Y,theta);
%mesh(theta);

figure;
contour(X,Y,theta,40);
