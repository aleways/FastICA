% FASTICA IMMAGIINI
%
% CARTELLA (TIPO, #SORGENTI)
% img1 (jpg, n=3)
% img2 (jpg, n=2)
% img3 (jpg, n=2)
% img4 (jpg, n=3)
% img5 (jpg, n=3)
% img6 (jpg, n=3)
% img7 (jpg, n=2)
% img8 (jpg, n=2)
% img9 (jpg, n=3)
% img10 (jpg, n=3)
%

%SORGENTI
%Apro i file immagine
img1 = imread ('IMMAGINI/img5/input1.jpg');  
img2 = imread ('IMMAGINI/img5/input2.jpg');  
img3 = imread ('IMMAGINI/img5/input3.jpg'); 
%img4 = imread ('IMMAGINI/img5/input4.jpg'); 

figure()
subplot(3,3,1),imshow(img1),title('Original Source 1'),
subplot(3,3,2),imshow(img2),title('Original Source 2'), 
subplot(3,3,3),imshow(img3),title('Original Source 3'), 
%subplot(3,3,4),imshow(img4),title('Original Source 4'), 

[x1,y1,z1]=size(img1); 
[x2,y2,z2]=size(img2); 
[x3,y3,z3]=size(img3); 
% [x4,y4,z4]=size(img4); 
 
i1=[reshape(img1,[1,x1*y1*z1])]; 
i2=[reshape(img2,[1,x2*y2*z2])];
i3=[reshape(img3,[1,x3*y3*z3])];
% i4=[reshape(img4,[1,x4*y4*z4])];

x_int=[i1;i2;i3];
x =double(x_int);
n = 3;
A = rand(size(x,1));
mix = A*x;


mix1 = reshape(mix(1,:),[x1,y1,z1]); 
mix2 = reshape(mix(2,:),[x2,y2,z2]); 
mix3 = reshape(mix(3,:),[x3,y3,z3]);
% mix4 = reshape(mix(4,:),[x4,y4,z4]);

mix1_int = uint8 (round(mix1)); 
mix2_int = uint8 (round(mix2)); 
mix3_int = uint8 (round(mix3)); 
% mix4_int = uint8 (round(mix4)); 

subplot(3,3,4),imshow(mix1_int),title('Mixed 1'),
subplot(3,3,5),imshow(mix2_int),title('Mixed 2'),
subplot(3,3,6),imshow(mix3_int),title('Mixed 3'), 
% subplot(3,3,8),imshow(mix4_int),title('Mixed 4'), 
% 
imwrite(mix1_int,'IMMAGINI/img5/mixed1.jpg');
imwrite(mix2_int,'IMMAGINI/img5/mixed2.jpg');
imwrite(mix3_int,'IMMAGINI/img5/mixed3.jpg');
% imwrite(mix4_int,'IMMAGINI/img5/mixed4.jpg');

%applico l'algoritmo fastica alla matrice 'mix'
[s , W]=fastICA(mix,n);
%s=fastica_matlab(mix);
s = abs(55*s); 


s1=reshape(s(1,:),[x1,y1,z1]); 
s2=reshape(s(2,:),[x2,y2,z2]); 
s3=reshape(s(3,:),[x3,y3,z3]); 
% s4=reshape(s(4,:),[x4,y4,z4]); 

s1_int = uint8 (round(s1)); 
s2_int = uint8 (round(s2)); 
s3_int = uint8 (round(s3)); 
% s4_int = uint8 (round(s4)); 

subplot(3,3,7),imshow(s1_int),title('Restored1'); 
subplot(3,3,8),imshow(s2_int),title('Restored2');
subplot(3,3,9),imshow(s3_int),title('Restored3');
% subplot(3,3,12),imshow(s4_int),title('Restored3');
% 
imwrite(s1_int,'IMMAGINI/img5/recovered1.jpg');
imwrite(s2_int,'IMMAGINI/img5/recovered2.jpg');
imwrite(s3_int,'IMMAGINI/img5/recovered3.jpg');
% imwrite(s4_int,'IMMAGINI/img5/recovered4.jpg');
