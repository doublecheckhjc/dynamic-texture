function [feavec] = ldsfeavec(features,centers,m,k_value)


[~,n] = size(features);
    %求出距离
for u = 1:1:n   %每张图的点*图个数
    for v = 1:1:k_value
        distance(u,v) = distMartin(features{u},centers{v});
%             distance = sqrt(distance);
%将距离排序，求得最小的距离
        [~,y] = min(distance');

    end
end
y1 = reshape(y,271,m)';
for i = 1:1:m           %图片个数
    count = tabulate(y1(i,:));
    feavec(i,:) = [count(:,2)',zeros(1,64-length(count(:,2)'))];
    
end
end




