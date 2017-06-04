function [ output ] = extract( pic )

    struct = ones(3, 3);
	
	% 腐蚀图像
    erode_pic = erode(pic, struct);
	% 两幅图像相减
    output = difference(pic, erode_pic);

end