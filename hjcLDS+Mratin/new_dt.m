clear
clc
close all
%��ȡͼ��
tic
for u=7:1:15
    for v=1:1:50
        str=['H:\RGB\7-15\',num2str(u),'-',num2str(v),'.jpg'];
        img = imread(str);
        gray = rgb2gray(img);
        gray = double(gray);
        M{(u-7)*50+v} = DTex(gray);
    end
end

%�������M���������㣬�и�M���м����㣬����������K-mediods
%����������ĵ�����
kvalue = 36;
output_center = k_mediods(M, kvalue,450);
%���������ó����ĵ㼯��
for i = 1:1:kvalue          %64�Ǿ������
    s = output_center(i);
    centers{i} = Data{s};
end

%����������µ����ĵ㣬Ȼ�����ÿ�����������ĵľ��룬ͳ��Ƶ��
feavec = ldsfeavec(Data,centers,50);    %50��ÿ�������ĸ���

toc
