function [xs] = whitening(x)
%
% Inputs:           vettore colonna x (d,1)
%
% Outputs:          xs vettore sbiancato
%
% Descrizione:      Operazione di sbiancamento: si riduce la dimensionalità
%                   del problema
%
% Funzionamento:    1. Calcolo la matrice di covarianza
%                   2. Calcolo matrice autovalori D
%                      e matrice di autovettori E
%                   3. Calcolo il vettore sbiancato xs=ED^(-1/2)E'x


[d,n] = size(x);

xs = zeros(d,n);

C = cov(x',1);

% la funzione eig restituisce
%   la matrice diagonale di D che presenta gli autovalori
%   la matrice E degli autovettori normalizzati
[E,D] = eig(C);

D = D^(-(1/2));
xs=E*D*E'*x;

