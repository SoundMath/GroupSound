function y=is2_4(x,n);
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
t1=x(1)+x(1+n2);
t2=x(1)-x(1+n2);
t3=x(1+n)+x(1+n3);
t4=-i*(x(1+n)-x(1+n3));
x(1) =.5*(t1+t3);
x(1+n) =.5*(t2+t4);
x(1+n2)=.5*(t1-t3);
x(1+n3)=.5*(t2-t4);
%
t1=x(1+m2)  +x(1+m2+n2);
t2=x(1+m2)  -x(1+m2+n2);
t3=x(1+m2+n)+x(1+m2+n3);
t4=-i*(x(1+m2+n)-x(1+m2+n3));
x(1+m2)   =.5*(t1+t3);
x(1+m2+n) =.5*(t2+t4);
x(1+m2+n2)=.5*(t1-t3);
x(1+m2+n3)=.5*(t2-t4);
%
for k=1:m4-1
   k2=1+2*k;
   t1=x(k2)+x(k2+n2);
   t2=x(k2)-x(k2+n2);
   x(k2)=rt2*t1;
   x(k2+n2)=rt2*t2;
   t1=x(k2+m2)+x(k2+m2+n2);
   t2=x(k2+m2)-x(k2+m2+n2);
   x(k2+m2)=rt2*t1;
   x(k2+m2+n2)=rt2*t2;
end
%
y(1:n,1)=1/sqrt(n)*fft(x(1:n));
y(1+n:n2,1)=1/sqrt(n)*fft(x(1+n:n2));
y(1+n2:n3,1)=1/sqrt(n)*fft(x(1+n2:n3));
y(1+n3:n4,1)=1/sqrt(n)*fft(x(1+n3:n4));
%
