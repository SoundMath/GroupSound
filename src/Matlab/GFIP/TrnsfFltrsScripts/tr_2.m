function y=tr_2(x,n)
%
% Use this routine for even n.
% C_n sdp C_2 : x --> x^-1
%
n2=n*2;
m=n/2;
rt2=1/sqrt(2);
%
y(1:n,1)=sqrt(n)*ifft(x(1:n,1));
y(1+n:n2,1)=sqrt(n)*ifft(x(1+n:n2,1));
% 1-dimensional idempotents
t1=y(1,1)+y(1+n,1);
t2=y(1,1)-y(1+n,1);
y(1,1)=rt2*t1;
y(1+n,1)=rt2*t2;
t1=y(1+m,1)+y(1+m+n,1);
t2=y(1+m,1)-y(1+m+n,1);
y(1+m,1)=rt2*t1;
y(1+m+n,1)=rt2*t2;
   