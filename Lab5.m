clc
clear all

pkg load control
pkg load signal

% Sequencias de teste:
seq1 = [0 1 2 3];
N1 = 4;
n1 = 0:(N1-1)

n2 = 0:3;
seq2 = cos(pi*n2/2);
N2 = 4;

n3 = 0:7;
seq3 = 5 + 2 * cos(pi*n3/2);
N3 = 8;

n4 = 0:11;
seq4 = 1 + 3 * cos(pi*n4/3) + sin(5*pi*n4/6);
N4 = 12;

% Testes e resultados:
X1 = dft(seq1)

X2 = dft(seq2)

X3 = dft(seq3)

X4 = dft(seq4)
