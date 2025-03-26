%Experiment 6 - Image Segmentation (converting coloured to gray)
%Krisha Lakhani - 60001200097
clc
clear all;
image = imread('lighthouse.png');
image = rgb2gray(image); 
figure(1);
imshow(image);
title("Original Image");
seed = ginput(1); 
threshold = 5; 
segmented_image = false(size(image));
[rows, cols] = size(image);
queue = zeros(rows * cols, 2);
queueSize = 0;
segmented_image(seed(1), seed(2)) = true;
queueSize = queueSize + 1;
queue(queueSize, :) = seed;
neighborhood = [-1, 0; 1, 0; 0, -1; 0, 1];
while queueSize > 0
    currentPixel = queue(queueSize, :);
    queueSize = queueSize - 1;
    for i = 1:size(neighborhood, 1)
        neighbor = currentPixel + neighborhood(i, :);
        if neighbor(1) >= 1 && neighbor(1) <= rows && neighbor(2) >= 1 && neighbor(2) <= cols
            if ~segmented_image(neighbor(1), neighbor(2)) && abs(image(neighbor(1), neighbor(2)) - image(currentPixel(1), currentPixel(2))) <= threshold
                segmented_image(neighbor(1), neighbor(2)) = true;
                queueSize = queueSize + 1;
                queue(queueSize, :) = neighbor;
            end
        end
    end
end
figure(2);
imshow(segmented_image);
title("Region Growing");