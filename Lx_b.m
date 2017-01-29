function x = Lx_b(L, b)
% Compute the vector x such that L*x = b
% for given L and b values
% L: Lower triangular matrix (nxn)
% b: vector (nx1)
% x: vector (nx1)
% L*x = b

% determine 'n' - # of rows/columns of L
L_dimensions = size(L);
n = L_dimensions(1);

% initialize x to appropriate value
x = zeros(n, 1);

% compute x(1)
x(1) = b(1) / L(1, 1);

% compute x(2) - x(n)
for i = 2:n %outer loop
    
    sum = 0; %summation variable
    
    for j = 1:(i-1) %inner loop
      
        sum = sum + L(i, j)*x(j); 
    end
    
    % compute x(i)
    x(i) = (b(i) - sum) / L(i, i);
end

end %end - Lx_b
