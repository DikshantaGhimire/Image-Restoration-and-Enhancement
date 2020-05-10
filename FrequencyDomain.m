distorted_image  = imread('Penguin.bmp');
original_image  = imread('PenguinOriginal.bmp');



%Section 1: applying FFT algorithm 
fft_img = fft2(distorted_image); % apply the fast fourier transform algoritm to the image 
center_fft  = fftshift(fft_img);  % shifting zeoro- intensity values to the centre array 
figure(1);
imshow(log(1 + abs(center_fft)),[]); % inchances images for dark pixel values
impixelinfo

% Section 2: changing the pixel values of peaks into 0,0
% each of the pixel values in the FT spectrums is manuall 
% changed below  using impixelinfo


for m1 = 35:45
    for m2 = 20:25
        center_fft(m2,m1) = 0; 
    end
    for m2 = 64:80
        center_fft(m2,m1) = 0; 
    end
    for m2 = 105:110
        center_fft(m2,m1) = 0; 
    end
    for m2 = 150:160
        center_fft(m2,m1) = 0; 
    end
    for m2 = 190:200
        center_fft(m2,m1) = 0; 
    end
end

for m1 = 110:120
    for m2 = 20:25
        center_fft(m2,m1) = 0; 
    end
    for m2 = 64:80
        center_fft(m2,m1) = 0; 
    end
    for m2 = 105:110
        center_fft(m2,m1) = 0; 
    end
    for m2 = 150:160
        center_fft(m2,m1) = 0; 
    end
    for m2 = 190:200
        center_fft(m2,m1) = 0; 
    end
end

for m1 = 260:270
    for m2 = 20:25
        center_fft(m2,m1) = 0; 
    end
    for m2 = 64:80
        center_fft(m2,m1) = 0; 
    end
    for m2 = 105:110
        center_fft(m2,m1) = 0; 
    end
    for m2 = 150:160
        center_fft(m2,m1) = 0; 
    end
    for m2 = 190:200
        center_fft(m2,m1) = 0; 
    end
end

for m1 = 340:350
    for m2 = 20:25
        center_fft(m2,m1) = 0; 
    end
    for m2 = 64:80
        center_fft(m2,m1) = 0; 
    end
    for m2 = 105:110
        center_fft(m2,m1) = 0; 
    end
    for m2 = 150:160
        center_fft(m2,m1) = 0; 
    end
    for m2 = 190:200
        center_fft(m2,m1) = 0; 
    end
end
%Section 3: Inverse all FFT functions 

%imshow(center_fft);

inverse_fft = ifft2(ifftshift(center_fft)); %FT images are invered back to an image 
final_img = real(inverse_fft);
final_img = uint8(final_img); % convet to uint from double

figure(3);imshow(final_img,[]);
figure(4);imshow(distorted_image,[]); % display the image.

%Compare the image using Average Mean Square Error    
 final_distorted  = immse(original_image, original_image); 
 fprintf('\n The mean-squared error of the Original image is %0.4f\n', final_distorted);
 
 final_org   = immse(original_image, distorted_image); 
 fprintf('\n The mean-squared error of the Distorted image is %0.4f\n', final_org);
 
 final_org   = immse(original_image, final_img); 
 fprintf('\n The mean-squared error of the Filtered Image image is %0.4f\n', final_org);
 
 
 
 

