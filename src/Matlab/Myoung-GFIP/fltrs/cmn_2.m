function y=cnv_2(u,v,gp);
%nx=4;
%ny=4;
%ny2=2*ny;
%gp=2;
%u=rand(nx,ny2);
%v=rand(nx,ny2);
[nx,ny2]=size(u);
mx=nx/2;
ny=ny2/2;
my=ny/2;
nnx=linspace(0,nx-1,nx);
nny=linspace(0,ny-1,ny);
%
if (gp==1) % (x,-y)
   actx=nnx+1;
   acty=mod(ny-nny,ny)+1;
end
%
if (gp==2) % (x,(my+1)y)
   actx=nnx+1;
   acty=mod((my+1)*nny,ny)+1;
end
if (gp==3) % (x,(my-1)y);
   actx=nnx+1;
   acty=mod((my-1)*nny,ny)+1;
end
%
if (gp==4) % (-x,y)
   actx=mod(nx-nnx,nx)+1;
   acty=nny+1;
end
%
if (gp==5) % (-x,-y)
   actx=mod(nx-nnx,nx)+1;
   acty=mod(ny-nny,ny)+1;
end
%
if (gp==6) % (-x,(my+1)y)
   actx=mod(nx-nnx,nx)+1;
   acty=mod((my+1)*nny,ny)+1;
end
%
if (gp==7) % (-x,(my-1)y)
   actx=mod(nx-nnx,nx)+1;
   acty=mod((my-1)*nny,ny)+1;
end
%
if (gp==8) % ((mx+1)x,y)
   actx=mod((mx+1)*nnx,nx)+1;
   acty=nny+1;
end
%
if (gp==9) % ((mx+1)x,-y)
   actx=mod((mx+1)*nnx,nx)+1;
   acty=mod(ny-nny,ny)+1;
end
%
if (gp==10) % ((mx+1)x,(my+1)y)
   actx=mod((mx+1)*nnx,nx)+1;
   acty=mod((my+1)*nny,ny)+1;
end
%
if (gp==11) % ((mx+1)x,(my-1)y)
   actx=mod((mx+1)*nnx,nx)+1;
   acty=mod((my-1)*nny,ny)+1;
end
%
if (gp==12) % ((mx-1)x,y)
   actx=mod((mx-1)*nnx,nx)+1;
   acty=nny+1;
end
%
if (gp==13) % ((mx-1)x,-y)
   actx=mod((mx-1)*nnx,nx)+1;
   acty=mod(ny-nny,ny)+1;
end
%
if (gp==14) % ((mx-1)x,(my+1)y)
   actx=mod((mx-1)*nnx,nx)+1;
   acty=mod((my+1)*nny,ny)+1;
end
%
if (gp==15) % ((mx-1)x,(my-1)y)
   actx=mod((mx-1)*nnx,nx)+1;
   acty=mod((my-1)*nny,ny)+1;
end
%
%
ur(1:nx,1:ny)=u(1:nx,1:ny);
for ky=1:ny
   for kx=1:nx
      ur(kx,ky+ny)=u(actx(kx),acty(ky)+ny);
   end
end   
%
[d11,d12]=mn_2(ur,gp);
[d21,d22]=mn_2(v,gp);
%
c(:,1:ny)=d12(:,1:ny).*d22(:,1:ny)+d12(:,1+ny:ny2).*d22(:,1+ny:ny2);
c(:,1+ny:ny2)=d12(:,1+ny:ny2).*d22(:,1:ny)+d12(:,1:ny).*d22(:,1+ny:ny2);
c=c+sqrt(2)*d11.*d21;
%
y=sqrt(nx*ny)*imn_2(c,gp);
