
Penguin = imread('Penguin.bmp'); % Read Image
original_image  = imread('PenguinOriginal.bmp');
subplot(2,2,1)
imshow(Penguin);
title('Orignal distorted image');
 
%----------------------------------------------
%Average Filter 
 
avg_filter = fspecial('average', [3,3]); % the function uses a kernal of 3 x 3 from the centrer pixel neighbourhood 
i2 = filter2(avg_filter,Penguin,'same'); %'valid' zero padding thefore image is smaller
%'full' image is larger than before 
Average_filter =i2/255;
subplot(2,2,3)
imshow(Average_filter);
title('Avearge Filter');

%----------------------------------------------
%Median Filter 

Median_filter = medfilt2(Penguin);
subplot(2,2,2)
imshow(Median_filter);
title('Median Filter');

%----------------------------------------------
%gassuian filter
Penguin = imread('Penguin.bmp'); % Read Image
k = fspecial('gaussian', [5,5], 2); % the kernal of the gaussian filer and a variance of 2
gassuian_filter = imfilter(Penguin,k);  % built in matlab function 
subplot(2,2,4)

%title('Gaussian Filter');

% winer filter
 w = wiener2(gassuian_filter,[5,5]);
 imshow(gassuian_filter)
title('Gaussian Filter');
%----------------------------------------------

final_distorted  = immse(original_image, original_image); 
fprintf('\n The mean-squared error of the original image is %0.4f\n', final_distorted);

Average_filter = uint8(Average_filter); % convet to uint from double
final_distorted  = immse(original_image, Average_filter); 
fprintf('\n The mean-squared error of the Average_filter image is %0.4f\n', final_distorted);

final_distorted  = immse(original_image, Median_filter); 
fprintf('\n The mean-squared error of the Median_filter image is %0.4f\n', final_distorted);

final_distorted  = immse(original_image, gassuian_filter); 
fprintf('\n The mean-squared error of the gassuian_filter image is %0.4f\n', final_distorted);

final_distorted  = immse(original_image, w); 
fprintf('\n The mean-squared error of the winer_filter image is %0.4f\n', final_distorted);

