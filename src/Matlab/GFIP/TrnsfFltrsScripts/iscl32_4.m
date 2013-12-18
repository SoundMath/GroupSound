function y=iscl32_4(x,n);
%
% (C_32 x C_32) sdp C_4 
% (a,b)^t = (7a,7b)
%
n2=n+n;
m=n/2;
rt2=1/sqrt(2);
%
for k2=1:m
   for k1=1:m
      t1=x(2*k1-1,2*k2-1)+x(2*k1-1,2*k2-1+n);
      t2=x(2*k1-1,2*k2-1)-x(2*k1-1,2*k2-1+n);
      x(2*k1-1,2*k2-1)=rt2*t1;
      x(2*k1-1,2*k2-1+n)=rt2*t2;
   end
end
t1=x(1,1);
t2=x(1,1+n);
s1=rt2*(x(1+n,1)+x(1+n,1+n));
s2=-rt2*i*(x(1+n,1)-x(1+n,1+n));
x(1,1)=rt2*(t1+s1);
x(1+n,1)=rt2*(t2+s2);
x(1,1+n)=rt2*(t1-s1);;
x(1+n,1+n)=rt2*(t2-s2);
%
t1=x(1+m,1);
t2=x(1+m,1+n);
s1=rt2*(x(1+m+n,1)+x(1+m+n,1+n));
s2=-rt2*i*(x(1+m+n,1)-x(1+m+n,1+n));
x(1+m,1)=rt2*(t1+s1);
x(1+m+n,1)=rt2*(t2+s2);
x(1+m,1+n)=rt2*(t1-s1);;
x(1+m+n,1+n)=rt2*(t2-s2);
%
t1=x(1,1+m);
t2=x(1,1+m+n);
s1=rt2*(x(1+n,1+m)+x(1+n,1+m+n));
s2=-rt2*i*(x(1+n,1+m)-x(1+n,1+m+n));
x(1,1+m)=rt2*(t1+s1);
x(1+n,1+m)=rt2*(t2+s2);
x(1,1+m+n)=rt2*(t1-s1);;
x(1+n,1+m+n)=rt2*(t2-s2);
%
t1=x(1+m,1+m);
t2=x(1+m,1+m+n);
s1=rt2*(x(1+m+n,1+m)+x(1+m+n,1+m+n));
s2=-rt2*i*(x(1+m+n,1+m)-x(1+m+n,1+m+n));
x(1+m,1+m)=rt2*(t1+s1);
x(1+m+n,1+m)=rt2*(t2+s2);
x(1+m,1+m+n)=rt2*(t1-s1);;
x(1+m+n,1+m+n)=rt2*(t2-s2);
%
y(1:n,1:n)=(1/n)*fft2(x(1:n,1:n));
y(1+n:n2,1:n)=(1/n)*fft2(x(1+n:n2,1:n));
y(1:n,1+n:n2)=(1/n)*fft2(x(1:n,1+n:n2));
y(1+n:n2,1+n:n2)=(1/n)*fft2(x(1+n:n2,1+n:n2));
