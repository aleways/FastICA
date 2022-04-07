function [s, W] = fastICA(x,n)

%
% Inputs:
%   X -> vettore colonna che contiene le miscele
%   n -> numero delle componenti indipendenti da determinare
%
% Outputs:
%   s -> vettore colonna contenente le componenti indipendenti dei segnali
%        di input
%   W -> stima della matrice inversa di A tramite cui ricavare i
%        segnali sorgenti
%
% Others:
%   G = -exp(-0.5 * u.^2) -> funzione per ottenere approssimazione
%                            negentropia
%
% Descrizione : algoritmo FastICA


% Constanti
TOL = 1e-6;   % criterio per la convergenza
MAX = 100;    % Massimo numero iterazioni

% dati centrati e sbiancati
[xc] = centering(x);
[xcw , H] = whitening(xc);
[xrow, xcol]=size(x);
% Fast ICA

W=zeros(n,xrow);

for t=1:xrow
    i     = 0; %conta iterazioni
    delta = inf; %valore per la convergenza
    Wp = rand(n,1);

    while delta > TOL && i < MAX

        i = i + 1;

        % Salvo il vettore in Wlast per poi effettuare il confronto
        Wlast = Wp;
        u = Wp'*xcw; % 1x1001

        % Definisco la prima e la seconda derivata della funzione G
        Gp = u .* exp(-0.5 * u.^2); % 1 x 1001
        Gs = (ones(1,xcol) - u.^2) .* exp(-0.5 * u.^2); % 1x1001

        %calcolo il nuovo vettore Wp
        %Wp = mean(xcw * Gp') - mean(Gs)*Wp;
        Wp = (1/xcol).*(xcw * Gp') - ((1/xcol).*(Gs))*(ones(xcol,1))*Wp; %2x1
        
        
        % Decorrelazione
        W_sum=zeros(n,1);
        for int = 1:t-1  
            W_sum = W_sum + (Wp'*W(:,int))*W(:,int);
        end
        Wp = Wp - W_sum;
        Wp = Wp/norm(Wp);
        
        % Aggiornamento variabile di convergenza
        delta = max(1 - abs(dot(Wlast,Wp,2)));

    end

    W(:,t) = Wp;
    
end
% s = W'*xcw;
s = W'*H*x;
