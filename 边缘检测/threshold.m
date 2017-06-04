function [ result ] = threshold( k, img )
    
    [m, n] = size(img);
    result = zeros(m, n);
    result = logical(result);
    img = double(img);
    
    for i = 1:m
        for j = 1:n
			% 大等于k的像素值为1，否则为0
            result(i, j) = (img(i, j) > k) || (img(i, j) == k);
        end
    end

end