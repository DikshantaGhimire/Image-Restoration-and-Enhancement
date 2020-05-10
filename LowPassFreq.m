I  = imread('Penguin.bmp');
I = im2double(I);
[x, y]=meshgrid(1:size(I,2), 1:size(I,1)); %create a meshgrid of an image x and y
cirlce_size = sqrt(x.^2+y.^2); % circle for the centre 
radius = cirlce_size >20; % size of the radius 

I = fft2(I);  % inverse shift 
img_shift= fftshift(I); 
image_highpass = img_shift.*radius ; %apply the high pass filter to all the pixes in a circle 
inverse_highpass = ifft2(ifftshift(image_highpass)); % inverse the engery shift back from the centre 
imshow(inverse_highpass);




