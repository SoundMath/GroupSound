function y=in2n2(ff,nx,ny,gx,gy)
%
nx2=nx*2;
mx=nx/2;
ny2=ny*2;
my=ny/2;
%
if (gx==1)
   d1x=2;
   c1x(1)=1;
   c1x(2)=1+mx;
end
%
if (gx==2)
   d1x=mx;
   for k=1:mx
      c1x(k)=2*k-1;
   end   
end
%
if (gy==1)
   d1y=2;
   c1y(1)=1;
   c1y(2)=1+my;
end
%
if (gy==2)
   d1y=my;
   for k=1:my
      c1y(k)=2*k-1;
   end   
end
%
for k=1:ny2
   for k1=1:d1x
      tx(1,k1)=ff(c1x(k1),k);
      tx(2,k1)=ff(c1x(k1)+nx,k);
   end
   tx=ft2(tx,d1x);
   for k1=1:d1x
      ff(c1x(k1),k)=tx(1,k1);
      ff(c1x(k1)+nx,k)=tx(2,k1);
   end
end   
%
ff(1:nx,:)=fft(ff(1:nx,:));
ff(1+nx:nx2,:)=fft(ff(1+nx:nx2,:));
ff=ff.';
%
for k=1:nx2
   for k1=1:d1y
      ty(1,k1)=ff(c1y(k1),k);
      ty(2,k1)=ff(c1y(k1)+ny,k);
   end
   ty=ft2(ty,d1y);
   for k1=1:d1y
      ff(c1y(k1),k)=ty(1,k1);
      ff(c1y(k1)+ny,k)=ty(2,k1);
   end
end
%
ff(1:ny,:)=fft(ff(1:ny,:));
ff(1+ny:ny2,:)=fft(ff(1+ny:ny2,:));
y=(1/sqrt(nx*ny))*ff.';
