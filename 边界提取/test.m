img = imread('Fig0914(a)(licoln from penny).tif');
img = double(img);

img = extract(img)

img = logical(img);
imshow(img);