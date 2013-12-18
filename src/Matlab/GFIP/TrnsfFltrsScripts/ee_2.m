clear;
n=64;
n2=n*2;
nd2=n/2;
%orgn=1;
%
%S=imread('c:\my documents\my pictures\toad.tif');
%gg=double(S(1:256,1:256));
gg=zeros(n2,n);
gg(13:12+n,n/2+5)=1;
[nx,ny]=size(gg);
nx2=nx/2;
szx=n/2;
szy=2;
%hh=obj(0,szx,szy);
%gg(1+5:szy+5,1+3:szx+3)=hh;
%
[1 2 3 4 5 6 7]
%gp1=input('input the group number    ');
gp1=4;
mm=max(max(gg));
mn=0;
lvl=input('input the noise level     ');
%lvl=0;
sdv=lvl*mm;
ns=noise(n2,n,mn,sdv);
ngg=gg+ns;
%
%gg1=dd2(gg,gp1);
gg1=zeros(n2,n);
for k=1:n
   gg1(k,k)=1;
end
ngg1=gg1+ns;
%
[x1,x2]=nn_2(ngg,gp1);
xx1=(inn_2(x1,gp1));
u2=zeros(n2,n);
p1=input('p1 = ? ')
p2=mod(n-p1,n);
for k=1:n    % (x,x-y)
   kk=mod(n-k+1,n)+1;
   u2(1,k)=x2(1,k);
   u2(1+n,kk)=x2(1+n,kk);
   kk1=mod(p1-(k-1),n)+1;
   u2(p1+1,k)=x2(p1+1,k);
   u2(p1+1+n,kk1)=x2(p1+1+n,kk1);
   kk2=mod(n-p1-(k-1),n)+1;
   u2(p2+1,k)=x2(p2+1,k);
   u2(p2+1+n,kk2)=x2(p2+1+n,kk2);
end   
uu2=(inn_2(u2,gp1));
xx2=(inn_2(x2,gp1));
%
%gp2=input('input the group number    ');
[y1,y2]=nn_2(ngg1,gp1);
yy1=(inn_2(y1,gp1));
v2=zeros(n2,n);
for k=1:n
   kk=mod(n-k+1,n)+1;
   v2(1,k)=y2(1,k);
   v2(1+n,kk)=y2(1+n,kk);
   kk1=mod(p1-(k-1),n)+1;
   v2(p1+1,k)=y2(p1+1,k);
   v2(p1+1+n,kk1)=y2(p1+1+n,kk1);
   kk2=mod(p2-(k-1),n)+1;
   v2(p2+1,k)=y2(p2+1,k);
   v2(p2+1+n,kk2)=y2(p2+1+n,kk2);
end   
vv2=(inn_2(v2,gp1));
yy2=(inn_2(y2,gp1));
mm=max(max(real(uu2)));
nn=max(max(real(vv2)));
%
figure(1)
colormap(gray)
aa=.8*mm*ones(n2,4*n+6);
bb=.8*mm*ones(n2,4*n+6);
aa(1:n2,1:n)=real(ngg);
aa(1:n2,3+n:2*n+2)=real(ngg1);
bb(1:n2,1:n)=real(uu2);
bb(1:n2,3+n:2*n+2)=real(vv2);
%aa(1:n2,5+2*n:4+3*n)=real(ngg);
%aa(1:n2,7+3*n:6+4*n)=real(ngg1);
%bb(1:n2,5+2*n:4+3*n)=real(uu2);
%bb(1:n2,7+3*n:6+4*n)=real(vv2);
%subplot(2,2,1),imagesc(ngg)
%axis image
%subplot(2,2,2),imagesc(ngg1)
%axis image
%subplot(2,2,3),imagesc(real(uu2))
%axis image
%subplot(2,2,4),imagesc(real(vv2))
%axis image
imagesc(aa)
axis image
axis off
figure(2)
imagesc(bb)
colormap(gray)
axis image
axis off
