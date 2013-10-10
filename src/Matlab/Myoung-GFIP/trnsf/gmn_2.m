function y=gmn_2(u,gp);
[nx,ny2]=size(u);
mx=nx/2;
ny=ny2/2;
my=ny/2;
nnx=linspace(0,nx-1,nx);
nny=linspace(0,ny-1,ny);
if (gp==1) % (x,-y)
   actx=nnx;
   acty=mod(ny-nny,ny);
end
%
if (gp==2) % (x,(my+1)y)
   actx=nnx;
   acty=mod((my+1)*nny,ny);
end
if (gp==3) % (x,(my-1)y);
   actx=nnx;
   acty=mod((my-1)*nny,ny);
end
%
if (gp==4) % (-x,y)
   actx=mod(nx-nnx,nx);
   acty=nny;
end
%
if (gp==5) % (-x,-y)
   actx=mod(nx-nnx,nx);
   acty=mod(ny-nny,ny);
end
%
if (gp==6) % (-x,(my+1)y)
   actx=mod(nx-nnx,nx);
   acty=mod((my+1)*nny,ny);
end
%
if (gp==7) % (-x,(my-1)y)
   actx=mod(nx-nnx,nx);
   acty=mod((my-1)*nny,ny);
end
%
if (gp==8) % ((mx+1)x,y)
   actx=mod((mx+1)*nnx,nx);
   acty=nny;
end
%
if (gp==9) % ((mx+1)x,-y)
   actx=mod((mx+1)*nnx,nx);
   acty=mod(ny-nny,ny);
end
%
if (gp==10) % ((mx+1)x,(my+1)y)
   actx=mod((mx+1)*nnx,nx);
   acty=mod((my+1)*nny,ny);
end
%
if (gp==11) % ((mx+1)x,(my-1)y)
   actx=mod((mx+1)*nnx,nx);
   acty=mod((my-1)*nny,ny);
end
%
if (gp==12) % ((mx-1)x,y)
   actx=mod((mx-1)*nnx,nx);
   acty=nny;
end
%
if (gp==13) % ((mx-1)x,-y)
   actx=mod((mx-1)*nnx,nx);
   acty=mod(ny-nny,ny);
end
%
if (gp==14) % ((mx-1)x,(my+1)y)
   actx=mod((mx-1)*nnx,nx);
   acty=mod((my+1)*nny,ny);
end
%
if (gp==15) % ((mx-1)x,(my-1)y)
   actx=mod((mx-1)*nnx,nx);
   acty=mod((my-1)*nny,ny);
end
%
%
%
u1=cnv2mt(u(1:nx,1:ny));
u2=cnv2mt(u(1:nx,1+ny:ny2));
%
for k2=0:ny-1
   ayc=nx*acty(k2+1);
   for k1=0:nx-1
      kk=k1+1+nx*k2;
      ak=actx(k1+1)+1+ayc;
      for l2=0:ny-1
         ayr=nx*acty(l2+1);
         for l1=0:nx-1
            ll=l1+1+nx*l2;
            al=actx(l1+1)+1+ayr;
            ur(al,ak)=u2(ll,kk);      
         end
      end   
   end
end   
%
y=[u1 ur;ur u1];

