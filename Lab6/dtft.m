function [X,W] = dtft(x,n)
    x = x(:); % Force column vector
    n = n(:); % Force column vector
    N = length(x); % Number of input points
    M = 1024; % Number of DTFT points
    W = linspace(-pi,pi,M); % Digital frequencies
    X = zeros(size(W)); % Initial DTFT values

    if ~exist('n', 'var') % If ’n’ is not given, create
        n = (0:N-1);
    end
    
    soma = 0;
    for w = 1:M
        for j = 1:N
           	X(w) = X(w) +  x(j) * exp(-1j*W(w)*n(j));
        end
    end
    