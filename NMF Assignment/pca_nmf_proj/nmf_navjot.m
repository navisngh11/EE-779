%close all
%clear all
%nmf_main('learn', 101)
DATA = load('./results/orldata.mat');
exp1 = load('./results/experiment-101.mat');

testDATA = orldata_test('nmf'); % Get test images from orldata

% Case 1: Test using trained image
% Fill to complete 3.(a)
% Use one image from the training data set
train_image = DATA.V(:,23);
orlImgTrain = train_image;
orlImgTrainEst = (exp1.W * exp1.H) ;
orlImgTrainEst = orlImgTrainEst(:,1);
trainMSE = (orlImgTrain - orlImgTrainEst)'*(orlImgTrain - orlImgTrainEst)/size(train_image,1);
trainMSE
fig = figure;
set(gcf, 'Position', get(0, 'Screensize'));
subplot(1,2,1)
imshow( reshape ( orlImgTrain , 56 , 46) , [min( orlImgTrain ) max( orlImgTrain ) ] )
title('Original Train Image r=49');
subplot(1,2,2)
imshow( reshape ( orlImgTrainEst, 56 , 46) , [min( orlImgTrainEst ) max( orlImgTrainEst ) ] )
title('Reconstructed Train Image r=49');
saveas(fig,'./results/q3_a.jpg','jpg');


% Case 2: Test using a test image from orl data base
orlImgTest = testDATA(:,11);
H = inv(exp1.W'*exp1.W)*exp1.W'*orlImgTest;
H(H<0) = 0;
orlImgTestEst = exp1.W*H;
testMSE = (orlImgTest - orlImgTestEst)'*(orlImgTest - orlImgTestEst)/size(testDATA,1);
testMSE
fig = figure;
set(gcf, 'Position', get(0, 'Screensize'));
subplot(1,2,1)
imshow( reshape ( orlImgTest , 56 , 46) , [min( orlImgTest ) max( orlImgTest ) ] )
title('Original Test Image r=49');
subplot(1,2,2)
imshow( reshape ( orlImgTestEst, 56 , 46) , [min( orlImgTestEst ) max( orlImgTestEst ) ] )
title('Reconstructed Test Image r=49');
saveas(fig,'./results/q3_b.jpg','jpg');

% Case 3: Test using your face image 
% Read in your image
% Fill to complete 3.(c)
myImg = rgb2gray(imread('myImg.jpg'));
myImg = imresize(myImg,'outputSize',[56,46]);
myImg_vec = double(myImg(:));
myImgEst = exp1.W*inv(exp1.W'*exp1.W)*exp1.W'*myImg_vec;
myImgMSE = (myImg_vec - myImgEst)'*(myImg_vec - myImgEst)/size(myImg_vec,1);
myImgMSE
fig = figure;
set(gcf, 'Position', get(0, 'Screensize'));
subplot(1,2,1)
imshow( reshape ( myImg_vec , 56 , 46) , [min( myImg_vec ) max( myImg_vec ) ] )
title('Original My Image r=49');
subplot(1,2,2)
imshow( reshape ( myImgEst, 56 , 46) , [min( myImgEst ) max( myImgEst ) ] )
title('Reconstructed My Image r=49');
saveas(fig,'./results/q3_c.jpg','jpg');

