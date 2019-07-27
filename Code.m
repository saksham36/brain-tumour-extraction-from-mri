%% Feature Extraction of Brain Tumors Using MRI
% Author: Saksham Consul
% Date: 29.10.2018

%% Extracting the image from the structures

imagefiles = dir('Images\*.png');
nfiles = length(imagefiles);
filenames = cell(nfiles,1);

img_load(imagefiles, nfiles);
lpf(nfiles);
unsharp(nfiles);
median(nfiles); %Done on Unsharp o/p
open(nfiles)
threshold(nfiles)
ws(nfiles);

% for i=1:nfiles
% imname = sprintf('Images\\%d.png',i);
% img = imread(imname);
% imname = sprintf('ImagesWatershed\\%d.png',i);
% tumor = imread(imname);
% figure
% montage([img, tumor]);
% end

i = 1;
figure
subplot(4,2,1)
imname = sprintf('Images\\%d.png',i);
img = imread(imname);
imshow(img);
title('Original Image');
subplot(4,2,2)
imname = sprintf('ImagesLPF\\%d.png',i);
img = imread(imname);
imshow(img);
title('Image after Low Pass Filtering');
subplot(4,2,3)
imname = sprintf('ImagesUnsharp\\%d.png',i);
img = imread(imname);
imshow(img);
title('Image after Unsharp Filtering');
subplot(4,2,4)
imname = sprintf('ImagesMedian\\%d.png',i);
img = imread(imname);
imshow(img);
title('Image after Median Filtering');
subplot(4,2,5)
imname = sprintf('ImagesOpen\\%d.png',i);
img = imread(imname);
imshow(img);
title('Image after Opening');
subplot(4,2,6)
imname = sprintf('ImagesThresh\\%d.png',i);
img = imread(imname);
imshow(img);
title('Image after Thresholding');
subplot(4,2,[7,8])
imname = sprintf('ImagesWatershed\\%d.png',i);
img = imread(imname);
imshow(img);
title('Image after Watershed Algorithm');

figure
subplot(1,2,1)
imname = sprintf('Images\\%d.png',i);
img = imread(imname);
imshow(img);
title('Original Image');
subplot(1,2,2)
imname = sprintf('ImagesWatershed\\%d.png',i);
img = imread(imname);
imshow(img);
title('Output Image');
