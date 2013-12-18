function [y1,y2,y4]=s2_4(x,n);
%
% C_N sdp K_2 
% N must be a power of two and at least 8.
%
n2=n+n;
n3=n2+n;
n4=n3+n;
m2=n/2;
m4=n/4;
rt2=1/sqrt(2);
%
y1=zeros(n4,1);
y2=zeros(n4,1);
y4=zeros(n4,1);
bf=zeros(n4,1);
%
bf(1:n,1)=sqrt(n)*ifft(x(1:n));
bf(1+n:n2,1)=sqrt(n)*ifft(x(1+n:n2));
bf(1+n2:n3,1)=sqrt(n)*ifft(x(1+n2:n3));
bf(1+n3:n4,1)=sqrt(n)*ifft(x(1+n3:n4));
%
% 2-d idempotents
%
for k=1:m4-1
   k2=1+2*k;
   t1=bf(k2)+bf(k2+n2);
   t2=bf(k2)-bf(k2+n2);
   bf(k2)=rt2*t1;
   bf(k2+n2)=rt2*t2;
   y2(k2)=bf(k2);
   y2(k2+n)=bf(k2+n);
   y2(k2+n2)=bf(k2+n2);
   y2(k2+n3)=bf(k2+n3);
   t1=bf(k2+m2)+bf(k2+m2+n2);
   t2=bf(k2+m2)-bf(k2+m2+n2);
   bf(k2+m2)=rt2*t1;
   bf(k2+m2+n2)=rt2*t2;
   y2(k2+m2)=bf(k2+m2);
   y2(k2+m2+n)=bf(k2+m2+n);
   y2(k2+m2+n2)=bf(k2+m2+n2);
   y2(k2+m2+n3)=bf(k2+m2+n3);
end
%
% 1-d idempotents
%
t1=bf(1)+bf(1+n2);
t2=bf(1)-bf(1+n2);
t3=bf(1+n)+bf(1+n3);
t4=i*(bf(1+n)-bf(1+n3));
bf(1) =.5*(t1+t3);
bf(1+n) =.5*(t2+t4);
bf(1+n2)=.5*(t1-t3);
bf(1+n3)=.5*(t2-t4);
y1(1)=bf(1);
y1(1+n)=bf(1+n);
y1(1+n2)=bf(1+n2);
y1(1+n3)=bf(1+n3);
%
t1=bf(1+m2)  +bf(1+m2+n2);
t2=bf(1+m2)  -bf(1+m2+n2);
t3=bf(1+m2+n)+bf(1+m2+n3);
t4=i*(bf(1+m2+n)-bf(1+m2+n3));
bf(1+m2)   =.5*(t1+t3);
bf(1+m2+n) =.5*(t2+t4);
bf(1+m2+n2)=.5*(t1-t3);
bf(1+m2+n3)=.5*(t2-t4);
y1(1+m2)=bf(1+m2);
y1(1+m2+n)=bf(1+m2+n);
y1(1+m2+n2)=bf(1+m2+n2);
y1(1+m2+n3)=bf(1+m2+n3);
%
% 4-d idempotents
%
y4=bf-y1-y2;