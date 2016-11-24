function [mse_x_list,q_list,mse_x_min,x_svd_best,mse_x_svd_best,q_best] = q4d_truncateSVD(M,N,A,S,U,V,x,yn)

% Calculating from 200 possible values of q
q_list = (1:200);
mse_x_list = zeros(size(q_list));
mse_x_min = Inf;

for j = 1:length(q_list)
    A_trunc = zeros(M,N);
    A_dagger_trunc = zeros(N,M);
    p = rank(A);
    q = q_list(j);
    for k = 1:p-q
        A_trunc = A_trunc + S(k,k)*U(:,k)*V(:,k)';
    end
    for k = 1:p-q
        A_dagger_trunc = A_dagger_trunc + (1/S(k,k))*V(:,k)*U(:,k)';
    end
    x_est_noisy = A_dagger_trunc*yn;
    mse_x = mean((abs(x-x_est_noisy)).^2);
    mse_x_list(j) = mse_x;
  
    if(mse_x < mse_x_min)
        mse_x_min = mse_x;
        x_svd_best = x_est_noisy;
        q_best = q;
        mse_x_svd_best = mse_x;
    end    
end
