clear
clc
close all
%读取图像
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

%上面求得M就是特征点，有个M就有几个点，接下来就是K-mediods
%输出是新中心的索引
kvalue = 36;
output_center = k_mediods(M, kvalue,450);
%根据索引得出中心点集合
for i = 1:1:kvalue          %64是聚类个数
    s = output_center(i);
    centers{i} = Data{s};
end

%上面求出了新的中心点，然后计算每个点距离该中心的距离，统计频率
feavec = ldsfeavec(Data,centers,50);    %50是每类样本的个数

toc
