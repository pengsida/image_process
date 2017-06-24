function [ g3, g4, x1, x2 ] = fourier( i1, i2, i5, i6, P )
    
    [M1,N1] = size(i1);                  %????a1??????
    [M2,N2] = size(i2);                  %????a2??????
    n1 = size(i5,1);                     %????a1?????
    n2 = size(i6,1);                     %????a2?????

    if P >= n1
        P = n1;
    end
    
    n3 = (n1-P)/2;
    
    a1 = zeros(1, n1);
    s = zeros(1, n1);
    
    for n = 0:n1-1                        %????a1???????
        for m = 0:n1-1
            a1(n+1) = a1(n+1) + (i5(n1-m,1) + j*i5(n1-m,2)) * exp(-j*2*pi*n*m/n1);
        end
    end
    
    for n = 0:n1-1                        %????a1???????????
        for m = 0:(1006-n3)
            s(n+1) = s(n+1)+1/n1*a1(m+1) * exp(j*2*pi*m*n/n1);
        end
        
        for m = (1007+n3):n1-1
            s(n+1) = s(n+1)+1/n1*a1(m+1) * exp(j*2*pi*m*n/n1);
        end
    end

    g3 = zeros(M1,N1);
    s1 = zeros(1, n1);
    s2 = zeros(1, n1);
    for n = 1:n1
        s1(n) = real(s(n));               %??????a1?????????
        s2(n) = imag(s(n));               %??????a1?????????
        g3(round(real(s(n))),round(imag(s(n))))=1;   %??????a1????
    end
    
    x1 = zeros(1, P);
    for n=0:(1006-n3)                   %????????a1?????????
        x1(n+1) = a1(n+1);
    end
    
    for n = (1007+n3):n1-1
        x1(n-n1+P+1) = a1(n+1);
    end
    
    n4 = (n2-1-P)/2;
    a2 = zeros(1,n2);
    s = zeros(1,n2);
    
    for n = 0:n2-1                        %????a2???????
       for m = 0:n2-1
        a2(n+1) = a2(n+1) + (i6(n2-m,1)+j*i6(n2-m,2)) * exp(-j*2*pi*n*m/n2);
        end
    end
    
    for n = 0:n2-1                        %????a2???????????
        for m = 0:(854-n4)
            s(n+1) = s(n+1)+1/n2*a2(m+1) * exp(j*2*pi*m*n/n2);
        end
        for m = (856+n4):n2-1
            s(n+1) = s(n+1)+1/n2*a2(m+1) * exp(j*2*pi*m*n/n2);
        end
    end
    
    g4 = zeros(M2,N2);
    for n = 1:n2
        s1(n) = real(s(n));               %??????a2?????????
        s2(n) = imag(s(n));               %??????a2?????????
        g4(round(real(s(n))),round(imag(s(n)))) = 1;   %??????a2????
    end
    
    x2 = zeros(1, P);
    for n = 0:(854-n4)                    %????????a2?????????
        x2(n+1) = a2(n+1);
    end
    
    for n = (856+n4):n2-1
        x2(n-n2+P+1) = a2(n+1);
    end


end

