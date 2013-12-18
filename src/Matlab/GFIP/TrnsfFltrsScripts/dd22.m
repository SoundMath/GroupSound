function g=dd22(x,gp,act)
% Use this for even n:
[n2,tem]=size(x);
n=n2/2;
m=n/2;
%
%
if (gp==11) % (-x,-y), (y,x)
   for k1=1:n
      for k2=1:n
         if (act==1)
            kk1=mod(n-(k1-1),n)+1;
            kk2=mod(n-(k2-1),n)+1;
            g(kk1,kk2+n)=x(k1,k2);
            g(kk1,kk2)=x(k1,k2+n);
            g(kk1+n,kk2+n)=x(k1+n,k2);
            g(kk1+n,kk2)=x(k1+n,k2+n);
         else
            kk1=k2;
            kk2=k1;
            g(kk1+n,kk2)=x(k1,k2);
            g(kk1+n,kk2+n)=x(k1,k2+n);
            g(kk1,kk2)=x(k1+n,k2);
            g(kk1,kk2+n)=x(k1+n,k2+n);
         end   
      end   
   end   
end
%
if (gp==13) % (-x,-y), (x,x-y)
   for k1=1:n
      for k2=1:n
         if (act==1)
            kk1=mod(n-(k1-1),n)+1;
            kk2=mod(n-(k2-1),n)+1;
            g(kk1,kk2+n)=x(k1,k2);
            g(kk1,kk2)=x(k1,k2+n);
            g(kk1+n,kk2+n)=x(k1+n,k2);
            g(kk1+n,kk2)=x(k1+n,k2+n);
         else
            kk1=k1;
            kk2=mod(n+k1-k2,n)+1;
            g(kk1+n,kk2)=x(k1,k2);
            g(kk1+n,kk2+n)=x(k1,k2+n);
            g(kk1,kk2)=x(k1+n,k2);
            g(kk1,kk2+n)=x(k1+n,k2+n);
         end   
      end   
   end   
end
%
