clear;
n=32;
n2=n*2;
nd2=n/2;
%
%s2=input('input the slope     ')
s2=2;
%s2=1: gp=11, xx24
gg=zeros(n2,n2);
for k=0:n-1
   gg(2*k+1,k+1)=2;
end   
%
%nn_22
[11 12 13 14 15 18 19 23 29 31]
[103 104 201 202 203]
%nn_4
%[1 2 3 11 12 21 22 23 24]
%nn_2
%[1 2 3 4]
gp1=input('input the group number    ')
mm=max(max(gg));
mn=0;
%lvl=input('input the noise level     ')
lvl=0.5;
sdv=lvl*mm;
ns=noise(n2,n2,mn,sdv);
ngg=gg+ns;
%
[x1,x21,x22,x23,x4]=nn_22(ngg,gp1);
xx1=real(inn_22(x1,gp1));
xx21=real(inn_22(x21,gp1));
xx22=real(inn_22(x22,gp1));
xx23=real(inn_22(x23,gp1));
xx4=real(inn_22(x4,gp1));
%
figure(1)
subplot(3,2,1),imagesc(ngg)
subplot(3,2,2),imagesc(xx1)
subplot(3,2,3),imagesc(xx21)
subplot(3,2,4),imagesc(xx22)
subplot(3,2,5),imagesc(xx23)
subplot(3,2,6),imagesc(xx4)
%
%[x1,x2,x4]=nn_4(ngg,gp1);
%xx1=real(inn_4(x1,gp1));
%xx2=real(inn_4(x2,gp1));
%xx4=real(inn_4(x4,gp1));
%
%figure(1)
%subplot(2,2,1),imagesc(ngg)
%subplot(2,2,2),imagesc(xx1)
%subplot(2,2,3),imagesc(xx2)
%subplot(2,2,4),imagesc(xx4)
%
