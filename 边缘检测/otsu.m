function [ threshold ] = otsu( img )

    img = double(img);
	% 得到直方图
    histProb = histogram(img);
    result = zeros(1, 256);

    for i = 1:256
		% 得到每个k对应的类间方差
        result(i) = getSigmaB(histProb, i-1);
    end

    [~, threshold] = max(result);
	% 得到使类间方差最大的阈值
    threshold = threshold - 1;

end

function [ histProb ] = histogram( img )

    [m, n] = size(img);
    numOfPixel = m * n * 1.0;
    histProb = zeros(1, 256);
    
    for i = 1:m
        for j = 1:n
            histProb(img(i, j) + 1) = histProb(img(i, j) + 1) + 1;
        end
    end
    
    histProb = histProb / numOfPixel;

end

function [ pK, m ] = getPM( histProb, from, to )

    if from == 256
        pK = 0;
        m = 0;
        return;
    end

    pK = sum(histProb(from+1:to+1));
    temp = 0.0;
    
    for i = from+1:to+1
        temp = temp + (i-1) * histProb(i);
    end
    
    m = temp / pK;

end

function [ sigma ] = getSigmaB( histProb, k )

    [p1, m1] = getPM( histProb, 0, k);
    [p2, m2] = getPM( histProb, k+1, 255);
    sigma = p1 * p2 * ((m1 - m2)^2);

end