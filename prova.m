t = 0:0.1:100;
s1 = 2*sin((1/10)*pi*t);
s2=2*sawtooth((1/15)*pi*t);

subplot(2,3,1);
plot(t,s1)
title('Original Signal','FontSize',10)
subplot(2,3,4);
plot(t,s2,'red')

S=[s1;s2];

[r ,c]=size(S);
%A = [0.99 -1.7; -0.46 -1.02]; 
A=randn(r,r);
X=A*S;

subplot(2,3,2);
plot(t,X(1,:))
title('Mixed Signal','FontSize',10)
subplot(2,3,5);
plot(t,X(2,:),'red')

[segnale] = fastICA(X,2);
size(segnale);
subplot(2,3,3);
plot(t,segnale(1,:))
title('Recovered Signal','FontSize',10)
subplot(2,3,6);
plot(t,segnale(2,:),'red')


