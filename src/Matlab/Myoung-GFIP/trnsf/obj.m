function yy=obj(s,nx,ny)
if (s==0)
   yy(1:ny,1)=1;
   yy(1,1:nx)=1;
   yy(ny,1:nx)=1;
   yy(1:ny,nx)=1;
end
%
if (s==1)
   for k=1:nx
      yy(nx-k+1,k)=1;
      yy(2*nx-k+1,nx+k)=1;
   end   
   for k=1:nx-1
      yy(nx+k,k+1)=1;
      yy(k+1,nx+k)=1;
   end   
end
