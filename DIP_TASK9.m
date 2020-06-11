ker_hp = [-1 -1 -1;-1 8 -1;-1 -1 -1];
ker_lp = 1/9 * [1 1 1;1 1 1;1 1 1];
img = rgb2gray(imread('neon_ring.jpg'));

subplot(311)
imshow(img)
title('Original Image')

hp = imfilter(img,ker_hp);
lp = imfilter(img,ker_lp);

subplot(312)
imshow(hp)

title('HPF image')
subplot(313)

imshow(lp)
title('LPF image')