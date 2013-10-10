function g=dd2(x,gp)
% Use this for even n:
[nx,ny]=size(x);
n=min(nx,ny);
m=n/2;
n2=n+n;
%
%
if (gp==1) % (y,x)
   for k1=1:n
      for k2=1:n
         kk1=k2;
         kk2=k1;
         if (nx > ny)
            g(kk1+n,kk2)=x(k1,k2);
            g(kk1,kk2)=x(k1+n,k2);
         else
            g(kk1,kk2+n)=x(k1,k2);
            g(kk1,kk2)=x(k1,k2+n);
         end   
      end   
   end   
end
%
if (gp==2) % (x+y,-y)
   for k1=1:n
      for k2=1:n
         kk1=mod(k1+k2-2,n)+1;
         kk2=mod(n-k2+1,n)+1;
         if (nx > ny)
            g(kk1+n,kk2)=x(k1,k2);
            g(kk1,kk2)=x(k1+n,k2);
         else
            g(kk1,kk2+n)=x(k1,k2);
            g(kk1,kk2)=x(k1,k2+n);
         end   
      end   
   end   
end
%
if (gp==3) % (-x-y,y)
   for k1=1:n
      for k2=1:n
         kk1=mod(n+n-k1-k2+2,n)+1;
         kk2=k2;
         if (nx > ny)
            g(kk1+n,kk2)=x(k1,k2);
            g(kk1,kk2)=x(k1+n,k2);
         else
            g(kk1,kk2+n)=x(k1,k2);
            g(kk1,kk2)=x(k1,k2+n);
         end   
      end   
   end   
end
%
if (gp==4) % (x,x-y)
   for k1=1:n
      for k2=1:n
         kk1=k1;
         kk2=mod(k1+n-k2,n)+1;
         if (nx > ny)
            g(k1,k2)=x(kk1+n,kk2);
            g(k1+n,k2)=x(kk1,kk2);
         else
            g(k1,k2+n)=x(kk1,kk2);
            g(k1,k2)=x(kk1,kk2+n);
         end   
      end   
   end   
end
%
if (gp==5) % (x,-x-y)
   for k1=1:n
      for k2=1:n
         kk1=k1;
         kk2=mod(n+n-k1-k2+2,n)+1;
         if (nx > ny)
            g(kk1+n,kk2)=x(k1,k2);
            g(kk1,kk2)=x(k1+n,k2);
         else
            g(kk1,kk2+n)=x(k1,k2);
            g(kk1,kk2)=x(k1,k2+n);
         end   
      end   
   end   
end
%
if (gp==6) % (-x,-x+y)
   for k1=1:n
      for k2=1:n
         kk1=mod(n-k1+1,n)+1;
         kk2=mod(n-k1+k2,n)+1;
         if (nx > ny)
            g(kk1+n,kk2)=x(k1,k2);
            g(kk1,kk2)=x(k1+n,k2);
         else
            g(kk1,kk2+n)=x(k1,k2);
            g(kk1,kk2)=x(k1,k2+n);
         end   
      end   
   end   
end
%
if (gp==7) % (-x,y)
   for k1=1:n
      for k2=1:n
         kk1=mod(n-k1+1,n)+1;
         kk2=k2;
         if (nx > ny)
            g(kk1+n,kk2)=x(k1,k2);
            g(kk1,kk2)=x(k1+n,k2);
         else
            g(kk1,kk2+n)=x(k1,k2);
            g(kk1,kk2)=x(k1,k2+n);
         end   
      end   
   end   
end
%
%
%
