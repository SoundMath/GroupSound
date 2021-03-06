function [y1,y2,y4]=dgn_22(x,n,gp)
% Degenerate 2 X 2
% gp: 1
n2=n+n;
m=n/2;
rt2=1/sqrt(2);
y1=zeros(n2,n2);
y2=zeros(n2,n2);
y4=zeros(n2,n2);
%
bf(1:n,1:n)=n*ifft2(x(1:n,1:n));
bf(1+n:n2,1:n)=n*ifft2(x(1+n:n2,1:n));
bf(1:n,1+n:n2)=n*ifft2(x(1:n,1+n:n2));
bf(1+n:n2,1+n:n2)=n*ifft2(x(1+n:n2,1+n:n2));
%
if (gp==1) % [-1 0;0 -1], [N/2-1 0; 0 N/2-1]
   d1=4;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=m+1;
   c1(2,2)=1;
   c1(1,3)=1;
   c1(2,3)=m+1;
   c1(1,4)=1+m;
   c1(2,4)=1+m;
   d2=m*m-4;
   for k=1:m/2-1
      c2(1,k)=2*k+1;
      c2(2,k)=1;
      c2(1,k+m/2-1)=2*k+m+1;
      c2(2,k+m/2-1)=1;
      c2(1,k+m-2)=2*k+1;
      c2(2,k+m-2)=1+m;
      c2(1,k+m/2+m-3)=2*k+m+1;
      c2(2,k+m/2+m-3)=1+m;
   end   
   cnt=n-4;
   for k1=1:m
      kk1=2*k1-1;
      for k2=2:m/2
         kk2=2*k2-1;
         cnt=cnt+1;
         c2(1,cnt)=kk1;
         c2(2,cnt)=kk2;
      end
      for k2=m/2+2:m
         kk2=2*k2-1;
         cnt=cnt+1;
         c2(1,cnt)=kk1;
         c2(2,cnt)=kk2;
      end
   end   
end   
%
for k=1:d1
   t1(1,k)=bf(c1(1,k),c1(2,k));
   t1(3,k)=bf(c1(1,k),c1(2,k)+n);
   t1(2,k)=bf(c1(1,k)+n,c1(2,k));
   t1(4,k)=bf(c1(1,k)+n,c1(2,k)+n);
end      
t1=f22(t1,d1);
for k=1:d1
   bf(c1(1,k),c1(2,k))=t1(1,k);
   bf(c1(1,k),c1(2,k)+n)=t1(3,k);
   bf(c1(1,k)+n,c1(2,k))=t1(2,k);
   bf(c1(1,k)+n,c1(2,k)+n)=t1(4,k);
   y1(c1(1,k),c1(2,k))=t1(1,k);
   y1(c1(1,k),c1(2,k)+n)=t1(3,k);
   y1(c1(1,k)+n,c1(2,k))=t1(2,k);
   y1(c1(1,k)+n,c1(2,k)+n)=t1(4,k);
end
for k=1:d2
   t2(1,k)=bf(c2(1,k),c2(2,k));
   t2(2,k)=bf(c2(1,k)+n,c2(2,k));
end   
t2=f2(t2,d2);
for k=1:d2
   k1=c2(1,k);
   k2=c2(2,k);
   bf(k1,k2)=t2(1,k);
   bf(k1+n,k2)=t2(2,k);
   y2(k1,k2)=bf(k1,k2);
   y2(k1+n,k2)=bf(k1+n,k2);
   y2(k1,k2+n)=bf(k1,k2+n);
   y2(k1+n,k2+n)=bf(k1+n,k2+n);
end
%
y4=bf-y1-y2;
%
