clc
clear all


#DTFT:
#Sinal para análise:
N = 47;
load('sinal.mat');
n = 0:N-1;
[Xdtft,wdtft] = dtft(x/N,n);
figure;
plot(wdtft,abs(Xdtft));
hold on;

# Sinal de teste:
u = 3*cos(n*pi/5) + 2*cos(n*pi/3) + 4*cos(n*3*pi/4);
[Udtft,wdtft] = dtft(u/N,n);
plot(wdtft,abs(Udtft));
hold on;
stem(wdft,abs(Xdft));

% DFT com Zero Padding:

##M = 200;
##K = M - N;
##x_zp = [x, zeros(1,K)];
##X_zp = fft(x_zp/N);
##w_zp = linspace(0,2*pi-2*pi/M,M);
##stem(w_zp,abs(X_zp));