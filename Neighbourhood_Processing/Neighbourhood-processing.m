%Experiment 3 - Image Enhancement Neighbourhood Processing

%Krisha Lakhani - 60001200097
%Salt and Pepper 
a = imread('cameraman.tif');
size(a);
b = imnoise(a, "salt & pepper");
figure(1);
imshow(b);
title('Image with Salt and Pepper noise');
for i = 2:255
    for j = 2:255
        arr = [b(i-1, j-1), b(i-1, j), b(i-1, j+1), b(i, j-1), b(i, j), b(i, j+1), b(i+1, j-1),b(i+1, j),b(i+1, j+1)];
        M = median(arr);
        b(i,j) = M;
    end
end
figure(2);
imshow(b);
title('Median Filter');

%Krisha Lakhani - 60001200097
%Gaussian 
c = imread('cameraman.tif');
size(c);
d = imnoise(c, "gaussian");
figure(3);
imshow(d);
title('Image with Guassian noise');
for i = 2:255
    for j = 2:255
        arr = [d(i-1, j-1), d(i-1, j), d(i-1, j+1), d(i, j-1), d(i, j), d(i, j+1), d(i+1, j-1),d(i+1, j),d(i+1, j+1)];
        A = mean(arr);
        d(i,j) = A;
    end
end
figure(4);
imshow(d);
title('Average Filter');

%Krisha Lakhani - 60001200097
%HPF
e = imread('cameraman.tif');
f = double(e);
figure(5);
imshow(e);
title('Original Image');
for i = 2:255
    for j = 2:255
        arr = [0,1,0,1,-4,1,0,1,0];
        newi(i,j) = f(i-1, j-1)*arr(1) + f(i-1, j)*arr(2) + f(i-1, j+1)*arr(3)+f(i, j-1)*arr(4) + f(i, j)*arr(5) + f(i, j+1)*arr(6) + f(i+1, j-1)*arr(7) + f(i+1, j)*arr(8) + f(i+1, j+1)*arr(9);
    end
end
figure(6);
imshow(uint8(newi));
title('High Pass Filter');

