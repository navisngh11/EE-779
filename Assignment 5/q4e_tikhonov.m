function [mse_x_list,delta_list,mse_x_min,x_tikhonov_best,mse_x_tikhonov_best,delta_best] = q4e_tikhonov(A,S,U,V,x,yn)


I = eye(size(A'*A));
delta_list = logspace(-6,0,1000);
mse_x_list = zeros(size(delta_list));
mse_x_min = Inf;
for j = 1:length(delta_list)
    delta = delta_list(j);
    x_tikhonov_est = (inv(A'*A+delta*I))*A'*yn;
    mse_x = mean((abs(x-x_tikhonov_est)).^2);
    mse_x_list(j) = mse_x;
    if(mse_x < mse_x_min)
        mse_x_min = mse_x;
        x_tikhonov_best = x_tikhonov_est;
        delta_best = delta;
        mse_x_tikhonov_best = mse_x;
    end
end