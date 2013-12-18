function [y1,y12,y21,y22]=n2n2(x,nx,ny,gx,gy)
nx2=nx*2;
mx=nx/2;
ny2=ny*2;
my=ny/2;
rt2=1/sqrt(2);
%
bf(1:nx,:)=   ifft(x(1:nx,:));
bf(nx+1:nx2,:)=ifft(x(nx+1:nx2,:));
if (gx==1)
   d1x=2;
   c1x(1)=1;
   c1x(2)=1+mx;
   d2x=nx-d1x;
   for k=2:mx
      c2x(k-1)=k;
      c2x(k+mx-2)=mx+k;
   end   
end
%
if (gx==2)
   d1x=mx;
   d2x=nx-d1x;
   for k=1:mx
      c1x(k)=2*k-1;
      c2x(k)=2*k;
   end   
   d2x=nx-d1x;
   for k=2:mx
      c2x(k-1)=k;
      c2x(k+mx-2)=mx+k;
   end   
end
%
if (gy==1)
   d1y=2;
   c1y(1)=1;
   c1y(2)=1+my;
   d2y=ny-d1y;
   for k=2:my
      c2y(k-1)=k;
      c2y(k+my-2)=my+k;
   end   
end
%   
if (gy==2)
   d1y=my;
   d2y=ny-d1y;
   for k=1:my
      c1y(k)=2*k-1;
      c2y(k)=2*k;
   end   
   d2y=ny-d1y;
   for k=2:my
      c2y(k-1)=k;
      c2y(k+my-2)=my+k;
   end   
end
%
for k=1:ny2
   for k1=1:d1x
      tx(1,k1)=bf(c1x(k1),k);
      tx(2,k1)=bf(c1x(k1)+nx,k);
   end
   tx=ft2(tx,d1x);
   for k1=1:d1x
      bf(c1x(k1),k)=tx(1,k1);
      bf(c1x(k1)+nx,k)=tx(2,k1);
   end
end   
%
bf=bf.';
tbf(1:ny,:)=   ifft(bf(1:ny,:));
tbf(ny+1:ny2,:)=ifft(bf(ny+1:ny2,:));
%
for k=1:nx2
   for k1=1:d1y
      ty(1,k1)=tbf(c1y(k1),k);
      ty(2,k1)=tbf(c1y(k1)+ny,k);
   end
   ty=ft2(ty,d1y);
   for k1=1:d1y
      tbf(c1y(k1),k)=ty(1,k1);
      tbf(c1y(k1)+ny,k)=ty(2,k1);
   end
end   
%
bf=sqrt(nx*ny)*tbf.';
%
%filtering by dimensionality
%
y1=zeros(nx2,ny2);
y21=zeros(nx2,ny2);
y12=zeros(nx2,ny2);
y22=zeros(nx2,ny2);
for kx=1:d1x
   xx=c1x(kx);
   for ky=1:d1y
      yy=c1y(ky);
      y1(xx,yy)=bf(xx,yy);
      y1(xx+nx,yy)=bf(xx+nx,yy);
      y1(xx,yy+ny)=bf(xx,yy+ny);
      y1(xx+nx,yy+ny)=bf(xx+nx,yy+ny);
   end   
end   
for kx=1:d2x
   xx=c2x(kx);
   for ky=1:d1y
      yy=c1y(ky);
      y21(xx,yy)=bf(xx,yy);
      y21(xx+nx,yy)=bf(xx+nx,yy);
      y21(xx,yy+ny)=bf(xx,yy+ny);
      y21(xx+nx,yy+ny)=bf(xx+nx,yy+ny);
   end   
end   
for kx=1:d1x
   xx=c1x(kx);
   for ky=1:d2y
      yy=c2y(ky);
      y12(xx,yy)=bf(xx,yy);
      y12(xx+nx,yy)=bf(xx+nx,yy);
      y12(xx,yy+ny)=bf(xx,yy+ny);
      y12(xx+nx,yy+ny)=bf(xx+nx,yy+ny);
   end   
end   
for kx=1:d2x
   xx=c2x(kx);
   for ky=1:d2y
      yy=c2y(ky);
      y22(xx,yy)=bf(xx,yy);
      y22(xx+nx,yy)=bf(xx+nx,yy);
      y22(xx,yy+ny)=bf(xx,yy+ny);
      y22(xx+nx,yy+ny)=bf(xx+nx,yy+ny);
   end   
end   

y22=bf-y1-y21-y12;
