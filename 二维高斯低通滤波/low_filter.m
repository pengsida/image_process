function [img] = low_filter( img, D0 )
%LOW_FILTER Summary of this function goes here
%   Detailed explanation goes here

% 用零填充图像
img = fill(img);
% 将图像移到(P/2, Q/2)这个中心
img = shift(img);
% 将图像进行傅立叶变换
img = fft2(img);
% 显示图像的频谱
imshow(log(1+abs(img)), []);

% 获得高斯低通滤波器
H = GLPF(img, D0);
% H = GHPF(img, D0);

% 在频率域用高斯低通滤波器处理图像
img = img.*H;

% 对图像进行IDFT
img = ifft2(img);
% 获得图像的实部
img = real(img);
% 将图像中心移回原处
img = shift(img);
% 截取图像的左上象限
img = cut(img);
figure
% 显示图像
imshow(uint8(img));
% imshow(img,[]);

end

function [img] = fill(img)

[m, n] = size(img);
% img = [img, zeros(m, n)];
% img = [img; zeros(m, 2*n)];
temp = zeros(m*2, n*2);
temp(1:m, 1:n) = img;
img = temp;

end

function [img] = cut(img)

[m, n] = size(img);
img = img(1:m/2, :);
img = img(:, 1:n/2);

end

function [img] = shift(img)

[m, n] = size(img);
for i = 1:1:m
    for j = 1:1:n
    img(i, j) = (-1)^(i+j-2)*img(i, j);
    end
end

end

function [H] = GLPF(img, D0)

[P, Q] = size(img);
H = zeros(P,Q);
const = 2*D0*D0;

for i = 1:1:P
    for j = 1:1:Q
        H(i, j) = exp(-distance(i, j, P, Q)/const);
    end
end

end

function [H] = GHPF(img, D0)

[P, Q] = size(img);
H = ones(P,Q) - GLPF(img, D0);

end

function [D] = distance(u, v, P, Q)

D = (u-P/2)^2 + (v-Q/2)^2;
D = double(D);

end