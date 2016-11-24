function [beamf,capon,root,esprit] = computeEstimates_q1(theta)
P = eye(2);
num_samp=128;
y = zeros(10, 100, 50);
beamf_phi = zeros(50, num_samp);
capon_phi = zeros(50, num_samp);
theta1 = zeros(50, 2);
theta2 = zeros(50, 2);

% Because of the noise component in generation of the ULA data, we will
% take fifty iterations of ULA data generation and average the final
% results.
for i=1:50,
    y(:,:,i) = uladata([0, theta] ,P,100,1,10,0.5);
    beamf_phi(i,:) = beamform(y(:,:,i), num_samp, 0.5);
    capon_phi(i,:) = capon_sp(y(:,:,i), num_samp, 0.5);
    theta1(i,:) = root_music_doa(y(:,:,i), 2, 0.5);
    theta2(i,:) = esprit_doa(y(:,:,i), 2, 0.5);
end 
phi1avg(1:num_samp) = mean(beamf_phi(:,1:num_samp));
beamf = phi1avg;

phi2avg(1:num_samp) = mean(capon_phi(:,1:num_samp));
capon = phi2avg;

root = theta1;

esprit = theta2;