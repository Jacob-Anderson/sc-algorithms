function x_ks = jacobi(A, b, x_0)
% Jacobi - iteratively find increasingly improved approximations
% for the minimum of the function: f(x) = (1/2)*(x^T)*A*x - (b^T)*x
% w/ A, b, and x_0 given
% Returns list containing x value for each iteration

% d value used for convergence checks (... < 10^(-d))
% low so that plots are clearer
d = 3;

% determine n from given A (# of columns)
n = size(A, 2);

% initialize x and next x, initially x_0
x_k = x_0; x_k_1 = x_0;

% initialize list of xk values to return - initially empty
x_ks = [];

% infinite loop - exit on convergence
while true
    
    % append x_k to list of x_ks
    x_ks(end+1,:) = x_k;
    
    % for each component of x
    for i = 1:n
        % compute next x using current x
        % x_k_1(i) = (1 / A(i,i))*[b(i) - sum(A(i,j)*x_k(j) for all j~=i)]
        x_k_1(i) = b(i); 
        for j = 1:n
            if j ~= i
                x_k_1(i) = x_k_1(i) - A(i,j) * x_k(j);        
            end
        end
        x_k_1(i) = x_k_1(i) / A(i,i);
        
    end % end - x component loop
    
    % test for convergence
    if norm(x_k_1 - x_k) <= 10^(-d)
        % append final result to list of x_ks
        x_ks(end+1,:) = x_k_1;
        return
    end
    
    % update x to next x
    x_k = x_k_1;
end
end % end - jacobi
