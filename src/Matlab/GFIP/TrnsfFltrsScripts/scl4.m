function [y1,y2,y4]=scl4(x,n,gp)
% Use this for even n:
n2=n+n;
m=n/2;
l=n/4;
rt2=sqrt(2);
y1=zeros(n2,n2);
y2=zeros(n2,n2);
y4=zeros(n2,n2);
%
bf(1:n,1:n)=n*ifft2(x(1:n,1:n));
bf(1+n:n2,1:n)=n*ifft2(x(1+n:n2,1:n));
bf(1:n,1+n:n2)=n*ifft2(x(1:n,1+n:n2));
bf(1+n:n2,1+n:n2)=n*ifft2(x(1+n:n2,1+n:n2));
%
if (gp==1) %[n/4+1 0;0 n/4+1]
   d1=l*l;
   for k2=0:l-1
      kk=k2*l;
      for k1=0:l-1
         c1(1,k1+1+kk)=4*k1+1;
         c1(2,k1+1+kk)=4*k2+1;
      end
   end   
   d2=m*m-d1;
   for k2=0:l-1
      kk=3*l*k2;
      for k1=0:l-1
         c2(1,k1+1+kk)=4*k1+1;
         c2(2,k1+1+kk)=4*k2+3;
         c2(1,k1+1+l+kk)=4*k1+3;
         c2(2,k1+1+l+kk)=4*k2+1;
         c2(1,k1+1+m+kk)=4*k1+3;
         c2(2,k1+1+m+kk)=4*k2+3;
      end   
   end   
end   
%
if (gp==2) %[n/4+1 0;0 n/4-1]
   d1=m;
   for k=0:l-1
      c1(1,k+1)=4*k+1;
      c1(2,k+1)=1;
      c1(1,k+1+l)=4*k+1;
      c1(2,k+1+l)=1+m;
   end   
   d2=m*m-d1;
   for k=0:l-1
      c2(1,k+1)=4*k+3;
      c2(2,k+1)=1;
      c2(1,k+1+l)=4*k+3;
      c2(2,k+1+l)=1+m;
   end   
   for k2=1:l-1
      for k1=0:m-1
         c2(1,k1+1+m*k2)=2*k1+1;
         c2(2,k1+1+m*k2)=2*k2+1;
         c2(1,k1+1+m*(k2+l-1))=2*k1+1;
         c2(2,k1+1+m*(k2+l-1))=2*k2+1+m;
      end   
   end   
end   
%
if (gp==3) %[n/4-1 0;0 n/4+1]
   d1=m;
   for k=0:l-1
      c1(1,k+1)=1;
      c1(2,k+1)=4*k+1;
      c1(1,k+1+l)=1+m;
      c1(2,k+1+l)=4*k+1;
   end   
   d2=m*m-d1;
   for k=0:l-1
      c2(1,k+1)=1;
      c2(2,k+1)=4*k+3;
      c2(1,k+1+l)=1+m;
      c2(2,k+1+l)=4*k+3;
   end   
   for k2=1:l-1
      for k1=0:m-1
         c2(1,k1+1+m*k2)=2*k2+1;
         c2(2,k1+1+m*k2)=2*k1+1;
         c2(1,k1+1+m*(k2+l-1))=2*k2+1+m;
         c2(2,k1+1+m*(k2+l-1))=2*k1+1;
      end   
   end   
end   
%
if (gp==4) %[n/4+1 0;0 n/2+1]
   d1=l*m;
   for k1=0:l-1
      kk=k1*m;
      for k2=0:m-1
         c1(1,k2+1+kk)=4*k1+1;
         c1(2,k2+1+kk)=2*k2+1;
      end   
   end   
   d2=n*m-d1;
   for k1=0:l-1
      kk=k1*m;
      for k2=0:m-1
         c2(1,k2+1+kk)=4*k1+1;
         c2(2,k2+1+kk)=2*k2+2;
      end   
   end   
   for k1=0:l-1
      kk=n*k1+d1;
      for k2=1:n
         c2(1,k2+kk)=4*k1+3;
         c2(2,k2+kk)=k2;
      end
   end   
end   
%
if (gp==5) %[n/2+1 0;0 n/4+1]
   d1=l*m;
   for k1=0:l-1
      kk=k1*m;
      for k2=0:m-1
         c1(1,k2+1+kk)=2*k2+1;
         c1(2,k2+1+kk)=4*k1+1;
      end   
   end   
   d2=n*m-d1;
   for k1=0:l-1
      kk=k1*m;
      for k2=0:m-1
         c2(1,k2+1+kk)=2*k2+2;
         c2(2,k2+1+kk)=4*k1+1;
      end   
   end   
   for k1=0:l-1
      kk=n*k1+d1;
      for k2=1:n
         c2(1,k2+kk)=k2;
         c2(2,k2+kk)=4*k1+3;
      end
   end   
end   
%
if (gp==6) %[n/4-1 0;0 n/2+1]
   d1=n;
   for k=1:m
      c1(1,k)=1;
      c1(2,k)=2*k-1;
      c1(1,k+m)=m+1;
      c1(2,k+m)=2*k-1;
   end
   d2=m*n-n;
   for k=1:m
      c2(1,k)=1;
      c2(2,k)=2*k;
      c2(1,k+m)=m+1;
      c2(2,k+m)=2*k;
   end
   for k1=1:l-1
      for k2=1:n
         c2(1,k2+n*k1)=2*k1+1;
         c2(2,k2+n*k1)=k2;
         c2(1,k2+n*(k1+l-1))=2*(k1+l)+1;
         c2(2,k2+n*(k1+l-1))=k2;
      end   
   end   
end   
%
%
for k=1:d1
   t1(1,k)=bf(c1(1,k),c1(2,k));
   t1(2,k)=bf(c1(1,k)+n,c1(2,k));
   t1(3,k)=bf(c1(1,k),c1(2,k)+n);
   t1(4,k)=bf(c1(1,k)+n,c1(2,k)+n);
end   
t1=2*ifft(t1);
for k=1:d1
   bf(c1(1,k),c1(2,k))=t1(1,k);
   bf(c1(1,k)+n,c1(2,k))=t1(2,k);
   bf(c1(1,k),c1(2,k)+n)=t1(3,k);
   bf(c1(1,k)+n,c1(2,k)+n)=t1(4,k);
   y1(c1(1,k),c1(2,k))=t1(1,k);
   y1(c1(1,k)+n,c1(2,k))=t1(2,k);
   y1(c1(1,k),c1(2,k)+n)=t1(3,k);
   y1(c1(1,k)+n,c1(2,k)+n)=t1(4,k);
end   
for k=1:d2
   t2(1,k)=bf(c2(1,k),c2(2,k));
   t2(2,k)=bf(c2(1,k),c2(2,k)+n);
end   
t2=rt2*ifft(t2);
for k=1:d2
   k1=c2(1,k);
   k2=c2(2,k);
   bf(k1,k2)=t2(1,k);
   bf(k1,k2+n)=t2(2,k);
   y2(k1,k2)=bf(k1,k2);
   y2(k1+n,k2)=bf(k1+n,k2);
   y2(k1,k2+n)=bf(k1,k2+n);
   y2(k1+n,k2+n)=bf(k1+n,k2+n);
end
y4=bf-y1-y2;
