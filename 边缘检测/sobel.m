function [ result ] = sobel( img )

    img = double(img);
	% 填充图像
    img = fill(1, img);
	% 得到x方向的偏导数
    gx = get_gx(img);
	% 得到y方向的偏导数
    gy = get_gy(img);
	% 得到梯度图像
    result = abs(gx) + abs(gy);
    result = uint8(result);

end

function [ result ] = fill( N, img )

    [m, n] = size(img);
    result = zeros(m+N*2, n+N*2);
    result(1+N:m+N, 1+N:n+N) = img;

end

function [ gx ] = get_gx( img )

    mask = [-1, -2, -1;...
             0,  0,  0;...
             1,  2,  1];
    [m, n] = size(img);
    gx = zeros(m-2, n-2);
    
    for i = 2:m-1
        for j = 2:n-1
            gx(i-1, j-1) = spatial_filter(img(i-1:i+1, j-1:j+1), mask);
        end
    end

end

function [ gy ] = get_gy( img )

    mask = [-1,  0,  1;...
            -2,  0,  2;...
            -1,  0,  1];
    [m, n] = size(img);
    gy = zeros(m-2, n-2);
    
    for i = 2:m-1
        for j = 2:n-1
            gy(i-1, j-1) = spatial_filter(img(i-1:i+1, j-1:j+1), mask);
        end
    end

end

function [ result ] = spatial_filter( region, mask )

    [m, n] = size(region);
    result = 0;
    
    for i = 1:m
        for j = 1:n
            result = result + region(i, j) * mask(i, j);
        end
    end

end