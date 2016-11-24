%% EE 779 : Advanced Topics in Signal Processing
%% Navjot Singh 130110071
%% 
% _(Some technical scripts may also be printed in the HTML file generated,
% please ingore them.)_
%% Question 1
% Zip file was extracted

%% Question 2
% The code in nmf_main and nmfse was understood.

%% Question 3
% Using rdim =49
nmf_navjot
%% Conclusions:
%% 
% trainMSE = 0.419
%%
% testMSE = 6.33 x 10^-6
%%
% myImgMSE = 669
%% Question 4
% Using rdim =25
nmf2_navjot
%% Conclusions:
%% 
% trainMSE = 0.4168
%%
% testMSE = 6.36 x 10^-6
%%
% myImgMSE = 803
%% 
% With r (dim of V) reduced to 25, we observe that less amount of 
% information is captured by our model. Hence the reconstructed image would
% have more error if we use less no. of components. This is also evident
% from the MSE values training images, of 0.413 in rdim=49 and 0.4385 in rdim=25
% respectively. The MSE values follow the same order in case of test images
% too.

%% Question 5
% Both PCA and NMF were run on the same set of data. The results show that
% PCA has a larger value of mean square error (on data image 23) of 1.32
% as compared to 0.43 on the train image 23 using NMF. This may be because
% PCA involves adding or subtracting some components may not make sense in
% some applications, like there is no intuitive understanding to 'subtract
% a face'
