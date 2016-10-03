function [AR_cov_PSD,freq] = find_AR_Covar_PSD(x,p,K)
[X,Rxx_covar] = corrmtx(x,p,'covariance');
Rxx_covar_part = Rxx_covar(2:length(Rxx_covar),2:length(Rxx_covar));
b = -Rxx_covar(2:end,1);
a_covar = inv(Rxx_covar_part)*b;
a = [1;a_covar];
c = Rxx_covar*a;
error_cov = c(1);
%[h,w] = freqz(1,a,'whole',1024);
[h,w] = freqz(1,a,'whole',2048);
AR_cov_PSD = abs(fftshift(h)).^2;
%AR_cov_PSD = AR_cov_PSD(513:1024);
AR_cov_PSD = AR_cov_PSD(1025:2048);
freq = w - pi;
%freq = freq(513:1024);
freq = freq(1025:2048);
end




