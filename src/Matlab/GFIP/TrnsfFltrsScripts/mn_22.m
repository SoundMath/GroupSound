function [y1,y21,y22,y4]=klm_22(x,gp)
% Use this for even n:
[nx2,ny2]=size(x);
nx=nx2/2;
ny=ny2/2;
mx=nx/2;
my=ny/2;
rt2=sqrt(2);
y1=zeros(nx2,ny2);
y21=zeros(nx2,ny2);
y22=zeros(nx2,ny2);
y4=zeros(nx2,ny2);
sc=sqrt(nx*ny);
%
bf(1:nx,1:ny)=sc*ifft2(x(1:nx,1:ny));
bf(1+nx:nx2,1:ny)=sc*ifft2(x(1+nx:nx2,1:ny));
bf(1:nx,1+ny:ny2)=sc*ifft2(x(1:nx,1+ny:ny2));
bf(1+nx:nx2,1+ny:ny2)=sc*ifft2(x(1+nx:nx2,1+ny:ny2));
%
%
%
if (gp==301) %
   % (-x,-y), (-x,y), (x,-y)
   d1=4;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+mx;
   c1(2,2)=1;
   c1(1,3)=1;
   c1(2,3)=1+my;
   c1(1,4)=1+mx;
   c1(2,4)=1+my;
   d21=ny2-4;
   for k=2:my
      c21(1,k-1)=1;
      c21(2,k-1)=k;
      c21(1,my+k-2)=1;
      c21(2,my+k-2)=k+my;
      c21(1,ny+k-3)=1+mx;
      c21(2,ny+k-3)=k;
      c21(1,ny+my+k-4)=1+mx;
      c21(2,ny+my+k-4)=k+my;
   end   
   d22=nx2-4;
   for k=2:mx
      c22(1,k-1)=k;
      c22(2,k-1)=1;
      c22(1,mx+k-2)=k+mx;
      c22(2,mx+k-2)=1;
      c22(1,nx+k-3)=k;
      c22(2,nx+k-3)=1+my;
      c22(1,nx+mx+k-4)=k+mx;
      c22(2,nx+mx+k-4)=1+my;
   end   
end   
%
%
%
for k=1:d1
   t1(1,k)=bf(c1(1,k),c1(2,k));
   t1(2,k)=bf(c1(1,k)+nx,c1(2,k));
   t1(3,k)=bf(c1(1,k),c1(2,k)+ny);
   t1(4,k)=bf(c1(1,k)+nx,c1(2,k)+ny);
end      
t1=f22(t1,d1);
for k=1:d1
   bf(c1(1,k),c1(2,k))=t1(1,k);
   bf(c1(1,k),c1(2,k)+ny)=t1(3,k);
   bf(c1(1,k)+nx,c1(2,k))=t1(2,k);
   bf(c1(1,k)+nx,c1(2,k)+ny)=t1(4,k);
   y1(c1(1,k),c1(2,k))=t1(1,k);
   y1(c1(1,k),c1(2,k)+ny)=t1(3,k);
   y1(c1(1,k)+nx,c1(2,k))=t1(2,k);
   y1(c1(1,k)+nx,c1(2,k)+ny)=t1(4,k);
end
for k=1:d21
   t21(1,k)=bf(c21(1,k),c21(2,k));
   t21(2,k)=bf(c21(1,k)+nx,c21(2,k));
   s21(1,k)=bf(c21(1,k),c21(2,k)+ny);
   s21(2,k)=bf(c21(1,k)+nx,c21(2,k)+ny);
end   
t21=rt2*ifft(t21);
s21=rt2*ifft(s21);
for k=1:d21
   k1=c21(1,k);
   k2=c21(2,k);
   bf(k1,k2)=t21(1,k);
   bf(k1+nx,k2)=t21(2,k);
   bf(k1,k2+ny)=s21(1,k);
   bf(k1+nx,k2+ny)=s21(2,k);
   y21(k1,k2)=bf(k1,k2);
   y21(k1+nx,k2)=bf(k1+nx,k2);
   y21(k1,k2+ny)=bf(k1,k2+ny);
   y21(k1+nx,k2+ny)=bf(k1+nx,k2+ny);
end
for k=1:d22
   t22(1,k)=bf(c22(1,k),c22(2,k));
   t22(2,k)=bf(c22(1,k),c22(2,k)+ny);
   s22(1,k)=bf(c22(1,k)+nx,c22(2,k));
   s22(2,k)=bf(c22(1,k)+nx,c22(2,k)+ny);
end   
t22=rt2*ifft(t22);
s22=rt2*ifft(s22);
for k=1:d22
   k1=c22(1,k);
   k2=c22(2,k);
   bf(k1,k2)=t22(1,k);
   bf(k1,k2+ny)=t22(2,k);
   bf(k1+nx,k2)=s22(1,k);
   bf(k1+nx,k2+ny)=s22(2,k);
   y22(k1,k2)=bf(k1,k2);
   y22(k1+nx,k2)=bf(k1+nx,k2);
   y22(k1,k2+ny)=bf(k1,k2+ny);
   y22(k1+nx,k2+ny)=bf(k1+nx,k2+ny);
end
y4=bf-y1-y21-y22;
