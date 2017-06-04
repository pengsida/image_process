function [ img ] = smooth( factor, img )
    
    img = double(img);
	% 填充图像
    img = fill((factor-1)/2, img);
	% 平滑图像
    img = mean(factor, img);
    img = uint8(img);

end

function [ result ] = fill( N, img )

    [m, n] = size(img);
    result = zeros(m+N*2, n+N*2);
    result(1+N:m+N, 1+N:n+N) = img;

end

function [ result ] = mean( factor, img )

    mask = ones(factor);
    mask = mask / (factor*factor);
    N = (factor-1) / 2;
    [m, n] = size(img);
    result = zeros(m-2, n-2);
    
    for i = 1+N:m-N
        for j = 1+N:n-N
            result(i-1, j-1) = spatial_filter(img(i-N:i+N, j-N:j+N), mask);
        end
    end

end

% 空间滤波器，输入相应的区域和掩模
function [ result ] = spatial_filter( region, mask )

    [m, n] = size(region);
    result = 0;
    
    for i = 1:m
        for j = 1:n
            result = result + region(i, j) * mask(i, j);
        end
    end

end