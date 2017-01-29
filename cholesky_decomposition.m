function G = cholesky_decomposition(A)
% Decompose a given SPD matrix into lower 
% triangular and upper triangular components
% where the upper triangular component is the 
% transpose of the lower triangular component
% A: SPD matrix (nxn) 
% G: Lower triangular matrix (nxn)
% A = G*G'

% determine 'n' - # of rows/columns of A
A_dimensions = size(A);
n = A_dimensions(1);

% intialize G to appropriate value
G = zeros(n);

% compute G
for j = 1:n %outer loop
   
    sum = 0; %summation variable

    % compute diagonal of G
    for k = 1:(j-1) %1st middle loop
        
       sum = sum + G(j, k)^2; 
    end
    
    % Update G[j][j]
    G(j, j) = (A(j, j) - sum)^(1/2);
  
    % recover jth columns of G
    for i = (j+1):n %2nd middle loop
    
       sum = 0; %summation variable
       
       for k = 1:(j-1) %inner loop
           
          sum = sum + G(i, k)*G(j, k); 
       end
       
       % Update G[i][j]
       G(i, j) = (A(i, j) - sum) / G(j, j);
    end
end

end %end - cholesky_decomposition
