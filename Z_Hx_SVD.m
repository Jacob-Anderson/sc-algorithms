function x = Z_Hx_SVD(Z, H)
% Compute the vector x such that H*x = Z
% for given H and Z values 
% using SVD decomposition
% H: Matrix (mxn)
% Z: Vector (mx1)
% x: Vector (nx1)
% H*x = Z

% decompose H into U, L, and V matrices
[U, L, V] = svd_decomposition(H);

% return xls solution
x = V*L^(-1/2)*U.'*Z;

end %end - Z_Hx_SVD

