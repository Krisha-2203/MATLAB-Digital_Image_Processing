% Experiment 4 - Image Enhancement Histogram Equalization
% Krisha Lakhani - 60001200097

clc;
a = imread("pout.tif");
figure(1);
imshow(a);
title('Original Picture');
% Calculate histogram
[count, ~] = imhist(a);
nr = sum(count);
pdf = double(count) / nr;
% Calculate CDF
cdf = cumsum(pdf);
% Normalize CDF
cdf_normalized = (cdf - min(cdf)) / (max(cdf) - min(cdf));
% Map intensity values
f = round(cdf_normalized * 255);
% Calculate new grayscale levels
ngl = zeros(1, 256);
for i = 1:255
    ngl(i) = count(i) + ngl(i + 1);
    if f(i+1) == f(i)
        ngl(i) = ngl(i) + count(i+1);
    end
end
% Plot histogram of equalized image
figure(2);
subplot(1, 2, 1);
histogram(a);
title('Original Image Histogram');
subplot(1, 2, 2);
histogram(f(a + 1), 'BinLimits', [0, 255]); % Adjust index by +1
title('Equalized Image Histogram');
% Apply histogram equalization to the original image
changed_image = zeros(size(a), 'uint8');
for i = 1:size(a, 1)
    for j = 1:size(a, 2)
        changed_image(i, j) = f(a(i, j) + 1); % Adjust index by +1
    end
end
% Display the equalized image
figure(3);
imshow(changed_image);
title('Changed Image');