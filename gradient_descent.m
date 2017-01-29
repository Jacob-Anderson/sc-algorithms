function x_ks = gradient_descent(A, b, x_0)
% Perform steepest descent on the function: f(x) = (1/2)*(x^T)*A*x - (b^T)*x
% w/ A, b, and x_0 given
% Returns list containing x value for each iteration (excluding x_0)
 
% initialize x_k and d value used for convergence checks (... < 10^(-d))
x_k = x_0;
d = 3; % low so that plots are clearer

% initialize list of xk values to return - initially empty
x_ks = [];

% infinite loop - exit on convergence
while true

    % append x_k to list of x_ks
    x_ks(end+1,:) = x_k;
    
    % find r_k, alpha_k
    r_k = b - A*x_k;
    alpha_k = (r_k.'*r_k) / (r_k.'*A*r_k);
    
    % find next x
    x_k_1 = x_k + alpha_k*r_k; 
    
    % check for convergence - return x_k_1 if check passes
    if abs(x_k_1 - x_k) <= 10^(-d)
        % append final result to list of x_ks
        x_ks(end+1,:) = x_k_1;
        return;
    end
    
    % update x_k to next x value
    x_k = x_k_1;
end
end % end - gradient_descent
