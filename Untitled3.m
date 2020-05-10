close all; 
%image preprocessing
y = im2double(imread('penguin.bmp'));
 
%take disk psf
PSF = fspecial('disk', 8);
 
%convolve image with psf
%or use imfilter w/ 'conv'
yblur = conv2(y,PSF); 
 
%plot original image
figure(); 
subplot(2,1,1); imshow(y); title('actual image'); 
%plot unnoisy blurred image
subplot(2,1,2); imshow(yblur); title('blurred image');  
 
%add noise at different levels to the blurred image
y2BlurredNoisy = imnoise(yblur,'gaussian',0,.0000000000001);
 
%plot different noisy blurred images
figure(); 
subplot(2,2,1); imshow(yblur); title('no noise');
subplot(2,2,2); imshow(y2BlurredNoisy); title('Gaussian white noise of variance 10^{-13}'); 

%use simple X = Y/H to get back original image
%show how much noise affects it
Y1 = fft2(yblur); 
Y2 = fft2(y2BlurredNoisy);

 
%zero pad the psf to match the size of the blurred image
%noisy images are all the same size, thus do not require unique PSF's
newh = zeros(size(yblur)); 
psfsize = size(PSF); 
newh(1: psfsize(1), 1:psfsize(2))= PSF;
H = fft2(newh); 
 
%use simple X = Y/H to get back original image
%show how much noise affects it
y1deblurred = ifft2(Y1./H);
y2deblurred = ifft2(Y2./H); 

 
%plot deblurred images
subplot(2,2,3);imshow(y1deblurred);title('no noise');
subplot(2,2,4);imshow(y2deblurred);title('Gaussian white noise of variance 10^{-13}');

