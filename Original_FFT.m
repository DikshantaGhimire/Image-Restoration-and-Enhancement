distorted_image  = imread('Penguin.bmp');
original_image  = imread('PenguinOriginal.bmp');



%Section 1: applying FFT algorithm 
fast_fourier_transform = fft2(distorted_image); % apply the fast fourier transform algoritm to the image 
center_fft  = fftshift(spec_orig);  % shifting zeoro- intensity values to the centre array 
figure(1);
imshow(log(1 + abs(spec_img)),[]); % inchances images for dark pixel values
impixelinfo 

%Section 2: chnaging the pixel values the particules 


for j = 35:45
    for n = 20:25
        spec_img(n,j) = 0; 
    end
    for n = 64:80
        spec_img(n,j) = 0; 
    end
    for n = 105:110
        spec_img(n,j) = 0; 
    end
    for n = 150:160
        spec_img(n,j) = 0; 
    end
    for n = 190:200
        spec_img(n,j) = 0; 
    end
end

for j = 110:120
    for n = 20:25
        spec_img(n,j) = 0; 
    end
    for n = 64:80
        spec_img(n,j) = 0; 
    end
    for n = 105:110
        spec_img(n,j) = 0; 
    end
    for n = 150:160
        spec_img(n,j) = 0; 
    end
    for n = 190:200
        spec_img(n,j) = 0; 
    end
end

for j = 260:270
    for n = 20:25
        spec_img(n,j) = 0; 
    end
    for n = 64:80
        spec_img(n,j) = 0; 
    end
    for n = 105:110
        spec_img(n,j) = 0; 
    end
    for n = 150:160
        spec_img(n,j) = 0; 
    end
    for n = 190:200
        spec_img(n,j) = 0; 
    end
end

for j = 340:350
    for n = 20:25
        spec_img(n,j) = 0; 
    end
    for n = 64:80
        spec_img(n,j) = 0; 
    end
    for n = 105:110
        spec_img(n,j) = 0; 
    end
    for n = 150:160
        spec_img(n,j) = 0; 
    end
    for n = 190:200
        spec_img(n,j) = 0; 
    end
end
%// Change
ptnfx = real(ifft2(ifftshift(spec_img)));

ptnfx = uint8(ptnfx); % convet to uint from double
  figure(3);imshow(ptnfx,[]);
  figure(4);imshow(distorted_image, []);
   
 errPat1   = immse(original_image, distorted_image); 
 fprintf('\n The mean-squared error is %0.4f\n', errPat1);
 
 errPat2   = immse(ptnfx, original_image); 
 fprintf('\n The mean-squared error is %0.4f\n', errPat2);
 
 
%FFT Show

 I = imread('Penguin.bmp'); % Read Image
k = fspecial('gaussian', [3,3], 3);
img = imfilter(I,k);

imshow(img);
