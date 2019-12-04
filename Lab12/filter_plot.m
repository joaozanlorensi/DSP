clc
clear all
close all

pkg load signal
pkg load control

% Signals:

T = 100;
i = 0:T;

s = cos(i*pi/10) + cos(i*2*pi/5) + cos(i*2*pi/3) + cos(i*9*pi/10);
ideal_filter = cos(i*2*pi/5) + 0.5*cos(i*2*pi/3);

% Filters:

A = [0 1 0.5 0];
w = [0.225 0.525 0.75 1]*pi;
K = length(w);

% Hann Filter

M = 124;
n = 0:M;
h = zeros(1,1);

eps = 1e-12;

for k = 1:K-1
  h = h + (A(k) - A(k+1)) * sin(w(k) * (n - M/2 + eps))./(pi*(n - M/2 + eps));
endfor


h = h .* hann(M+1)';
[H, W] = freqz(h);
figure(1);
plot(W/pi, abs(H));
grid on;
HannFilter = filter(h, 1, s);
figure(2);
stem(HannFilter);


% Kaiser Filter 

Beta = 3.3953;
M = 90;
n = 0:M;
h = zeros(1,1);

eps = 1e-12;

for k = 1:K-1
  h = h + (A(k) - A(k+1)) * sin(w(k) * (n - M/2 + eps))./(pi*(n - M/2 + eps));
endfor

figure(3);
h = h .* kaiser(M + 1, Beta)';
[H, W] = freqz(h);
plot(W/pi, abs(H));
grid on;
KaiserFilter = filter(h, 1, s);
figure(4);
stem(KaiserFilter);

figure(5);
stem(ideal_filter);