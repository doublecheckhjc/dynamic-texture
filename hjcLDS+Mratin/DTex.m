% function [x0,Ymean,Ahat,Chat] = DTex(Y)
% Suboptimal Learning of Dynamic Textures;
% tau = size(Y,2); 
% Ymean = mean(Y,2);
% [U,S,V] = svd(Y-Ymean*ones(1,tau),0);
% Chat=U(:,:); 
% Xhat = S(:,:)*V(:,:)';
% x0=Xhat(:,1);
% X1 = Xhat(:,1:(tau-1));
% X2 = Xhat(:,2:tau);
% Ahat = X2*pinv(X1);


function [M]=DTex(Y)

tau = size(Y,2);
Y = Y + 1e-5*randn(size(Y)); % make sure Y is not equal to a zero matrix
Ymean = mean(Y,2);
Y = Y - Ymean*ones(1,tau); % Center input sequences
Y = Y';


% Perform SVD on Hankel Matrix
if size(Y,2) < size(Y,1)
    [V,S,U] = svd(Y,0);
else
    [U,S,V] = svd(Y',0);
end

% Estimatation of the State Vector X and the Measurement Matrix C
Xhat = S*V';
Chat = U;
Ahat = Xhat(:,2:tau)*pinv(Xhat(:,1:tau-1));
% LDS.A = Ahat;
% LDS.C = Chat;
M = cat(3,Ahat,Chat);
