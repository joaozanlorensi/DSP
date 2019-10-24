L = 5;
n = 0:L-1;
x = 1*(n >= 0 & n <= L-1);
%figure(1);
%stem(x);

M = 1024;
w = linspace(-pi, pi, M); % M representa o no de pontos

X = sin(w*L/2)./sin(w/2).*exp(-1j*w*(L-1)/2);

figure(2);
plotyy(w/pi, abs(X), w/pi, angle(X));

modX = sin(w*L/2)./sin(w/2)
angX = -w*(L-1)/2

%figure(3);
%plotyy(w/pi, modX, w/pi, angX);
