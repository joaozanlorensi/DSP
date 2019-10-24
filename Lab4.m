clc;
clear all;

T = 2;
Fs = 8192;
F1 = 440;
F2 = 1000;
% F3 = 329;
N = T *Fs;
n = 0 : N-1;
w1 = 2 * pi * F1 / Fs;
w2 = 2 * pi * F2 / Fs;
% w3 = 2 * pi * F3 / Fs;

x1 = cos(w1 * n); % ex 1
x2 = cos(w2 * n);
% x3 = cos(w3 * n);
sound(x1, Fs);
pause;
% x = x1 + x2 + x3; 
x = x1 + x2;
sound(x, Fs); % ex 2
pause;

w0 = 2 * pi * F2 / 8192;
r = 0.95;

a = [1 (-2 * r * cos(w0)) r^2];
b0 = (1 + 2 * r * cos(w0) +  r^2) / (2 + 2 * cos(w0));
b = [b0 b0*(-2 * cos(w0)) b0];

freqz(b, a, N);
y = filter(b, a, x);

sound(y, Fs);
pause;