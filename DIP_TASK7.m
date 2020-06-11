clc;clear;close all;
%Taking a sample image matrix
img = [13 15 17 19; 12 21 20 10; 17 11 21 19; 21 24 23 12];

%Taking the kernal to be mapped with image
kernel = [2 7 6 2; 4 4 3 2; 0 1 0 2; 3 7 6 1];
kernel1 = kernel;
[m,n] = size(img);
%Padding 256 around the image
cimg = [256*ones(m,1),img,256*ones(m,1)];
rimg = [256*ones(1,n+2);cimg;256*ones(1,n+2)];
cker = [256*ones(m,1),kernel,256*ones(m,1)];
rker = [256*ones(1,n+2);cker;256*ones(1,n+2)];
%Implementing Toboggan algo
for i = 2:m+1
    for j = 2:n+1
        kernel(i-1,j-1) = tob_pix(i,j,rimg,rker);
    end
end


function val = tob_pix(i,j,img,ker)
%Creating a vector of surrouding pixels
m = [img(i,j) img(i,j+1) img(i+1,j+1) img(i+1,j) img(i+1,j-1) img(i,j-1) ...
    img(i-1,j-1) img(i-1,j) img(i-1,j+1)];
%Finding minimum of them to replace its mapped values in image
mn = min(m);
p = find(m == mn);
%Replacing the value
if p == 1
    val = ker(i,j);
elseif p == 2
    val = ker(i,j+1);
elseif p == 3
    val = ker(i+1,j+1);
elseif p == 4
    val = ker(i+1,j);
elseif p == 5
    val = ker(i+1,j-1);
elseif p == 6
    val = ker(i,j-1);
elseif p == 7
    val = ker(i-1,j-1);
elseif p == 8
    val = ker(i-1,j);
elseif p == 9
    val = ker(i-1,j+1);
end
end