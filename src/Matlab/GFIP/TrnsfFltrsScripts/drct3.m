function [y1,y12,y21,y22,y14,y41,y24,y42,y44]=drct3(x,nx,ny)
%
% (C_n sdp C_4) X (C_k sdp C_4)
% Use this for 2^n x 2^k
%
rt2=1/sqrt(2);
%
nx2=nx+nx;
nx3=nx2+nx;
nx4=nx3+nx;
mx2=nx/2;
mx4=nx/4;
ny2=ny+ny;
ny3=ny2+ny;
ny4=ny3+ny;
my2=ny/2;
my4=ny/4;
%
y1=zeros(nx4,ny4);
y12=zeros(nx4,ny4);
y21=zeros(nx4,ny4);
y22=zeros(nx4,ny4);
y14=zeros(nx4,ny4);
y41=zeros(nx4,ny4);
y24=zeros(nx4,ny4);
y42=zeros(nx4,ny4);
y44=zeros(nx4,ny4);
%
bf(1:nx,1:ny4)=sqrt(nx)*ifft(x(1:nx,1:ny4));
bf(1+nx:nx2,1:ny4)=sqrt(nx)*ifft(x(1+nx:nx2,1:ny4));
bf(1+nx2:nx3,1:ny4)=sqrt(nx)*ifft(x(1+nx2:nx3,1:ny4));
bf(1+nx3:nx4,1:ny4)=sqrt(nx)*ifft(x(1+nx3:nx4,1:ny4));
%
for ky=1:ny4
% 2-d idempotents
   for k=1:mx4-1
      k2=1+2*k;
      t1=bf(k2,ky)+bf(k2+nx2,ky);
      t2=bf(k2,ky)-bf(k2+nx2,ky);
      bf(k2,ky)=rt2*t1;
      bf(k2+nx2,ky)=rt2*t2;
      t1=bf(k2+mx2,ky)+bf(k2+mx2+nx2,ky);
      t2=bf(k2+mx2,ky)-bf(k2+mx2+nx2,ky);
      bf(k2+mx2,ky)=rt2*t1;
      bf(k2+mx2+nx2,ky)=rt2*t2;
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
   t1=bf(1+mx2,ky)  +bf(1+mx2+nx2,ky);
   t2=bf(1+mx2,ky)  -bf(1+mx2+nx2,ky);
   t3=bf(1+mx2+nx,ky)+bf(1+mx2+nx3,ky);
   t4=i*(bf(1+mx2+nx,ky)-bf(1+mx2+nx3,ky));
   bf(1+mx2,ky)   =.5*(t1+t3);
   bf(1+mx2+nx,ky) =.5*(t2+t4);
   bf(1+mx2+nx2,ky)=.5*(t1-t3);
   bf(1+mx2+nx3,ky)=.5*(t2-t4);
end
%
tbf=bf.';
tbf(1:ny,1:nx4)=   sqrt(ny)*ifft(tbf(1:ny,1:nx4));
tbf(ny+1:ny2,1:nx4)=sqrt(ny)*ifft(tbf(ny+1:ny2,1:nx4));
tbf(ny2+1:ny3,1:nx4)=sqrt(ny)*ifft(tbf(ny2+1:ny3,1:nx4));
tbf(ny3+1:ny4,1:nx4)=sqrt(ny)*ifft(tbf(ny3+1:ny4,1:nx4));
%
for kx=1:nx4
% 2-d idempotents
   for k=1:my4-1
      k2=1+2*k;
      t1=tbf(k2,kx)+tbf(k2+ny2,kx);
      t2=tbf(k2,kx)-tbf(k2+ny2,kx);
      tbf(k2,kx)=rt2*t1;
      tbf(k2+ny2,kx)=rt2*t2;
      t1=tbf(k2+my2,kx)+tbf(k2+my2+ny2,kx);
      t2=tbf(k2+my2,kx)-tbf(k2+my2+ny2,kx);
      tbf(k2+my2,kx)=rt2*t1;
      tbf(k2+my2+ny2,kx)=rt2*t2;
   end   
% 1-d idempotents
   t1=tbf(1,kx)+tbf(1+ny2,kx);
   t2=tbf(1,kx)-tbf(1+ny2,kx);
   t3=tbf(1+ny,kx)+tbf(1+ny3,kx);
   t4=i*(tbf(1+ny,kx)-tbf(1+ny3,kx));
   tbf(1,kx) =.5*(t1+t3);
   tbf(1+ny,kx) =.5*(t2+t4);
   tbf(1+ny2,kx)=.5*(t1-t3);
   tbf(1+ny3,kx)=.5*(t2-t4);
%
   t1=tbf(1+my2,kx)  +tbf(1+my2+ny2,kx);
   t2=tbf(1+my2,kx)  -tbf(1+my2+ny2,kx);
   t3=tbf(1+my2+ny,kx)+tbf(1+my2+ny3,kx);
   t4=i*(tbf(1+my2+ny,kx)-tbf(1+my2+ny3,kx));
   tbf(1+my2,kx)   =.5*(t1+t3);
   tbf(1+my2+ny,kx) =.5*(t2+t4);
   tbf(1+my2+ny2,kx)=.5*(t1-t3);
   tbf(1+my2+ny3,kx)=.5*(t2-t4);
end
bf=tbf.';
%
%filtering by dimensionality
%
for kx=0:3
   kkx=nx*kx;
   for ky=0:3
      kky=ny*ky;
      y1(1+kkx,1+kky)=bf(1+kkx,1+kky);
      y1(1+mx2+kkx,1+kky)=bf(1+mx2+kkx,1+kky);
      y1(1+kkx,1+my2+kky)=bf(1+kkx,1+my2+kky);
      y1(1+mx2+kkx,1+my2+kky)=bf(1+mx2+kkx,1+my2+kky);
      for kx=1:mx4-1
         k2=1+2*kx;
         y21(k2+kkx,1+kky)=bf(k2+kkx,1+kky);
         y21(k2+mx2+kkx,1+kky)=bf(k2+mx2+kkx,1+kky);
         y21(k2+kkx,1+my2+kky)=bf(k2+kkx,1+my2+kky);
         y21(k2+mx2+kkx,1+my2+kky)=bf(k2+mx2+kkx,1+my2+kky);
      end   
      for ky=1:my4-1
         k2=1+2*ky;
         y12(1+kkx,k2+kky)=bf(1+kkx,k2+kky);
         y12(1+kkx,k2+my2+kky)=bf(1+kkx,k2+my2+kky);
         y12(1+mx2+kkx,k2+kky)=bf(1+mx2+kkx,k2+kky);
         y12(1+mx2+kkx,k2+my2+kky)=bf(1+mx2+kkx,k2+my2+kky);
      end   
      for ky=1:my4-1
         ky2=1+2*ky;
         for kx=1:mx4-1
            kx2=1+2*kx;
            y22(kx2+kkx,ky2+kky)=bf(kx2+kkx,ky2+kky);
            y22(kx2+mx2+kkx,ky2+kky)=bf(kx2+mx2+kkx,ky2+kky);
            y22(kx2+kkx,ky2+my2+kky)=bf(kx2+kkx,ky2+my2+kky);
            y22(kx2+mx2+kkx,ky2+my2+kky)=bf(kx2+mx2+kkx,ky2+my2+kky);
         end   
      end
      for ky=1:my2
         k2=2*ky;
         y14(1+kkx,k2+kky)=bf(1+kkx,k2+kky);
         y14(1+mx2+kkx,k2+kky)=bf(1+mx2+kkx,k2+kky);
         for kx=1:mx4-1
            kx2=1+2*kx;
            y24(kx2+kkx,k2+kky)=bf(kx2+kkx,k2+kky);
            y24(kx2+mx2+kkx,k2+kky)=bf(kx2+mx2+kkx,k2+kky);
         end   
      end   
      for kx=1:mx2
         k2=2*kx;
         y41(k2+kkx,1+kky)=bf(k2+kkx,1+kky);
         y41(k2+kkx,1+my2+kky)=bf(k2+kkx,1+my2+kky);
         for ky=1:my4-1
            ky2=1+2*ky;
            y42(k2+kkx,ky2+kky)=bf(k2+kkx,ky2+kky);
            y42(k2+kkx,ky2+my2+kky)=bf(k2+kkx,ky2+my2+kky);
         end   
      end   
   end
end   
y44=bf-y1-y21-y12-y22-y41-y14-y42-y24;