function [feavec] = ldsfeavec(features,centers,m,k_value)


[~,n] = size(features);
    %�������
for u = 1:1:n   %ÿ��ͼ�ĵ�*ͼ����
    for v = 1:1:k_value
        distance(u,v) = distMartin(features{u},centers{v});
%             distance = sqrt(distance);
%���������������С�ľ���
        [~,y] = min(distance');

    end
end
y1 = reshape(y,271,m)';
for i = 1:1:m           %ͼƬ����
    count = tabulate(y1(i,:));
    feavec(i,:) = [count(:,2)',zeros(1,64-length(count(:,2)'))];
    
end
end




