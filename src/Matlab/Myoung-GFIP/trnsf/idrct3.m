function y=idrct3(x,nx,ny)
%
% s2_4xn2_2 
% Use this for 2^n x 2M
%
ny2=ny+ny;
ny3=ny2+ny;
ny4=ny3+ny;
my2=ny/2;
my4=ny/4;
rt2=1/sqrt(2);
%
nx2=nx+nx;
nx3=nx2+nx;
nx4=nx3+nx;
mx2=nx/2;
mx4=nx/4;
%
for ky=1:ny4
   for k=1:mx4-1
      k2=1+2*k;
      t1=x(k2,ky)+x(k2+nx2,ky);
      t2=x(k2,ky)-x(k2+nx2,ky);
      x(k2,ky)=rt2*t1;
      x(k2+nx2,ky)=rt2*t2;
      t1=x(k2+mx2,ky)+x(k2+mx2+nx2,ky);
      t2=x(k2+mx2,ky)-x(k2+mx2+nx2,ky);
      x(k2+mx2,ky)=rt2*t1;
      x(k2+mx2+nx2,ky)=rt2*t2;
   end   
   t1=x(1,ky)+x(1+nx2,ky);
   t2=x(1,ky)-x(1+nx2,ky);
   t3=x(1+nx,ky)+x(1+nx3,ky);
   t4=-i*(x(1+nx,ky)-x(1+nx3,ky));
   x(1,ky) =.5*(t1+t3);
   x(1+nx,ky) =.5*(t2+t4);
   x(1+nx2,ky)=.5*(t1-t3);
   x(1+nx3,ky)=.5*(t2-t4);
%
   t1=x(1+mx2,ky)  +x(1+mx2+nx2,ky);
   t2=x(1+mx2,ky)  -x(1+mx2+nx2,ky);
   t3=x(1+mx2+nx,ky)+x(1+mx2+nx3,ky);
   t4=-i*(x(1+mx2+nx,ky)-x(1+mx2+nx3,ky));
   x(1+mx2,ky)   =.5*(t1+t3);
   x(1+mx2+nx,ky) =.5*(t2+t4);
   x(1+mx2+nx2,ky)=.5*(t1-t3);
   x(1+mx2+nx3,ky)=.5*(t2-t4);
end
%
x(1:nx,1:ny4)=1/sqrt(nx)*fft(x(1:nx,1:ny4));
x(1+nx:nx2,1:ny4)=1/sqrt(nx)*fft(x(1+nx:nx2,1:ny4));
x(1+nx2:nx3,1:ny4)=1/sqrt(nx)*fft(x(1+nx2:nx3,1:ny4));
x(1+nx3:nx4,1:ny4)=1/sqrt(nx)*fft(x(1+nx3:nx4,1:ny4));
%
tx=x.';
%
for kx=1:nx4
   for k=1:my4-1
      k2=1+2*k;
      t1=tx(k2,kx)+tx(k2+ny2,kx);
      t2=tx(k2,kx)-tx(k2+ny2,kx);
      tx(k2,kx)=rt2*t1;
      tx(k2+ny2,kx)=rt2*t2;
      t1=tx(k2+my2,kx)+tx(k2+my2+ny2,kx);
      t2=tx(k2+my2,kx)-tx(k2+my2+ny2,kx);
      tx(k2+my2,kx)=rt2*t1;
      tx(k2+my2+ny2,kx)=rt2*t2;
   end   
   t1=tx(1,kx)+tx(1+ny2,kx);
   t2=tx(1,kx)-tx(1+ny2,kx);
   t3=tx(1+ny,kx)+tx(1+ny3,kx);
   t4=-i*(tx(1+ny,kx)-tx(1+ny3,kx));
   tx(1,kx) =.5*(t1+t3);
   tx(1+ny,kx) =.5*(t2+t4);
   tx(1+ny2,kx)=.5*(t1-t3);
   tx(1+ny3,kx)=.5*(t2-t4);
%
   t1=tx(1+my2,kx)  +tx(1+my2+ny2,kx);
   t2=tx(1+my2,kx)  -tx(1+my2+ny2,kx);
   t3=tx(1+my2+ny,kx)+tx(1+my2+ny3,kx);
   t4=-i*(tx(1+my2+ny,kx)-tx(1+my2+ny3,kx));
   tx(1+my2,kx)   =.5*(t1+t3);
   tx(1+my2+ny,kx) =.5*(t2+t4);
   tx(1+my2+ny2,kx)=.5*(t1-t3);
   tx(1+my2+ny3,kx)=.5*(t2-t4);
end
%
tx(1:ny,1:nx4)=1/sqrt(nx)*fft(tx(1:ny,1:nx4));
tx(1+ny:ny2,1:nx4)=1/sqrt(nx)*fft(tx(1+ny:ny2,1:nx4));
tx(1+ny2:ny3,1:nx4)=1/sqrt(nx)*fft(tx(1+ny2:ny3,1:nx4));
tx(1+ny3:ny4,1:nx4)=1/sqrt(nx)*fft(tx(1+ny3:ny4,1:nx4));
%
%
y=tx.';
