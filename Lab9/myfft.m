function X = myfft(x)
    N = length(x);
    M = log2(N);
    
    if M - round(M) ~= 0
        error('Not 2^p');
    end;
    
    if N == 1
        X = x;
        return
    end;
    
    Xe = myfft(x(1:2:end)); 
    Xo = myfft(x(2:2:end));  
    
    for k = 0 : (N/2 - 1)
        X(k+1) = Xe(k+1) + exp(-1j*2*pi*(k)/N) * Xo(k+1);
        X(k+1+N/2) = Xe(k+1) - exp(-1j*2*pi*(k)/N) * Xo(k+1);
    end;
        
    

