function [y1,y2,y3,y6]=mm6(x)
% Use this for n = powers of 2
[n3,tem1,tem2]=size(x);
n=n3/3;
rt2=sqrt(2);
rt3=sqrt(3);
rt6=sqrt(6);
y1=zeros(n3,n3,6);
y2=zeros(n3,n3,6);
y3=zeros(n3,n3,6);
y6=zeros(n3,n3,6);
%
d1=3;
d2=6;
d3=n3*n-3;
%
for k=1:6
   bf(1:n3,1:n3,k)=n*ifft2(x(1:n3,1:n3,k));
end   
%
c1(1,1)=1;
c1(2,1)=1;
c1(1,2)=n+1;
c1(2,2)=2*n+1;
c1(1,3)=2*n+1;
c1(2,3)=n+1;
%
c2(1,1)=1;
c2(2,1)=n+1;
c2(1,2)=1;
c2(2,2)=2*n+1;
c2(1,3)=n+1;
c2(2,3)=1;
c2(1,4)=n+1;
c2(2,4)=n+1;
c2(1,5)=2*n+1;
c2(2,5)=1;
c2(1,6)=2*n+1;
c2(2,6)=2*n+1;
%
q=floor(n/3);
r=n-3*q;
tb=zeros(1,n3+2);
for k=0:n-1
   tb(1,3*k+1)=0;
   tb(1,3*k+2)=2;
   tb(1,3*k+3)=1;
end   
tb(1,n3+1)=0;
tb(1,n3+2)=2;
%
nn=n*n;
for k2=1:n-1
   c3(1,k2)=1;
   c3(2,k2)=3*k2+1;
end
%
for k2=0:2*q+r-2
   c3(1,k2+nn)=n+1;
   c3(2,k2+nn)=3*k2+tb(n+1)+1;
end   
for k2=2*q+r:n-1
   c3(1,k2+nn-1)=n+1;
   c3(2,k2+nn-1)=3*k2+tb(n+1)+1;
end   
%
for k2=0:q-1
   c3(1,k2+1+(nn-1)*2)=n*2+1;
   c3(2,k2+1+(nn-1)*2)=3*k2+tb(n*2+1)+1;
end   
for k2=q+1:n-1
   c3(1,k2+(nn-1)*2)=n*2+1;
   c3(2,k2+(nn-1)*2)=3*k2+tb(n*2+1)+1;
end   
%
for kk=0:2
   nnk=(nn-1)*kk;
   nk=n*kk;
   for k1=1:n-1
      for k2=0:n-1
         c3(1,k2+1+n*k1-1+nnk)=k1+nk+1;
         c3(2,k2+1+n*k1-1+nnk)=3*k2+tb(k1+nk+1)+1;
      end
   end   
end   
%
for k=1:d1
   k1=c1(1,k);
   k2=c1(2,k);
   for kk=1:6
      t1(1,kk)=bf(k1,k2,kk);
   end
   tt1=rt6*ifft(t1);
   for kk=1:6
      bf(k1,k2,kk)=tt1(1,kk);
      y1(k1,k2,kk)=tt1(1,kk);
   end
end   
%
for k=1:d2
   k1=c2(1,k);
   k2=c2(2,k);
   t2(1)=bf(k1,k2,1);
   t2(2)=bf(k1,k2,3);
   t2(3)=bf(k1,k2,5);
   s2(1)=bf(k1,k2,2);
   s2(2)=bf(k1,k2,4);
   s2(3)=bf(k1,k2,6);
   tt2=rt3*ifft(t2);
   ss2=rt3*ifft(s2);
   bf(k1,k2,1)=tt2(1);
   bf(k1,k2,3)=tt2(2);
   bf(k1,k2,5)=tt2(3);
   bf(k1,k2,2)=ss2(1);
   bf(k1,k2,4)=ss2(2);
   bf(k1,k2,6)=ss2(3);
   y2(k1,k2,1)=tt2(1);
   y2(k1,k2,3)=tt2(2);
   y2(k1,k2,5)=tt2(3);
   y2(k1,k2,2)=ss2(1);
   y2(k1,k2,4)=ss2(2);
   y2(k1,k2,6)=ss2(3);
end   
for k=1:d3
   k1=c3(1,k);
   k2=c3(2,k);
   t3(1)=bf(k1,k2,1);
   t3(2)=bf(k1,k2,4);
   s3(1)=bf(k1,k2,2);
   s3(2)=bf(k1,k2,5);
   r3(1)=bf(k1,k2,3);
   r3(2)=bf(k1,k2,6);
   tt3=rt2*ifft(t3);
   ss3=rt2*ifft(s3);
   rr3=rt2*ifft(r3);
   bf(k1,k2,1)=tt3(1);
   bf(k1,k2,4)=tt3(2);
   bf(k1,k2,2)=ss3(1);
   bf(k1,k2,5)=ss3(2);
   bf(k1,k2,3)=rr3(1);
   bf(k1,k2,6)=rr3(2);
   y3(k1,k2,1)=tt3(1);
   y3(k1,k2,4)=tt3(2);
   y3(k1,k2,2)=ss3(1);
   y3(k1,k2,5)=ss3(2);
   y3(k1,k2,3)=rr3(1);
   y3(k1,k2,6)=rr3(2);
end   
y6=bf-y1-y2-y3;   