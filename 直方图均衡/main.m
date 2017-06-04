% 图像文件名称
filename='Fig0308_a.tif';
% 图像灰度级
L = 256;
% 读取图像
img = imread(filename);
% 显示原图
% imshow(img)
[M, N] = size(img);
n = zeros(1, L);
s = zeros(M, N);
% 获得原图中各像素值的个数
for index = 0:L-1
    temp = find(img == index);
    n(index+1) = length(temp);
end
% 显示原图的直方图
figure
plot([0:L-1], n, '.');
hold on;
for index = 1:L
    plot([index-1,index-1],[0,n(index)]);
end
% 根据公式进行直方图均衡，得到目标图像
for index_row = 1:M
    for index_col = 1:N 
        value = img(index_row, index_col);
        s(index_row,index_col) = sum(n(1:value+1))*(L-1)/(M*N);
    end
end
s = uint8(s);
% 获得输出图像中各像素值的个数
for index = 0:L-1
    temp = find(s == index);
    n(index+1) = length(temp);
end
% 显示输出图像的直方图
figure
plot([0:L-1], n, '.');
hold on;
for index = 1:L
    plot([index-1,index-1],[0,n(index)]);
end
figure
% 显示输出图像
% imshow(s);
% 保存输出图像
imwrite(s,'result.tif');