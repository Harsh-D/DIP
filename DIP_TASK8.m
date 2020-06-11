% Using Sobel, canny Filter and dwt2
im = rgb2gray(imread('ironman.jpg'));

subplot(311)
imshow(im)
title('Original')
ed = edge(im,'sobel');
ed1 = edge(im,'canny');
subplot(312)
imshow(ed)
title('Using Sobel Filter')
subplot(313)
imshow(ed1)
title('Using Canny Filter')