function [f1,f2,f3]=dd4(x,gp)
% n must be a multiple of 4
[n2,tem]=size(x);
n=n2/2;
nn=n*n;
nn2=nn+nn;
n2=n+n;
m=n/2;
l=n/4;
%
if (gp==102)                    %[m l+1;l+1 0]
   for k1=1:n                   %[m+1 m;m m+1]
      for k2=1:n                %[0 m+l+1;m+l+1 m]  
         kk1=mod(m*(k1-1)+(l+1)*(k2-1),n)+1;
         kk2=mod((l+1)*(k1-1),n)+1;
         f1(kk1+n,kk2)=x(k1,k2);
         f1(kk1,kk2+n)=x(k1+n,k2);
         f1(kk1+n,kk2+n)=x(k1,k2+n);
         f1(kk1,kk2)=x(k1+n,k2+n);
         kk1=mod((m+1)*(k1-1)+m*(k2-1),n)+1;
         kk2=mod(m*(k1-1)+(m+1)*(k2-1),n)+1;
         f2(kk1+n,kk2)=x(k1,k2);
         f2(kk1,kk2+n)=x(k1+n,k2);
         f2(kk1+n,kk2+n)=x(k1,k2+n);
         f2(kk1,kk2)=x(k1+n,k2+n);
         kk1=mod((m+l+1)*(k2-1),n)+1;
         kk2=mod((m+l+1)*(k1-1)+m*(k2-1),n)+1;
         f3(kk1+n,kk2)=x(k1,k2);
         f3(kk1,kk2+n)=x(k1+n,k2);
         f3(kk1+n,kk2+n)=x(k1,k2+n);
         f3(kk1,kk2)=x(k1+n,k2+n);
      end
   end   
end   
%
if (gp==103)                    %[m l-1;l-1 0]
   for k1=1:n                   %[m+1 m;m m+1]
      for k2=1:n                %[0 m+l-1;m+l-1 m]  
         kk1=mod(m*(k1-1)+(l-1)*(k2-1),n)+1;
         kk2=mod((l-1)*(k1-1),n)+1;
         f1(kk1+n,kk2)=x(k1,k2);
         f1(kk1,kk2+n)=x(k1+n,k2);
         f1(kk1+n,kk2+n)=x(k1,k2+n);
         f1(kk1,kk2)=x(k1+n,k2+n);
         kk1=mod((m+1)*(k1-1)+m*(k2-1),n)+1;
         kk2=mod(m*(k1-1)+(m+1)*(k2-1),n)+1;
         f2(kk1+n,kk2)=x(k1,k2);
         f2(kk1,kk2+n)=x(k1+n,k2);
         f2(kk1+n,kk2+n)=x(k1,k2+n);
         f2(kk1,kk2)=x(k1+n,k2+n);
         kk1=mod((m+l-1)*(k2-1),n)+1;
         kk2=mod((m+l-1)*(k1-1)+m*(k2-1),n)+1;
         f3(kk1+n,kk2)=x(k1,k2);
         f3(kk1,kk2+n)=x(k1+n,k2);
         f3(kk1+n,kk2+n)=x(k1,k2+n);
         f3(kk1,kk2)=x(k1+n,k2+n);
      end
   end   
end
