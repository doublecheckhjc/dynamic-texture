function [ output ] = k_mediods(data, k_value,patch)

% ���룺    data, Ϊһ�� ���� M��N�� ��ʾ������������M��ʾ����M����������N��ʾÿһ��������ά�ȣ�
%           k_value, ��ʾ����������Ŀ��
% �����    output, ��һ�������� M��������ʾÿһ���������ڵ�����ţ�


%�������У����ѡȡK��������Ϊ��ʼ�ľ������ģ�
data_num = size(data, 2);  
temp = randperm(data_num, k_value)';     
center = data(:,temp);

%���ڼ�������������
iteration = 0;
distance = [];
while 1
    %�����������������ĵľ��룻
    for i = 1:1:k_value
        for j = 1:1:patch
            distance(i,j) = distMartin(center{i},data{j});
        end
    end
    %����������ÿһ�д�С�������� �����Ӧ��indexֵ����ʵ����ֻ��Ҫindex�ĵ�һ�е�ֵ��
    [~, index] = sort(distance, 2, 'ascend');

    %�������γ��µľ������ģ�

    for i = 1:k_value
        data_for_one_class = data(:,index(i, 1));          
        center_new{i} = (center{i}+data_for_one_class{1})/2;    %��Ϊ��ʼ�ľ�������Ϊ�������е�Ԫ�أ����Բ������ĳ������������Ϊ0�������
    end
   
    %����������������۾�һ��������
    iteration = iteration + 1;
    fprintf('���е�������Ϊ��%d\n', iteration);
    
    % ��������εľ������Ĳ��䣬��ֹͣ����������ѭ����
    if iteration == 10                                           %center_new == center
        break;
    end
    
    center = center_new;
end

output = index(:, 1);
    
end
