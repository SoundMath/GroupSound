function [y1,y21,y22,y41,y42,y8]=m_4n_2(x)
%
% m_4 X n_2 
% Use this for powers of 2
%
[nx4,ny2]=size(x);
nx=nx4/4;
ny=ny2/2;
%ny2=ny+ny;
m=ny/2;
rt2=1/sqrt(2);
%
nx2=nx+nx;
nx3=nx2+nx;
%nx4=nx3+nx;
m2=nx/2;
m4=nx/4;
%
y1=zeros(nx4,ny2);
y21=zeros(nx4,ny2);
y22=zeros(nx4,ny2);
y41=zeros(nx4,ny2);
y42=zeros(nx4,ny2);
y8=zeros(nx4,ny2);
%
bf(1:nx,1:ny2)=sqrt(nx)*ifft(x(1:nx,1:ny2));
bf(1+nx:nx2,1:ny2)=sqrt(nx)*ifft(x(1+nx:nx2,1:ny2));
bf(1+nx2:nx3,1:ny2)=sqrt(nx)*ifft(x(1+nx2:nx3,1:ny2));
bf(1+nx3:nx4,1:ny2)=sqrt(nx)*ifft(x(1+nx3:nx4,1:ny2));
%
for ky=1:ny2
% 2-d idempotents
   for k=1:m4-1
      k2=1+2*k;
      t1=bf(k2,ky)+bf(k2+nx2,ky);
      t2=bf(k2,ky)-bf(k2+nx2,ky);
      s1=bf(k2+nx,ky)+bf(k2+nx3,ky);
      s2=bf(k2+nx,ky)-bf(k2+nx3,ky);
      bf(k2,ky)=rt2*t1;
      bf(k2+nx2,ky)=rt2*t2;
      bf(k2+nx,ky)=rt2*s1;
      bf(k2+nx3,ky)=rt2*s2;
      t1=bf(k2+m2,ky)+bf(k2+m2+nx2,ky);
      t2=bf(k2+m2,ky)-bf(k2+m2+nx2,ky);
      s1=bf(k2+m2+nx,ky)+bf(k2+m2+nx3,ky);
      s2=bf(k2+m2+nx,ky)-bf(k2+m2+nx3,ky);
      bf(k2+m2,ky)=rt2*t1;
      bf(k2+m2+nx2,ky)=rt2*t2;
      bf(k2+m2+nx,ky)=rt2*s1;
      bf(k2+m2+nx3,ky)=rt2*s2;
   end   
% 1-d idempotents
   t1=bf(1,ky)+bf(1+nx2,ky);
   t2=bf(1,ky)-bf(1+nx2,ky);
   t3=bf(1+nx,ky)+bf(1+nx3,ky);
   t4=i*(bf(1+nx,ky)-bf(1+nx3,ky));
   bf(1,ky) =.5*(t1+t3);
   bf(1+nx,ky) =.5*(t2+t4);
   bf(1+nx2,ky)=.5*(t1-t3);
   bf(1+nx3,ky)=.5*(t2-t4);
%
   t1=bf(1+m2,ky)  +bf(1+m2+nx2,ky);
   t2=bf(1+m2,ky)  -bf(1+m2+nx2,ky);
   t3=bf(1+m2+nx,ky)+bf(1+m2+nx3,ky);
   t4=i*(bf(1+m2+nx,ky)-bf(1+m2+nx3,ky));
   bf(1+m2,ky)   =.5*(t1+t3);
   bf(1+m2+nx,ky) =.5*(t2+t4);
   bf(1+m2+nx2,ky)=.5*(t1-t3);
   bf(1+m2+nx3,ky)=.5*(t2-t4);
end
%
tbf=bf.';
tbf(1:ny,:)=   sqrt(ny)*ifft(tbf(1:ny,:));
tbf(ny+1:ny2,:)=sqrt(ny)*ifft(tbf(ny+1:ny2,:));
for kx=1:nx4
   t1=tbf(1,kx);
   t2=tbf(1+ny,kx);
   tbf(1,kx)=rt2*(t1+t2);
   tbf(1+ny,kx)=rt2*(t1-t2);
   t1=tbf(1+m,kx);
   t2=tbf(1+m+ny,kx);
   tbf(1+m,kx)=rt2*(t1+t2);
   tbf(1+m+ny,kx)=rt2*(t1-t2);
end   
bf=tbf.';
%
%filtering by dimensionality
%
y1=zeros(nx4,ny2);
y21=zeros(nx4,ny2);
y22=zeros(nx4,ny2);
y41=zeros(nx4,ny2);
y42=zeros(nx4,ny2);
y8=zeros(nx4,ny2);
%
for kx=0:3
   kkx=nx*kx;
   for ky=0:1
      kky=ny*ky;
      y1(1+kkx,1+kky)=bf(1+kkx,1+kky);
      y1(1+m2+kkx,1+kky)=bf(1+m2+kkx,1+kky);
      y1(1+kkx,1+m+kky)=bf(1+kkx,1+m+kky);
      y1(1+m2+kkx,1+m+kky)=bf(1+m2+kkx,1+m+kky);
      for kx=1:m4-1
         k2=1+2*kx;
         y21(k2+kkx,1+kky)=bf(k2+kkx,1+kky);
         y21(k2+m2+kkx,1+kky)=bf(k2+m2+kkx,1+kky);
         y21(k2+kkx,1+m+kky)=bf(k2+kkx,1+m+kky);
         y21(k2+m2+kkx,1+m+kky)=bf(k2+m2+kkx,1+m+kky);
      end   
      for ky=2:m
         y22(1+kkx,ky+kky)=bf(1+kkx,ky+kky);
         y22(1+m2+kkx,ky+kky)=bf(1+m2+kkx,ky+kky);
         y22(1+kkx,ky+m+kky)=bf(1+kkx,ky+m+kky);
         y22(1+m2+kkx,ky+m+kky)=bf(1+m2+kkx,ky+m+kky);
         for kx=1:m4-1
            k2=1+2*kx;
            y41(k2+kkx,ky+kky)=bf(k2+kkx,ky+kky);
            y41(k2+m2+kkx,ky+kky)=bf(k2+m2+kkx,ky+kky);
            y41(k2+kkx,ky+m+kky)=bf(k2+kkx,ky+m+kky);
            y41(k2+m2+kkx,ky+m+kky)=bf(k2+m2+kkx,ky+m+kky);
         end   
      end   
      for kx=1:m2
         k2=2*kx;
         y42(k2+kkx,1+kky)=bf(k2+kkx,1+kky);
         y42(k2+kkx,1+m+kky)=bf(k2+kkx,1+m+kky);
      end   
   end   
end   
y8=bf-y41-y42-y21-y22-y1;      
