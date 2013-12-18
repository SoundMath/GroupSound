clear;
n=32;
n2=n*2;
nd2=n/2;
%orgn=1;
%
%S=imread('c:\my documents\my pictures\toad.tif');
%gg=double(S(1:256,1:256));
%sc=input('input the scene number    ');
gg=zeros(n2,n2);
g(1,1)=1;
for k=1:n-1
   gg(k+n/2+1,2*k)=1;
   gg(k,6)=1;
end   
mm=0;
nn=0;
gg1=abeltr(gg,mm,nn);
gg2=[abeltr(gg(1:n,1:n),mm,nn)...
      abeltr(gg(1:n,1+n:n2),mm,nn);...
      abeltr(gg(1+n:n2,1:n),mm,nn)...
      abeltr(gg(1+n:n2,1+n:n2),mm,nn)];
for k1=1:n
   rk1=mod(n-k1+1,n)+1;
   for k2=1:n
      rk2=mod(n-k2+1,n)+1;
      hh1(rk1,rk2)=gg(k1+n,k2);
      hh1(rk1+n,rk2)=gg(k1,k2);
      hh1(rk1,rk2+n)=gg(k1+n,k2+n);
      hh1(rk1+n,rk2+n)=gg(k1,k2+n);
      hh2(k2,k1)=gg(k1,k2+n);
      hh2(k2+n,k1)=gg(k1+n,k2+n);
      hh2(k2,k1+n)=gg(k1,k2);
      hh2(k2+n,k1+n)=gg(k1+n,k2);
      hh3(rk2,rk1)=gg(k1+n,k2+n);
      hh3(rk2+n,rk1)=gg(k1,k2+n);
      hh3(rk2,rk1+n)=gg(k1+n,k2);
      hh3(rk2+n,rk1+n)=gg(k1,k2);
   end
end   
%
lvl=input('input the noise level   ');
ns=lvl*rand(n2,n2);
[11 12 13 14 15 18 19 23 29 31]
[103 104 201 202 203]
gp1=11;
%
hh=hh2+ns;
[x1,x21,x22,x23,x4]=nn_22(hh,gp1);
xx23=(inn_22(x23,gp1));
y4=zeros(n2,n2);
for k=1:n
   kk=mod(n-2*(k-1),n)+1;
   rk=mod(n-(k-1),n)+1;
   rkk=mod(2*(k-1),n)+1;
   y4(kk,k)=x4(kk,k);
   y4(rkk+n,rk)=x4(rkk+n,rk);
   y4(k,kk+n)=x4(k,kk+n);
   y4(rk+n,rkk+n)=x4(rk+n,rkk+n);
   %
   y4(kk+n,k)=x4(kk+n,k);
   y4(rkk,rk)=x4(rkk,rk);
   y4(k+n,kk+n)=x4(k+n,kk+n);
   y4(rk,rkk+n)=x4(rk,rkk+n);
   %
   y4(kk,k+n)=x4(kk,k+n);
   y4(rkk+n,rk+n)=x4(rkk+n,rk+n);
   y4(k+n,kk)=x4(k+n,kk);
   y4(rk+n,rkk)=x4(rk+n,rkk);
   %
   y4(kk+n,k+n)=x4(kk+n,k+n);
   y4(rkk,rk+n)=x4(rkk,rk+n);
   y4(k,kk)=x4(k,kk);
   y4(rk,rkk)=x4(rk,rkk);
end   
yy4=inn_22(y4,gp1);
nabel1=real(yy4+xx23);
%
ff=fft2(gg1);
for k=2:n2
   kk=mod(n2-(k-1),n2)+1;
   if (k~=kk)
      bb(k,kk)=ff(k,kk);
      bb(1,k)=ff(1,k);
   end   
end   
fbb=ifft2(bb);
big=.8*max(max(yy4+xx23))*ones(n2,3*n2+4);
nabel=real(yy4+xx23);
big(1:n2,1:n2)=real(hh);
big(1:n2,3+n2:2+2*n2)=real(fbb);
big(1:n2,5+2*n2:4+3*n2)=real(nabel);
%
%big1=.8*max(max(yy4+xx23))*ones(n2,4*n2+6);
%big1(1:n2,1:n2)=real(gg);
%big1(1:n2,3+n2:2+2*n2)=real(hh1);
%big1(1:n2,5+2*n2:4+3*n2)=real(hh2);
%big1(1:n2,7+3*n2:6+4*n2)=real(hh3);
%
figure(1)
colormap(gray)
clf
imagesc(real(big))
axis image
axis off
%
%subplot(3,2,1),imagesc(gg)
%axis image
%subplot(3,2,2),imagesc(real(xx23))
%axis image
%subplot(3,2,3),imagesc(real(yy4))
%axis image
%subplot(3,2,4),imagesc(real(bb))
%axis image
%subplot(3,2,5),imagesc(real(fbb))
%axis image
%subplot(3,2,6),imagesc(imag(fbb))
%axis image
%subplot(3,2,5),imagesc(real(xx23))
%axis image
%subplot(3,2,6),imagesc(real(yy4))
%axis image
%colormap(gray)
%imagesc(big)
%axis image
%axis off
