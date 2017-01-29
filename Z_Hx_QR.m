function x = Z_Hx_QR(Z, H)
% Compute the vector x such that H*x = Z
% for given H and Z values
% using QR decomposition in the
% overdetermined case (m > n)
% H: Matrix (mxn)
% Z: Vector (mx1)
% x: Vector (nx1)
% H*x = Z

% decompose H into Q_1 and R_1 matrices
[Q_1, R_1] = qr_decomposition(H);

% return xls solution using upper triangular function
% that was written for the previous homework
x = Ux_b(R_1, Q_1.'*Z);

end %end - Z_Hx_QR

