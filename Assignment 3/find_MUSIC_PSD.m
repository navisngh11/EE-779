function [MUSIC_psd,freq] = find_MUSIC_PSD(x,M,P)

[X,Rxx_covar] = corrmtx(x,M-1,'covariance');

M = length(Rxx_covar(:,1));
[V,lambda] = eig(Rxx_covar);
%spectrum_len = 512;
spectrum_len = 1024;
freq = linspace(0,pi,spectrum_len);
sum_denom = zeros(1,spectrum_len);
for j = 1:length(freq)
    w = freq(j); 
    sum_temp = 0;
    for i = 1:M-P
        v_i = V(:,i);
        temp = 0;
        for k = 1:M
            temp = temp + (exp(-1i*(k-1)*w))*v_i(k);
        end
        sum_temp = sum_temp + (abs(temp))^2;
    end
    sum_denom(j) = sum_temp;
end
MUSIC_psd = 1./sum_denom;
MUSIC_psd = MUSIC_psd';
end