function [ img ] = median_filter( img )
%MEDIAN_FILTER Summary of this function goes here
%   Detailed explanation goes here
img = double(img);

img = salt_pepper(img);

[m, n] = size(img);
img = [zeros(m, 1), img, zeros(m, 1)];
img = [zeros(1, n+2); img; zeros(1, n+2)];

for i = 2:m
    for j = 2:n
        num = img(i-1:i+1, j-1:j+1);
        num = reshape(num, [1, 9]);
        img(i, j) = median(num);
    end
end

img = img(2:m, 2:n);

img = uint8(img);

imshow(img);

end

function [ img ] = salt_pepper( img )

pa = 0.1;
pb = 0.1;
img = double(img);
[m, n] = size(img);
total = m * n;
salt = total * pa;
pepper = total * pb;

i = 1;
while i <= salt
    x = randi(m);
    y = randi(n);
    if img(x, y) == 0
        i = i - 1;
    elseif img(x, y) == 255
        i = i - 1;
    else
        img(x, y) = 0;
    end
    i = i + 1;
end

i = 1;
while i <= pepper
    x = randi(m);
    y = randi(n);
    if img(x, y) == 0
        i = i - 1;
    elseif img(x, y) == 255
        i = i - 1;
    else
        img(x, y) = 255;
    end
    i = i + 1;
end

img = uint8(img);

end
