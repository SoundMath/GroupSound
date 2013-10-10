clear;
nx=8;
ny=4;
ny2=ny+ny;
mx=nx/2;
%K=max(nx2,ny);
%s2=input('input the scene number 0--6     ')
%sz=input('input the strip size 1--4    ')
%gg=bkgd(s2,sz,K/2);
%xx=gg(1:nx2,1:ny);
%
gp=input('enter group number 1--15                  ')
%
u=rand(nx,ny2);
v=rand(nx,ny2);
[x1,x2]=mn_2(u,gp);
xx1=imn_2(x1,gp);
xx2=imn_2(x2,gp);
%
v1=reshape(v(1:nx,1:ny),nx*ny,1);
v2=reshape(v(1:nx,1+ny:ny2),nx*ny,1);
vv=[v1;v2];
y=gmn_2(u,gp);
y1=y*vv;
y2=reshape(y1,nx,ny2);
%
% convolution theorem
for k=1:nx*ny2
   yy=reshape(y(:,k),nx,ny2);
   [ff1,ff2]=mn_2(yy,gp);
   f1=reshape(ff1,nx*ny2,1);
   f2=reshape(ff2,nx*ny2,1);
   fu(:,k)=f1+f2;
end   
fut=fu';
for k=1:nx*ny2
   ff=reshape(fut(:,k),nx,ny2);
   [ff1,ff2]=mn_2(ff,gp);
   f1=reshape(ff1,nx*ny2,1);
   f2=reshape(ff2,nx*ny2,1);
   ffu(:,k)=f1+f2;
end
fuf=ffu';
[fv1,fv2]=mn_2(v,gp);
fv=fv1+fv2;
%
fvv=reshape(fv,nx*ny2,1);
dd=fuf*fvv;
fd=reshape(dd,nx,ny2);
c2=imn_2(fd,gp);
%
aa=cmn_2(u,v,gp);