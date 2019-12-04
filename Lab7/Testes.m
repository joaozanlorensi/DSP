clc
clear all
close all

N1 = 10; n1 = 0:N1-1;
x1 = cos(n1 * pi/5);
x2 = cos(n1 * pi/10);

[wdtft, xdtft] = dtft(x1, n1);
plot(xdtft,wdtft);