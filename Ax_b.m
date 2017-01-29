function x = Ax_b(A, b)
% Compute the vector x such that A*x = b
% for given A and b values
% A: Non-singular matrix (nxn)
% b: vector (nx1)
% x: vector (nx1)
% A*x = b

% determine 'n' - # of rows/columns of A
A_dimensions = size(A);
n = A_dimensions(1);

% initialize x to appropriate value
x = zeros(n, 1);

% determine if A is positive definite
[~, pd] = chol(A);
pd = ~pd;

% determine if A is symmetric
s = issymmetric(A);

% if A is SPD, use cholesky decomposition
if s && pd
   
    L = cholesky_decomposition(A);
    U = L';
   
% if A is not SPD, use LU decomposition
else
    
    [L, U] = LU_decomposition(A);
end

% calculate U*x using Lx_b
Ux_calc = Lx_b(L, b);

% calculate x using Ux_b
x = Ux_b(U, Ux_calc);

end %end - Ax_b
