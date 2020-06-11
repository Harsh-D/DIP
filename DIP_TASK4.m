clc;clear;close all;
img = imread('img1.jpg');
[m,n] = size(img);
cimg = [zeros(m,1),img,zeros(m,1)];
rimg = [zeros(1,n+2);cimg;zeros(1,n+2)];
fimg = uint8(zeros(m,n));
for i = 2:m
    for j = 2:n
        fimg(i-1,j-1) = get_val(i,j,rimg);
    end
end
subplot(121)
imshow(img)
title('Original Image');
subplot(122)
imshow(fimg)
title('Modified image')



function val = get_val(i,j,in_img)
im = zeros(1,8);
if in_img(i,j) < in_img(i,j+1)   im(1) = 1;else im(1) = 0;end
if in_img(i,j) < in_img(i-1,j+1) im(2) = 1;else im(2) = 0;end
if in_img(i,j) < in_img(i-1,j)   im(3) = 1;else im(3) = 0;end
if in_img(i,j) < in_img(i-1,j-1) im(4) = 1;else im(4) = 0;end
if in_img(i,j) < in_img(i,j-1)   im(5) = 1;else im(5) = 0;end
if in_img(i,j) < in_img(i+1,j-1) im(6) = 1;else im(6) = 0;end
if in_img(i,j) < in_img(i+1,j)   im(7) = 1;else im(7) = 0;end
if in_img(i,j) < in_img(i+1,j+1) im(8) = 1;else im(8) = 0;end
val = bi2de(im);
end