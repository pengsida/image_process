% test.m
img = imread('Fig0235(c)(kidney_original).tif');
% 平滑图像
img = smooth(3, img);
% 使用sobel算子计算梯度图像
result = sobel(img);
% 使用otsu算法计算最佳阈值
k = otsu(result)
% 阈值化图像
result = threshold(k, result);
imshow(result);