function [L, U] = LU_decomposition(A)
% Decompose a given square matrix into lower 
% triangular and upper triangular components
% A: Non-singular matrix (nxn)
% L: Lower triangular matrix (nxn) w/ 1's on diagonal
% U: Upper triangular matrix (nxn)
% A = L*U

% determine 'n' - # of rows/columns of A
A_dimensions = size(A);
n = A_dimensions(1);

% intialize L, U to appropriate values
L = eye(n);
U = zeros(n);

% compute L and U
for r = 1:n %outer loop
   
    % recover rows of U
    for i = r:n  %1st middle loop
        
        sum = 0; %summation variable
        
        for j = 1:(r-1) %1st inner loop
            
            sum = sum + L(r, j)*U(j, i);    
        end
        
        % update U[r][i]
        U(r, i) = A(r, i) - sum; 
    end
    
    % recover columns of L
    for i = (r+1):n %2nd middle loop
       
        sum = 0; %summation variable
        
        for j = 1:(r-1) %2nd inner loop
            
           sum = sum + L(i, j)*U(j, r);
        end
        
        % update L[i][r]
        L(i, r) = (A(i, r) - sum) / U(r, r); 
    end
end

end %end - LU_decomposition
