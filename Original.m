pat1 = imread('Penguin.bmp');
pat2original = imread('PenguinOriginal.bmp');


%// Change
spec_orig = fft2(double(pat1)); 
spec_img = fftshift(spec_orig);
figure(1);
imshow(log(1 + abs(spec_img)),[]);
impixelinfo





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
  figure(4);imshow(pat1, []);
   
 errPat1   = immse(pat2original, pat1); 
 fprintf('\n The mean-squared error is %0.4f\n', errPat1);
 
 errPat2   = immse(ptnfx, pat2original); 
 fprintf('\n The mean-squared error is %0.4f\n', errPat2);
 
 

