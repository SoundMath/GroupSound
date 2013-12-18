function [y1,y2]=mn_2(x,gp)
% Use this for even m and n:
[nx,ny2]=size(x);
mx=nx/2;
ny=ny2/2;
my=ny/2;
rt2=sqrt(2);
sc=sqrt(nx*ny);
y1=zeros(nx,ny2);
y2=zeros(nx,ny2);
%
bf(1:nx,1:ny)=sc*ifft2(x(1:nx,1:ny));
bf(1:nx,1+ny:ny2)=sc*ifft2(x(1:nx,1+ny:ny2));
%
if (gp==1) % (x,-y)
   d1=nx+nx;
   for k=1:nx
      c1(1,k)=k;
      c1(2,k)=1;
      c1(1,k+nx)=k;
      c1(2,k+nx)=my+1;
   end   
end
%
if (gp==2) % (x,(my+1)y)
   d1=nx*my;
   for k2=0:my-1
      for k1=1:nx
         c1(1,k1+nx*k2)=k1;
         c1(2,k1+nx*k2)=2*k2+1;
      end   
   end   
end
%
if (gp==3) % (x,(my-1)y);
   d1=nx+nx;
   for k=1:nx
      c1(1,k)=k;
      c1(2,k)=1;
      c1(1,k+nx)=k;
      c1(2,k+nx)=my+1;
   end   
end
%
if (gp==4) % (-x,y)
   d1=ny+ny;
   for k=1:ny
      c1(1,k)=1;
      c1(2,k)=k;
      c1(1,k+ny)=mx+1;
      c1(2,k+ny)=k;
   end   
end
%
if (gp==5) % (-x,-y)
   d1=4;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+mx;
   c1(2,2)=1;
   c1(1,3)=1;
   c1(2,3)=1+my;
   c1(1,4)=mx+1;
   c1(2,4)=my+1;
end
%
if (gp==6) % (-x,(my+1)y)
   d1=ny;   
   for k=1:my
      c1(1,k)=1;
      c1(2,k)=2*k-1;
      c1(1,k+my)=mx+1;
      c1(2,k+my)=2*k-1;
   end   
end
%
if (gp==7) % (-x,(my-1)y)
   d1=4;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+mx;
   c1(2,2)=1;
   c1(1,3)=1;
   c1(2,3)=1+my;
   c1(1,4)=mx+1;
   c1(2,4)=my+1;
end
%
if (gp==8) % ((mx+1)x,y)
   d1=mx*ny;
   for k2=1:ny
      kk=(k2-1)*mx;
      for k1=1:mx
         c1(1,k1+kk)=2*k1-1;
         c1(2,k1+kk)=k2;
      end
   end   
end
%
if (gp==9) % ((mx+1)x,-y)
   d1=nx;
   for k=1:mx
      c1(1,k)=2*k-1;
      c1(2,k)=1;
      c1(1,k+mx)=2*k-1;
      c1(2,k+mx)=my+1;
   end   
end
%
if (gp==10) % ((mx+1)x,(my+1)y)
   d1=mx*my;
   for k2=1:my
      kk=(k2-1)*mx;
      for k1=1:mx
         c1(1,k1+kk)=2*k1-1;
         c1(2,k1+kk)=2*k2-1;
      end
   end   
end
%
if (gp==11) % ((mx+1)x,(my-1)y)
   d1=nx;
   for k=1:mx
      c1(1,k)=2*k-1;
      c1(2,k)=1;
      c1(1,k+mx)=2*k-1;
      c1(2,k+mx)=my+1;
   end   
end
%
if (gp==12) % ((mx-1)x,y)
   d1=2*ny;
   for k=1:ny
      c1(1,k)=1;
      c1(2,k)=k;
      c1(1,k+ny)=mx+1;
      c1(2,k+ny)=k;
   end   
end
%
if (gp==13) % ((mx-1)x,-y)
   d1=4;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+mx;
   c1(2,2)=1;
   c1(1,3)=1;
   c1(2,3)=1+my;
   c1(1,4)=mx+1;
   c1(2,4)=my+1;
end
%
if (gp==14) % ((mx-1)x,(my+1)y)
   d1=ny;
   for k=1:my
      c1(1,k)=1;
      c1(2,k)=2*k-1;
      c1(1,k+my)=1+mx;
      c1(2,k+my)=2*k-1;
   end   
end
%
if (gp==15) % ((mx-1)x,(my-1)y)
   d1=4;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+mx;
   c1(2,2)=1;
   c1(1,3)=1;
   c1(2,3)=1+my;
   c1(1,4)=mx+1;
   c1(2,4)=my+1;
end
%
%
%
for k=1:d1
   t1(1,k)=bf(c1(1,k),c1(2,k));
   t1(2,k)=bf(c1(1,k),c1(2,k)+ny);
end      
t1=rt2*ifft(t1);
for k=1:d1
   bf(c1(1,k),c1(2,k))=t1(1,k);
   bf(c1(1,k),c1(2,k)+ny)=t1(2,k);
   y1(c1(1,k),c1(2,k))=t1(1,k);
   y1(c1(1,k),c1(2,k)+ny)=t1(2,k);
end
y2=bf-y1;
