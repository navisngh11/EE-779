%clear all
%nmf_main('learn', 10125)
DATA = load('./results/orldata.mat');
exp2 = load('./results/experiment-10125.mat');


testDATA = orldata_test('nmf'); % Get test images from orldata

% Case 1: Test using trained image
% Fill to complete 3.(a)
% Use one image from the training data set
orlImgTrain = DATA.V(:,23);
orlImgTrainEst = (exp2.W * exp2.H) ;
orlImgTrainEst = orlImgTrainEst(:,1);
trainMSE = (orlImgTrain - orlImgTrainEst)'*(orlImgTrain - orlImgTrainEst)/size(DATA.V,1);
trainMSE
fig = figure;
set(gcf, 'Position', get(0, 'Screensize'));
subplot(1,2,1)
imshow( reshape ( orlImgTrain , 56 , 46) , [min( orlImgTrain ) max( orlImgTrain ) ] )
title('Original Train Image r=25');
subplot(1,2,2)
imshow( reshape ( orlImgTrainEst, 56 , 46) , [min( orlImgTrainEst ) max( orlImgTrainEst ) ] )
title('Reconstructed Train Image r=25');
saveas(fig,'./results/q4_a.jpg','jpg');

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
title('Original Test Image r=25');
subplot(1,2,2)
imshow( reshape ( orlImgTestEst, 56 , 46) , [min( orlImgTestEst ) max( orlImgTestEst ) ] )
title('Reconstructed Test Image r=25');
saveas(fig,'./results/q4_b.jpg','jpg');

% Case 3: Test using your face image 
% Read in your image
% Fill to complete 3.(c)
myImg = rgb2gray(imread('myImg.jpg'));
myImg = imresize(myImg,'outputSize',[56,46]);
myImg_vec = double(myImg(:));
myImg_vec = myImg_vec -mean(myImg_vec)*ones(size(myImg_vec,1),1);
myImgEst = exp2.W*inv(exp2.W'*exp2.W)*exp2.W'*myImg_vec;
myImgMSE = (myImg_vec - myImgEst)'*(myImg_vec - myImgEst)/size(myImg_vec,1);
myImgMSE
fig = figure;
set(gcf, 'Position', get(0, 'Screensize'));
subplot(1,2,1)
imshow( reshape ( myImg_vec , 56 , 46) , [min( myImg_vec ) max( myImg_vec ) ] )
title('Original My Image r=25');
subplot(1,2,2)
imshow( reshape ( myImgEst, 56 , 46) , [min( myImgEst ) max( myImgEst ) ] )
title('Reconstructed My Image r=25');
saveas(fig,'./results/q4_c.jpg','jpg');
