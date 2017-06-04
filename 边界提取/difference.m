function [ output ] = difference( A, B )
    
    output = A - B;
    output = logical(output);

end