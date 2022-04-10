% FASTICA AUDIO
%
% CARTELLA (TIPO, #SORGENTI)
% prova1 (wav, n=2)
% prova3 (wav, n=2)
% prova4 (wav, n=2)
% prova5 (wav, n=2)
% prova6 (wav, n=2)
% prova7 (wav, n=3)
% prova8 (wav, n=2)
% prova9 (wav, n=2)
% prova10 (wav, n=2)
%

% SOURCE
% Apro i segnali audio
[x1,fc1] = audioread('Audio/prova10/source1.wav');
n1=[1:length(x1)];
subplot(2,3,1);
plot(n1,x1)
%sound(x1,fc1);

[x2,fc2] = audioread('Audio/prova10/source2.wav');
n2=[1:length(x2)];
subplot(2,3,4);
plot(n2,x2)
%sound(x2,fc2);


[xrow1, xcol1] = size(x1);
[xrow2, xcol2] = size(x2);



if xrow1 ~= 1
    x1 = x1';
end

if xrow2 ~= 1
    x2 = x2';
end

[xrow1, xcol1] = size(x1)
[xrow2, xcol2] = size(x2);

if xcol1 > xcol2
    x1 = x1(1,1:xcol2);
elseif xcol2 > xcol1
    x2 = x2(1,1:xcol1);
end

size(x2)
x=[x1;x2];
size(x)
n = 2;
A = randn(n,n); 
x = A*x;

filename1='Audio/prova10/mixed1.wav';
filename2='Audio/prova10/mixed2.wav';

audiowrite(filename1,x(1,:),fc1);
audiowrite(filename2,x(2,:),fc1);

%sound(x(1,:));
subplot(2,3,2);
plot(n1,x(1,:))
subplot(2,3,5);
plot(n1,x(2,:))

filename1='Audio/prova10/recovered1.wav';
filename2='Audio/prova10/recovered2.wav';

%RECOVERED
[s,W] = fastICA(x,n);

subplot(2,3,3);
plot(n1,s(1,:))
subplot(2,3,6);
plot(n1,s(2,:))

audiowrite(filename1,s(1,:),fc1);
audiowrite(filename2,s(2,:),fc2);

fc= 8000;
%pause(10)
% s1 = audioplayer(s(1,:),fc);
% play(s1);
sound(s(1,:),fc1)
pause(10)
sound(s(2,:),fc2)