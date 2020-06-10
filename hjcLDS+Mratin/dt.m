clear
clc
close all
Data = [];
%读取图像
tic
for u=15:1:15
    for v=1:1:50
        str=['H:\RGB\7-15\',num2str(u),'-',num2str(v),'.jpg'];
        img = imread(str);
        gray = rgb2gray(img);
        gray = double(gray);
        % 
        %对原图像切片1
        [m,n] = size(gray);
        patch = m-30+1;
        for i = 1:1:patch                     %30是对一张图片切片，高是30，这与k-mediods里的271相互联系
            Y{i} = gray(i:(i+30-1),:);
            M{i} = DTex(Y{i});
        end
        Data = [Data M];
    end
end

%上面求得M就是特征点，有个M就有几个点，接下来就是K-mediods
%输出是新中心的索引
kvalue = 64;
output_center = k_mediods(Data, kvalue,patch);
%根据索引得出中心点集合
for i = 1:1:kvalue          %64是聚类个数
    s = output_center(i);
    centers{i} = Data{s};
end

%上面求出了新的中心点，然后计算每个点距离该中心的距离，统计频率
feavec = ldsfeavec(Data,centers,50,kvalue);    %50是每类样本的个数

toc






































% %对原图像切片2
% [r, c] = size(gray);
% new_r = ceil(r/500) * 500;
% new_c = ceil(c/500) * 500;
% new_img = imresize(gray, [new_r new_c], 'bilinear');
% % imshow(new_img,[]);
% row_blk_num = (new_r-50)/50;  % 5
% col_blk_num = (new_c-50)/50;  % 11
% blocks = 1;
% for i = 1:row_blk_num
%     for j = 1:col_blk_num
%         disp(blocks);
%         block = new_img((i - 1) * 50 + 1 : (i+1) * 50, (j - 1) * 50 + 1 : (j+1) * 50, :);
%         imwrite(block, ['C:\Users\韩金城\Documents\MATLAB\patch\' num2str(blocks) '.jpg']);
%         blocks = blocks + 1;
%     end
% end
% 
