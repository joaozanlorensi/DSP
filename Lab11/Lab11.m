clc
clear all
close all

A = [0 1 0.5 0]
w = [0.225 0.525 0.75 1]*pi;
K = length(w);

M = 40;
n = 0:M;
h = zeros(1,1);

eps = 1e-12

for k = 1:K-1
  h = h + (A(k) - A(k+1)) * sin(w(k) * (n - M/2 + eps))./(pi*(n - M/2 + eps))
endfor

[H, W] = freqz(h);
plot(W/pi, abs(H));
grid on;

N = 100;
i = 0:N;
x = cos(pi/10 * i) + cos(pi/5 * i) + cos(pi/2 * i);

y = filter(h, 1, x);
figure(2);
stem(y);
