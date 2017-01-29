function [U, L, V] = svd_decomposition(H)
% Decompose a given matrix into eigen values,
% eigen vectors, and U matrices
% H: Matrix (mxn)
% U: Matrix (mxn)
% L: diagonal matrix of eigen values (nxn)
% V: eigen vector matrix (mxn)
% H = U * L^(1/2) * V^(T)

%determine 'm' & 'n' from H 
[m, n] = size(H);
 
%initialize U to appropriate value
U = zeros(m, n);

% compute eigen values and vectors of (H^T)H (Grammian)
[V, L] = eig(H.'*H);

for i = 1:n

    % compute Ui values
    U(:,i) = (1 / (L(i, i)^(1/2)))*H*V(:,i);    
end

end %end - svd_decomposition