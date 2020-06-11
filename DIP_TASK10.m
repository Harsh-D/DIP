clc; clear;close all;
%Get the input vector
vec = randi([0 1],1,100);
st = sprintf('%d', vec);
fprintf("Original Input String: %s\n",st);

d = func_RLE(vec);
len_out = length(d);
len_ip = length(vec);

%Check for compression ratio
if (len_out / len_ip) <1
    fprintf('Positive Compression ratio = %.2d\n', len_out / len_ip)
else
    fprintf('Negative compression.')
end



function d = func_RLE(x)
 ind=1;
 d(ind,1)=x(1);
 d(ind,2)=1;
 for i=2 :length(x)
    if x(i-1)==x(i)
       d(ind,2)=d(ind,2)+1;
    else ind=ind+1;
         d(ind,1)=x(i);
         d(ind,2)=1;
    end
 end
end