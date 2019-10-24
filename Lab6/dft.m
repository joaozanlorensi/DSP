function X = dft(x)
  N = length(x);
  X = zeros(size(x));
  W = exp(-1j*2*pi/N);

  for k = 0:N-1 
    X(k+1) = 0;
    for n=0:N-1
      X(k+1)  = X(k+1) + W^(n*k)*x(n+1); % matlab indexa em 1
    end
  end