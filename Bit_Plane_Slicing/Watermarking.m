%Experiment 2: Watermarking
%Krisha Lakhani - 60001200097
clc;
clear all;

a = imread('cameraman.tif');
f1 = figure;
b = a;

%%Original Image%%
f1 = imshow(a)
title('Original Image')

%%Watermark Resizing%%
I = imread('C:\Users\djsce.student\Downloads\sap_pic_white.png');
m = imresize(I,[256,256])
f2 = figure;
f2 = imshow(m)
title('Watermark')

%%Watermark using bit plane slicing%%
b=a;
% [k,l] = size(a)
for i=1:1:256
    for j= 1:1:256
        k = b(i,j);
        l = m(i,j);
        bb = dec2bin(k);
        wm = dec2bin(l,7);
        bb(1) = wm(4);
        bb(2) = wm(5);
        bb(3) = wm(6);
        k = bin2dec(bb);
        b(i,j) = k;
    end
end
f3 = figure;
f3 = imshow(b)
title('Watermark using bit plane slicing')