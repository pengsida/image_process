function [ img1, img2, img3, img4 ] = getImage( img )

    img1 = zeros(695, 500);
    img2 = zeros(695, 500);
    img3 = zeros(695, 500);
    img4 = zeros(695, 500);

    for m=1:695                        %??????a1??
        for n=1:500
            img1(m,n) = img(m+80,n+15);
            img3(m,n) = ~img(m+80,n+15);
        end
    end

    for m=1:695                        %??????a2??
        for n=1:500
            img2(m,n) = img(m+80,n+690);
            img4(m,n) = ~img(m+80,n+690);
        end
    end

end

