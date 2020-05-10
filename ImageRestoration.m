
Penguin = im2double(imread('penguinOriginal.bmp'));
original_image  = imread('PenguinOriginal.bmp');
original_image = im2double(original_image); % convet to uint from double
figure (1);
imshow(Penguin);
% added blur to original image (control)
len = 20; %length of each pixel 
theta = 10; % angle of the pixel (45 degrees)

PSF = fspecial('disk', 6); % Creating a point spread function to add blur
blurred = imfilter(Penguin, PSF);
figure (2);
imshow(blurred)
title('Blurred for experiment purposes')

%insert addative noise to the Weiner image 
Weiner_Img = deconvwnr(blurred, PSF, 0.005); %predefined Weiner filter function in Matlab 
figure (3); 
imshow(Weiner_Img); title('Weiner Filter')

%insert addative noise to the Blind Conv image 
Blind_Conv = deconvblind(blurred, PSF, 8);  %predefined Blind Convolution function in Matlab 
figure (4); 
imshow(Blind_Conv); title('Blind Deconvolution')


%AMSE for Blurred Image
final_distorted  = immse(original_image, blurred); 
fprintf('\n The mean-squared error of the Weiner Restoration is %0.4f\n', final_distorted);

%AMSE for Weiner Image
final_distorted  = immse(original_image, Weiner_Img); 
fprintf('\n The mean-squared error of the Weiner Restoration is %0.4f\n', final_distorted);
 
%AMSE for Blind Convolution 
final_distorted  = immse(original_image, Blind_Conv); 
fprintf('\n The mean-squared error of the Blind Convolution image is %0.4f\n', final_distorted);
 

