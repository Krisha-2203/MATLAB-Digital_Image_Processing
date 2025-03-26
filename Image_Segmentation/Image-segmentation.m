%Experiment 5 - Image Segmentation 
%Krisha Lakhani - 60001200097
clc;
clear all;
close all;
a = imread("blobs.png");
figure(1);
subplot(3,2,1);
imshow(a);
title("Original");
[x,y,z] = size(a);

%Robert
robertsX = [-1,0,0,1];
robertsY = [0,-1,1,0];
robertsZ = robertsX + robertsY;
for i = 1:x-1
    for j = 1:y-1
        Rrx = a(i,j)*robertsX(1) + a(i,j+1)*robertsX(2) + a(i+1,j)*robertsX(3) + a(i+1,j+1)*robertsX(4);
        Rry = a(i,j)*robertsY(1) + a(i,j+1)*robertsY(2) + a(i+1,j)*robertsY(3) + a(i+1,j+1)*robertsY(4);
        Rrz = a(i,j)*robertsZ(1) + a(i,j+1)*robertsZ(2) + a(i+1,j)*robertsZ(3) + a(i+1,j+1)*robertsZ(4);
        Gx(i, j) = Rrx;
        Gy(i, j) = Rry;
        Gz(i, j) = Rrz;
    end
end
subplot(3,2,3);
imshow(Gx);
title("Gx after Roberts filter");
subplot(3,2,4);
imshow(Gy);
title("Gy after Roberts filter");
subplot(3,2,5);
imshow(Gz);
title("Gz after Roberts filter");

%Krisha Lakhani - 60001200097
%Prewitt
a = imread("blobs.png");
figure(2);
subplot(3,2,1);
imshow(a);
title("Original");
[x,y,z] = size(a);
prewittX = [-1,0,1,-1,0,1,-1,0,1];
prewittY = [-1,-1,-1,0,0,0,1,1,1];
prewittZ = prewittX + prewittY;
for i = 2:x-2
    for j = 2:y-2
        Prx = a(i-1,j-1,1)*prewittX(1) + a(i-1,j,1)*prewittX(2) + a(i-1,j+1,1)*prewittX(3) + a(i,j-1,1)*prewittX(4) + a(i,j,1)*prewittX(5) + a(i,j+1,1)*prewittX(6) + a(i+1,j-1,1)*prewittX(7) + a(i+1,j,1)*prewittX(8) + a(i+1,j+1,1)*prewittX(9);
        Pry = a(i-1,j-1,1)*prewittY(1) + a(i-1,j,1)*prewittY(2) + a(i-1,j+1,1)*prewittY(3) + a(i,j-1,1)*prewittY(4) + a(i,j,1)*prewittY(5) + a(i,j+1,1)*prewittY(6) + a(i+1,j-1,1)*prewittY(7) + a(i+1,j,1)*prewittY(8) + a(i+1,j+1,1)*prewittY(9);
        Prz = a(i-1,j-1,1)*prewittZ(1) + a(i-1,j,1)*prewittZ(2) + a(i-1,j+1,1)*prewittZ(3) + a(i,j-1,1)*prewittZ(4) + a(i,j,1)*prewittZ(5) + a(i,j+1,1)*prewittZ(6) + a(i+1,j-1,1)*prewittZ(7) + a(i+1,j,1)*prewittZ(8) + a(i+1,j+1,1)*prewittZ(9);
        Gx(i, j) = Prx;
        Gy(i, j) = Pry;
        Gz(i, j) = Prz;
    end
end
subplot(3,2,3);
imshow(Gx);
title("Gx after Prewitt filter");
subplot(3,2,4);
imshow(Gy);
title("Gy after Prewitt filter");
subplot(3,2,5);
imshow(Gz);
title("Gz after Prewitt filter");

%Krisha Lakhani - 60001200097
%Sobel
a = imread("blobs.png");
figure(3);
subplot(3,2,1);
imshow(a);
title("Original");
[x,y,z] = size(a);
sobelX = [-1,0,1,-2,0,2,-1,0,1];
sobelY = [-1,-2,-1,0,0,0,1,2,1];
sobelZ = sobelX + sobelY;
for i = 2:x-2
    for j = 2:y-2
        Srx = a(i-1,j-1,1)*sobelX(1) + a(i-1,j,1)*sobelX(2) + a(i-1,j+1,1)*sobelX(3) + a(i,j-1,1)*sobelX(4) + a(i,j,1)*sobelX(5) + a(i,j+1,1)*sobelX(6) + a(i+1,j-1,1)*sobelX(7) + a(i+1,j,1)*sobelX(8) + a(i+1,j+1,1)*sobelX(9);
        Sry = a(i-1,j-1,1)*sobelY(1) + a(i-1,j,1)*sobelY(2) + a(i-1,j+1,1)*sobelY(3) + a(i,j-1,1)*sobelY(4) + a(i,j,1)*sobelY(5) + a(i,j+1,1)*sobelY(6) + a(i+1,j-1,1)*sobelY(7) + a(i+1,j,1)*sobelY(8) + a(i+1,j+1,1)*sobelY(9);
        Srz = a(i-1,j-1,1)*sobelZ(1) + a(i-1,j,1)*sobelZ(2) + a(i-1,j+1,1)*sobelZ(3) + a(i,j-1,1)*sobelZ(4) + a(i,j,1)*sobelZ(5) + a(i,j+1,1)*sobelZ(6) + a(i+1,j-1,1)*sobelZ(7) + a(i+1,j,1)*sobelZ(8) + a(i+1,j+1,1)*sobelZ(9);
        Gx(i, j) = Srx;
        Gy(i, j) = Sry;
        Gz(i, j) = Srz;
      end
end   
subplot(3,2,3);
imshow(Gx);
title("Gx after Sobel filter");
subplot(3,2,4);
imshow(Gy);
title("Gy after Sobel filter");
subplot(3,2,5);
imshow(Gz);
title("Gz after Sobel filter");