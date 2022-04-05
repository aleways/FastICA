function [xcenter] = centering(x)
%
% Inputs:           vettore colonna x (d,1)
%
% Outputs:          xcenter vettore centrato
%
% Descrizione:      Operazione di centratura: sottrarre da ogni 
%                   osservazione la media della variabile a cui appartiene

[d,n] = size(x);

xcenter = zeros(d,n);

for t=1:d
    m=mean(x(t,:));
    xcenter(t,:)=x(t,:) - m;

end
    