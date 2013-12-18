function y=im_4n_2(x)
%
% s2_4xn2_2 
% Use this for 2^n x 2M
%
[nx4,ny2]=size(x);
nx=nx4/4;
nx2=nx+nx;
nx3=nx2+nx;
ny=ny2/2;
m=ny/2;
rt2=1/sqrt(2);
%
m2=nx/2;
m4=nx/4;
%
for ky=1:ny2
   for k=1:m4-1
      k2=1+2*k;
      t1=x(k2,ky)+x(k2+nx2,ky);
      t2=x(k2,ky)-x(k2+nx2,ky);
      s1=x(k2+nx,ky)+x(k2+nx3,ky);
      s2=x(k2+nx,ky)-x(k2+nx3,ky);
      x(k2,ky)=rt2*t1;
      x(k2+nx2,ky)=rt2*t2;
      x(k2+nx,ky)=rt2*s1;
      x(k2+nx3,ky)=rt2*s2;
      t1=x(k2+m2,ky)+x(k2+m2+nx2,ky);
      t2=x(k2+m2,ky)-x(k2+m2+nx2,ky);
      s1=x(k2+m2+nx,ky)+x(k2+m2+nx3,ky);
      s2=x(k2+m2+nx,ky)-x(k2+m2+nx3,ky);
      x(k2+m2,ky)=rt2*t1;
      x(k2+m2+nx2,ky)=rt2*t2;
      x(k2+m2+nx,ky)=rt2*s1;
      x(k2+m2+nx3,ky)=rt2*s2;
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
   t1=x(1+m2,ky)  +x(1+m2+nx2,ky);
   t2=x(1+m2,ky)  -x(1+m2+nx2,ky);
   t3=x(1+m2+nx,ky)+x(1+m2+nx3,ky);
   t4=-i*(x(1+m2+nx,ky)-x(1+m2+nx3,ky));
   x(1+m2,ky)   =.5*(t1+t3);
   x(1+m2+nx,ky) =.5*(t2+t4);
   x(1+m2+nx2,ky)=.5*(t1-t3);
   x(1+m2+nx3,ky)=.5*(t2-t4);
end
%
x(1:nx,1:ny2)=1/sqrt(nx)*fft(x(1:nx,1:ny2));
x(1+nx:nx2,1:ny2)=1/sqrt(nx)*fft(x(1+nx:nx2,1:ny2));
x(1+nx2:nx3,1:ny2)=1/sqrt(nx)*fft(x(1+nx2:nx3,1:ny2));
x(1+nx3:nx4,1:ny2)=1/sqrt(nx)*fft(x(1+nx3:nx4,1:ny2));
%
tx=x.';
%
for kx=1:nx4
   t1=tx(1,kx);
   t2=tx(1+ny,kx);
   tx(1,kx)=rt2*(t1+t2);
   tx(1+ny,kx)=rt2*(t1-t2);
   t1=tx(1+m,kx);
   t2=tx(1+m+ny,kx);
   tx(1+m,kx)=rt2*(t1+t2);
   tx(1+m+ny,kx)=rt2*(t1-t2);
end   
tx(1:ny,:)=   1/sqrt(ny)*fft(tx(1:ny,:));
tx(ny+1:ny2,:)=1/sqrt(ny)*fft(tx(ny+1:ny2,:));
%
y=tx.';
