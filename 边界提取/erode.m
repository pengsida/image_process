function [ output ] = erode( pic, struct )

    [m, n] = size(pic);
	% 填充边界
    pic = fill(pic);
    output = zeros(m, n);
    
    for i = 1:m
        for j = 1:n
            pic_i = i + 1;
            pic_j = j + 1;
			% 对像素点进行腐蚀操作
            output(i, j) = real_erode(pic(pic_i-1:pic_i+1, pic_j-1:pic_j+1), struct);
        end
    end

end

function [ pixel ] = real_erode(region, struct)
	% 只有结构元的阴影部分与图像区域全部相等时，返回像素才会为阴影区域1
    for i = 1:3
        for j = 1:3
            if struct(i, j) == 1 && region(i, j) ~= 1
                pixel = 0;
                return;
            end
        end
    end
    pixel = 1;
end

function [ pic ] = fill( pic )
    [m, n] = size(pic);
    pic = [zeros(1, n); pic; zeros(1, n)];
    pic = [zeros(m+2, 1), pic, zeros(m+2, 1)];
end