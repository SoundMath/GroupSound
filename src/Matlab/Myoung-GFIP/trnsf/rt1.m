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
for k=1:n
   gg(k,k)=1;
   gg(k,6)=1;
end   
mm=0;
nn=0;
gg1=abel_tr(gg,mm,nn);
gg2=[abel_tr(gg(1:n,1:n),mm,nn)...
      abel_tr(gg(1:n,1+n:n2),mm,nn);...
      abel_tr(gg(1+n:n2,1:n),mm,nn)...
      abel_tr(gg(1+n:n2,1+n:n2),mm,nn)];
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
gg1=gg1+ns;
gg2=gg2+ns;
gg=gg+ns;
hh1=hh1+ns;
hh2=hh2+ns;
hh3=hh3+ns;
[11 12 13 14 15 18 19 23 29 31]
[103 104 201 202 203]
gp1=11;
%
[x1,x21,x22,x23,x4]=nn_22(gg,gp1);
xx23=(inn_22(x23,gp1));
y4=zeros(n2,n2);
for k=1:n
   y4(k,1)=x4(k,1);
   y4(k+n,1)=x4(k+n,1);
   y4(1,k+n)=x4(1,k+n);
   y4(1+n,k+n)=x4(1+n,k+n);
   %
   y4(1,k)=x4(1,k);
   y4(1+n,k)=x4(1+n,k);
   y4(k,1+n)=x4(k,1+n);
   y4(k+n,1+n)=x4(k+n,1+n);
end   
yy4=inn_22(y4,gp1);
nabel1=real(yy4+xx23);
%
[x1,x21,x22,x23,x4]=nn_22(hh1,gp1);
xx23=(inn_22(x23,gp1));
y4=zeros(n2,n2);
for k=1:n
   y4(k,1)=x4(k,1);
   y4(k+n,1)=x4(k+n,1);
   y4(1,k+n)=x4(1,k+n);
   y4(1+n,k+n)=x4(1+n,k+n);
   %
   y4(1,k)=x4(1,k);
   y4(1+n,k)=x4(1+n,k);
   y4(k,1+n)=x4(k,1+n);
   y4(k+n,1+n)=x4(k+n,1+n);
end   
yy4=inn_22(y4,gp1);
nabel2=real(yy4+xx23);
%
[x1,x21,x22,x23,x4]=nn_22(hh2,gp1);
xx23=(inn_22(x23,gp1));
y4=zeros(n2,n2);
for k=1:n
   y4(k,1)=x4(k,1);
   y4(k+n,1)=x4(k+n,1);
   y4(1,k+n)=x4(1,k+n);
   y4(1+n,k+n)=x4(1+n,k+n);
   %
   y4(1,k)=x4(1,k);
   y4(1+n,k)=x4(1+n,k);
   y4(k,1+n)=x4(k,1+n);
   y4(k+n,1+n)=x4(k+n,1+n);
end   
yy4=inn_22(y4,gp1);
nabel3=real(yy4+xx23);
%
[x1,x21,x22,x23,x4]=nn_22(hh3,gp1);
xx23=(inn_22(x23,gp1));
y4=zeros(n2,n2);
for k=1:n
   y4(k,1)=x4(k,1);
   y4(k+n,1)=x4(k+n,1);
   y4(1,k+n)=x4(1,k+n);
   y4(1+n,k+n)=x4(1+n,k+n);
   %
   y4(1,k)=x4(1,k);
   y4(1+n,k)=x4(1+n,k);
   y4(k,1+n)=x4(k,1+n);
   y4(k+n,1+n)=x4(k+n,1+n);
end   
yy4=inn_22(y4,gp1);
nabel4=real(yy4+xx23);
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
big(1:n2,1:n2)=real(gg);
big(1:n2,3+n2:2+2*n2)=real(fbb);
big(1:n2,5+2*n2:4+3*n2)=real(nabel);
%
big1=.8*max(max(yy4+xx23))*ones(n2,4*n2+6);
big1(1:n2,1:n2)=real(gg);
big1(1:n2,3+n2:2+2*n2)=real(hh1);
big1(1:n2,5+2*n2:4+3*n2)=real(hh2);
big1(1:n2,7+3*n2:6+4*n2)=real(hh3);
%
big2=.8*max(max(yy4+xx23))*ones(n2,4*n2+6);
big2(1:n2,1:n2)=real(nabel1);
big2(1:n2,3+n2:2+2*n2)=real(nabel2);
big2(1:n2,5+2*n2:4+3*n2)=real(nabel3);
big2(1:n2,7+3*n2:6+4*n2)=real(nabel4);
%
figure(1)
colormap(gray)
clf
imagesc(real(big1))
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
