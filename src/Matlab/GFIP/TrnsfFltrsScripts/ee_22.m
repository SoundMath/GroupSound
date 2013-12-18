clear;
n=64;
n2=n*2;
nd2=n/2;
%
S=imread('c:\mydocuments\mypictures\grass.tiff');
gg=double(S(1:n2,1:n2));
%for k=1:n
%   gg(k+n/2,2*k-1)=1;
%end   
%gg=bkgd(0,2,n);
ln=zeros(n2,n2);
for k=1:n
   gg(k,k+n-5)=180;
   gg(k,n-15)=180;
   ln(k,k+n-5)=180;
   ln(k,n-15)=180;
end  
%gg=gg+ln;
%gp=13;
%
%gg=ln;
lvl=input('input the noise level   ');
ns=lvl*rand(n2,n2);
ngg=gg+ns;
[11 12 13 14 15 18 19 23 29 31]
[103 104 201 202 203]
gp=input('gp=?   ');
gp=11;
%
[x1,x21,x22,x23,x4]=nn_22(ngg,gp);
%for k=0:n-1
%   fltr(k+1,1)=mod(n-2*k,n)+1;
%   fltr(k+1,2)=k+1;
%   fltr(n+k+1,1)=mod(2*k,n)+1;
%   fltr(n+k+1,2)=mod(n-k,n)+1;
%end
%y4=fil22(x4,gp,fltr);
%yy4=inn_22(y4,gp);
%xx1=inn_22(x1,gp);
%xx21=inn_22(x21,gp);
%xx22=inn_22(x22,gp);
xx23=inn_22(x23,gp);
gp2=14;
[y1,y21,y22,y23,y4]=nn_22(ngg,gp2);
%yy1=inn_22(y1,gp2);
%yy21=inn_22(y21,gp2);
%yy22=inn_22(y22,gp2);
yy23=inn_22(y23,gp2);
%yy4=inn_22(y4,gp2);
%
%
%subplot(3,2,5),imagesc(real(yy23))
%axis image
%axis off
%subplot(3,2,6),imagesc(real(yy4))
%axis image
%axis off
%
%ff=zeros(n2,n2);
%ff(1+n,1:n2)=1;
%nff=ff+ns;
%rf=rrtt(ff,n2,-27);
%[u1,u21,u22,u23,u4]=nn_22(rf,gp);
%v4=fil22(u4,gp,fltr);
%vv4=inn_22(y4,gp);
%uu1=inn_22(u1,gp);
%uu21=inn_22(u21,gp);
%uu22=inn_22(u22,gp);
%uu23=inn_22(u23,gp);
%uu4=inn_22(u4,gp);
%nrf=rf+ns;
%
%figure(2)
%colormap(gray)
%clf
%subplot(3,2,1),imagesc(real(nrf))
%axis image
%axis off
%subplot(3,2,2),imagesc(real(uu1))
%axis image
%axis off
%subplot(3,2,3),imagesc(real(uu21))
%axis image
%axis off
%subplot(3,2,4),imagesc(real(uu22))
%axis image
%axis off
%subplot(3,2,5),imagesc(real(uu23))
%axis image
%axis off
%subplot(3,2,6),imagesc(real(vv4))
%axis image
%axis off

%big1=.8*max(max(ngg))*ones(n2,4*n2+6);
%big1(1:n2,1:n2)=real(gg);
%big1(1:n2,3+n2:2+2*n2)=real(ngg);
%big1(1:n2,5+2*n2:4+3*n2)=real(rf);
%big1(1:n2,7+3*n2:6+4*n2)=real(nrf);
%
%big2=.8*max(max(real(yy4)))*ones(n2,4*n2+6);
%big2(1:n2,1:n2)=real(yy4);
%big2(1:n2,3+n2:2+2*n2)=real(-ngg+yy4);
%big2(1:n2,5+2*n2:4+3*n2)=real(vv4);
%big2(1:n2,7+3*n2:6+4*n2)=real(-nrf+vv4);
%figure(1)
%clf
%imagesc(big1)
%axis image
%axis off
%brighten(.7)
%figure(2)
%clf
%imagesc(big2)
%axis image
%axis off
%brighten(-.7)
%
fg=fft2(gg);
ff=zeros(n2,n2);
for k=2:n2
   ff(1,k)=fg(1,k);
end
gf=ifft2(ff);
%
figure(1)
colormap(gray)
clf
subplot(1,4,1),imagesc(real(ln))
axis image
axis off
subplot(1,4,2),imagesc(real(ngg))
axis image
axis off
subplot(1,4,3),imagesc(real(gf))
axis image
axis off
subplot(1,4,4),imagesc(real(yy23+xx23))
axis image
axis off
   