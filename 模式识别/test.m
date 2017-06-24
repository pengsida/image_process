img = imread('Fig1218(airplanes).tif');
[img1, img2, img3, img4] = getImage(img);

% figure;
% imshow(img1);
% figure;
% imshow(img2);

[boundary1, boundary2, img5, img6] = boundary(img1, img2,img3, img4);

% figure;
% imshow(boundary1);                         %??????a1?????
% figure;
% imshow(boundary2);                         %??????a2?????

P = 12;
[boundary3, boundary4, x1, x2] = fourier(img1, img2, img5, img6, P);

figure;
imshow(boundary3);                         %??????a1?????
figure;
imshow(boundary4);                         %??????a2?????

[train1, train2, test1, test2] = noise(x1, x2, P);