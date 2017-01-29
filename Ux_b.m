function x = Ux_b(U, b)
% Compute the vector x such that U*x = b
% for given U and b values
% U: Upper triangular matrix (nxn)
% b: vector (nx1)
% x: vector (nx1)
% U*x = b

% determine 'n' - # of rows/columns of U
U_dimensions = size(U);
n = U_dimensions(1);

% initialize x to appropriate value
x = zeros(n, 1);

% compute x(n)
x(n) = b(n) / U(n, n);

% compute x(n-1) - x(1)
for k = 1:(n-1) %outer loop
   
    % reversed loop counter (i = n-1:1)
    i = n - k;
    
    sum = 0; %summation variable
    
    for j = (i+1):n %inner loop
       
        sum = sum + U(i, j)*x(j);
    end
    
    % compute x(i) 
    x(i) = (b(i) - sum) / U(i, i);
    
end

end %end - Ux_b
