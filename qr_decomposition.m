function [Q, R] = qr_decomposition(H)
% Decompose a given matrix into upper 
% triangular and orthogonal matrix components
% using a modified Gram-Schmidt algorithm
% H: Matrix (mxn)
% Q: Orthogonal Matrix (mxn)
% R: Upper triangular matrix (nxn)
% H = Q*R

% determine 'm' & 'n' from H 
[m, n] = size(H);
 
% initialize Q and R to appropriate values
Q = zeros(m, n);
R = zeros(n, n);

% initialize V to H
V = H;

for j = 1:n %outer loop
   
   % compute jth diagonal of R - norm of Vj
   R(j, j) = norm(V(:,j));
   
   % compute jth column of Q
   Q(:,j) = V(:,j) / R(j, j);
   
   for i = (j+1):n %inner loop 
      
       % compute R(j,i) - inner product
       R(j, i) = Q(:,j).'*V(:,i);
       
       % compute ith column of V
       V(:,i) = V(:,i) - R(j,i)*Q(:,j);
   
   end %end - inner loop 
   
end %end - outer loop

end %end - qr_decomposition
