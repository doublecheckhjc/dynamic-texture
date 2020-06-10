clear
clc
close all
Data = [];
%��ȡͼ��
tic
for u=15:1:15
    for v=1:1:50
        str=['H:\RGB\7-15\',num2str(u),'-',num2str(v),'.jpg'];
        img = imread(str);
        gray = rgb2gray(img);
        gray = double(gray);
        % 
        %��ԭͼ����Ƭ1
        [m,n] = size(gray);
        patch = m-30+1;
        for i = 1:1:patch                     %30�Ƕ�һ��ͼƬ��Ƭ������30������k-mediods���271�໥��ϵ
            Y{i} = gray(i:(i+30-1),:);
            M{i} = DTex(Y{i});
        end
        Data = [Data M];
    end
end

%�������M���������㣬�и�M���м����㣬����������K-mediods
%����������ĵ�����
kvalue = 64;
output_center = k_mediods(Data, kvalue,patch);
%���������ó����ĵ㼯��
for i = 1:1:kvalue          %64�Ǿ������
    s = output_center(i);
    centers{i} = Data{s};
end

%����������µ����ĵ㣬Ȼ�����ÿ�����������ĵľ��룬ͳ��Ƶ��
feavec = ldsfeavec(Data,centers,50,kvalue);    %50��ÿ�������ĸ���

toc






































% %��ԭͼ����Ƭ2
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
%         imwrite(block, ['C:\Users\�����\Documents\MATLAB\patch\' num2str(blocks) '.jpg']);
%         blocks = blocks + 1;
%     end
% end
% 
