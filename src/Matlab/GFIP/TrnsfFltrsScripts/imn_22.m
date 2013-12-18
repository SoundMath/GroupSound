function y=imn_22(x,gp)
% Use this for even m and even n:
[nx2,ny2]=size(x);
nx=nx2/2;
mx=nx/2;
ny=ny2/2;
my=ny/2;
rt2=1/sqrt(2);
sc=1/sqrt(nx*ny);
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
   t1(1,k)=x(c1(1,k),c1(2,k));
   t1(3,k)=x(c1(1,k),c1(2,k)+ny);
   t1(2,k)=x(c1(1,k)+nx,c1(2,k));
   t1(4,k)=x(c1(1,k)+nx,c1(2,k)+ny);
end      
t1=f22(t1,d1);
for k=1:d1
   x(c1(1,k),c1(2,k))=t1(1,k);
   x(c1(1,k),c1(2,k)+ny)=t1(3,k);
   x(c1(1,k)+nx,c1(2,k))=t1(2,k);
   x(c1(1,k)+nx,c1(2,k)+ny)=t1(4,k);
end
for k=1:d21
   t21(1,k)=x(c21(1,k),c21(2,k));
   t21(2,k)=x(c21(1,k)+nx,c21(2,k));
   s21(1,k)=x(c21(1,k),c21(2,k)+ny);
   s21(2,k)=x(c21(1,k)+nx,c21(2,k)+ny);
end   
t21=rt2*fft(t21);
s21=rt2*fft(s21);
for k=1:d21
   x(c21(1,k),c21(2,k))=t21(1,k);
   x(c21(1,k)+nx,c21(2,k))=t21(2,k);
   x(c21(1,k),c21(2,k)+ny)=s21(1,k);
   x(c21(1,k)+nx,c21(2,k)+ny)=s21(2,k);
end
for k=1:d22
   t22(1,k)=x(c22(1,k),c22(2,k));
   t22(2,k)=x(c22(1,k),c22(2,k)+ny);
   s22(1,k)=x(c22(1,k)+nx,c22(2,k));
   s22(2,k)=x(c22(1,k)+nx,c22(2,k)+ny);
end   
t22=rt2*fft(t22);
s22=rt2*fft(s22);
for k=1:d22
   x(c22(1,k),c22(2,k))=t22(1,k);
   x(c22(1,k),c22(2,k)+ny)=t22(2,k);
   x(c22(1,k)+nx,c22(2,k))=s22(1,k);
   x(c22(1,k)+nx,c22(2,k)+ny)=s22(2,k);
end
y(1:nx,1:ny)=sc*fft2(x(1:nx,1:ny));
y(1+nx:nx2,1:ny)=sc*fft2(x(1+nx:nx2,1:ny));
y(1:nx,1+ny:ny2)=sc*fft2(x(1:nx,1+ny:ny2));
y(1+nx:nx2,1+ny:ny2)=sc*fft2(x(1+nx:nx2,1+ny:ny2));
