% Experiment 4 - Image Enhancement Histogram Equalization
% Krisha Lakhani - 60001200097

clc;
% Step 1: Load the image
image = imread('pout.tif');
% Step 2: Display the original image
subplot(2, 3, 1);
imshow(image);
title('Original Image');
% Step 3: Compute the histogram
hist_original = imhist(image);
% Step 4: Display the original image's histogram
subplot(2, 3, 4);
bar(hist_original, 'k');
title('Original Image Histogram');
% Step 5: Perform Histogram Equalization
equalized_image = histeq(image);
% Step 6: Display the enhanced image
subplot(2, 3, 2);
imshow(equalized_image);
title('Enhanced Image');
% Step 7: Compute the histogram of the enhanced image
hist_equalized = imhist(equalized_image);
% Display the histogram of the enhanced image
subplot(2, 3, 5);
bar(hist_equalized, 'k');
title('Enhanced Image Histogram');
% Step 8: Apply contrast stretching
min_intensity = min(equalized_image(:));
max_intensity = max(equalized_image(:));
stretched_image = uint8(255 * double(equalized_image - min_intensity) / (max_intensity - min_intensity));
% Step 9: Display the stretched image
subplot(2, 3, 3);
imshow(stretched_image);
title('Stretched Image');
% Step 10: Compute the histogram of the stretched image
hist_stretched = imhist(stretched_image);
% Display the histogram of the stretched image
subplot(2, 3, 6);
bar(hist_stretched, 'k');
title('Stretched Image Histogram');
% Adjust figure size and layout
set(gcf, 'Position', get(0, 'Screensize'));
sgtitle('Histogram Equalization with Contrast Stretching');
