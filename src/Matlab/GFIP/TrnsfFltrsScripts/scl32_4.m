function [y1,y2,y4]=scl2_4(x,n);
%
% (C_n x C_n) sdp C_4 
% n must be a power of two and at least 16.
%
n2=n+n;
m=n/2;
rt2=1/sqrt(2);
%
y1=zeros(n2,n2);
y2=zeros(n2,n2);
y4=zeros(n2,n2);
%
bf(1:n,1:n)=n*ifft2(x(1:n,1:n));
bf(1+n:n2,1:n)=n*ifft2(x(1+n:n2,1:n));
bf(1:n,1+n:n2)=n*ifft2(x(1:n,1+n:n2));
bf(1+n:n2,1+n:n2)=n*ifft2(x(1+n:n2,1+n:n2));
%
% 2-d idempotents
%
for k2=1:m
   for k1=1:m
      t1=bf(2*k1-1,2*k2-1)+bf(2*k1-1,2*k2-1+n);
      t2=bf(2*k1-1,2*k2-1)-bf(2*k1-1,2*k2-1+n);
      y2(2*k1-1,2*k2-1)=rt2*t1;
      y2(2*k1-1,2*k2-1+n)=rt2*t2;
      bf(2*k1-1,2*k2-1)=rt2*t1;
      bf(2*k1-1,2*k2-1+n)=rt2*t2;
      y2(2*k1-1+n,2*k2-1)=bf(2*k1-1+n,2*k2-1);
      y2(2*k1-1+n,2*k2-1+n)=bf(2*k1-1+n,2*k2-1+n);
   end
end
%
% 1-d idempotents
%
for k2=1:2
   kk2=1+m*(k2-1);
   for k1=1:2
      kk1=1+m*(k1-1);
      t1=bf(kk1,kk2);
      t2=bf(kk1,kk2+n);
      s1=rt2*(bf(kk1+n,kk2)+bf(kk1+n,kk2+n));
      s2=rt2*i*(bf(kk1+n,kk2)-bf(kk1+n,kk2+n));
      bf(kk1,kk2)=rt2*(t1+s1);
      bf(kk1+n,kk2)=rt2*(t2+s2);
      bf(kk1,kk2+n)=rt2*(t1-s1);;
      bf(kk1+n,kk2+n)=rt2*(t2-s2);
      y1(kk1,kk2)=bf(kk1,kk2);
      y1(kk1+n,kk2)=bf(kk1+n,kk2);
      y1(kk1,kk2+n)=bf(kk1,kk2+n);
      y1(kk1+n,kk2+n)=bf(kk1+n,kk2+n);
      y2(kk1,kk2)=0.0;
      y2(kk1+n,kk2)=0.0;
      y2(kk1,kk2+n)=0.0;
      y2(kk1+n,kk2+n)=0.0;
   end
end   
%
% 4-d idempotents
%
y4=bf-y1-y2;