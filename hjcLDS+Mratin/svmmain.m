clear
clc
close all

load Y.mat
% 
result = Y;
% %归一化
sum1 = sum(result,2);
for i=1:1:450
    results(i,:)=result(i,:)/sum1(i,:);
end
result = results;


%数据划分
train_train = [result(1:40,:);result(51:90,:);result(101:140,:);result(151:190,:);result(201:240,:);result(251:290,:);result(301:340,:);result(351:390,:);result(401:440,:)];
test_simulation = [result(41:50,:);result(91:100,:);result(141:150,:);result(191:200,:);result(241:250,:);result(291:300,:);result(341:350,:);result(391:400,:);result(441:450,:)];


%训练标签
k=1;
trainlabel=[];
for i = 1:1:9
    for j=1:1:40
        trainlabel = [trainlabel;k];
    end
    k=k+1;
end
%测试标签
k=1;
testlabel=[];
for i = 1:1:9
    for j=1:1:10
        testlabel = [testlabel;k];
    end
    k=k+1;
end



model = svmtrain(trainlabel, train_train, '-c 16 -g 0.1 -t 2');%核函数
[predict_label, accuracy] = svmpredict(testlabel, test_simulation, model);