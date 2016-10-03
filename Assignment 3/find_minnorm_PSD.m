function [minimum_norm_psd,freq] = find_minnorm_PSD(x,M,P)
[X,Rxx_covar] = corrmtx(x,M-1,'covariance');

M = length(Rxx_covar(:,1));
[V,lambda] = eig(Rxx_covar);
V_noise = V(:,1:M-P);

% Calculating vector a
u = zeros(1,M)';
u(1) = 1;
num = (V_noise*V_noise')*u;
den = u'*(V_noise*V_noise')*u;
a = num./den;

%spectrum_len = 512;
spectrum_len = 1024;
freq = linspace(0,pi,spectrum_len);
sum_denom = zeros(1,spectrum_len);

for j = 1:length(freq)
    w = freq(j); 
    sum_temp = 0;
    for k = 1:M
        sum_temp = sum_temp + (exp(-1i*(k-1)*w))*a(k);
    end
    sum_denom(j) = (abs(sum_temp))^2;
end
minimum_norm_psd = 1./sum_denom;
minimum_norm_psd = minimum_norm_psd';
end