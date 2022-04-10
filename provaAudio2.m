% FASTICA AUDIO
%
% prova2
%

%SOURCE
fc=8000;
[x1,fc1] = audioread('Audio/prova2/mixed1.wav');
n1=[1:length(x1)];
subplot(3,2,1);
plot(n1,x1)
%sound(x1,fc1);

[x2,fc2] = audioread('Audio/prova2/mixed2.wav');
n2=[1:length(x2)];
subplot(3,2,3);
plot(n2,x2)
[x3,fc3] = audioread('Audio/prova2/mixed3.wav');
n3=[1:length(x3)];
subplot(3,2,5);
plot(n3,x3)
%sound(x2,fc2);

n = 3;
%A = randn(n, n); 
x = [x1';x2';x3'];
% filename1='prova1/mixed1.wav';
% filename2='prova1/mixed2.wav';
% audiowrite(filename1,x(1,:),fc);
% audiowrite(filename2,x(2,:),fc);
%sound(x(1,:));
% subplot(2,3,2);
% plot(n1,x(1,:))
% subplot(2,3,5);
% plot(n1,x(2,:))

filename1='Audio/prova2/recovered1.wav';
filename2='Audio/prova2/recovered2.wav';
filename3='Audio/prova2/recovered3.wav';
size(x);
[s,W] = fastICA(x,n);

subplot(3,2,2);
plot(n1,s(1,:))
subplot(3,2,4);
plot(n1,s(2,:))
subplot(3,2,6);
plot(n1,s(3,:))

%sound(s(1,:),fc1)
audiowrite(filename1,s(1,:),fc1);
audiowrite(filename2,s(2,:),fc1);
audiowrite(filename3,s(3,:),fc1);
%pause(10)
% s1 = audioplayer(s(1,:),fc);
% play(s1);

sound(s(1,:),fc1)
% pause(10)
% sound(s(2,:))