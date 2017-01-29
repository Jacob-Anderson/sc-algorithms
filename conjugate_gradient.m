function x_ks = conjugate_gradient(A, b, x_0)
% Perform conjugate gradient on the function: f(x) = (1/2)*(x^T)*A*x - (b^T)*x
% w/ A, b, and x_0 given
% Returns list containing x value for each iteration (excluding x_0)

% initialize x_k and d value used for convergence checks (... < 10^(-d))
x_k = x_0;
d = 3; % low so that plots are clearer

% determine n from given A (# of columns)
n = size(A, 2);

% initialize list of xk values to return - initially empty
x_ks = [];

% initialize r_k and p_k (r_0 and p_0)
r_k = b - A*x_0;
p_k = r_k;

% n iterations
for k = 0:(n-1)
    
    % append x_k to list of x_ks
    x_ks(end+1,:) = x_k;
    
    % find alpha_k
    alpha_k = (r_k.'*r_k) / (p_k.'*A*p_k);
    
    % find next x
    x_k = x_k + alpha_k*p_k;
    
    % find next r 
    r_k_1 = r_k - alpha_k*A*p_k;
    
    % check for convergence
    if r_k_1.'*r_k_1 <= 10^(-d) 
        % append final result to list of x_ks 
        x_ks(end+1,:) = x_k;
        return;
    end
    
    % find new search direction
    beta_k = (r_k_1.'*r_k_1) / (r_k.'*r_k);
    p_k = r_k_1 + beta_k*p_k;
    
    % update r_k
    r_k = r_k_1;
end
end % end - conjugate_gradient
