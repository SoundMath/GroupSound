function y=tr_2mtx(n)
%
% Use this routine for even n.
% C_n sdp C_2 : x --> x^-1
%
n2=n*2;
m=n/2;
rt2=1/sqrt(2);
%
y(1:n,1:n)=sqrt(n)*ifft(eye(n,n));
y(1+n:n2,1+n:n2)=y(1:n,1:n);
%
y(1,1:n)=rt2*y(1,1:n);
y(1,1+n:n2)=y(1,1:n);
y(1+n,1:n)=y(1,1:n);
y(1+n,1+n:n2)=-rt2*y(1+n,1+n:n2);
%
y(1+m,1:n)=rt2*y(1+m,1:n);
y(1+m,1+n:n2)=y(1+m,1:n);
y(1+m+n,1:n)=y(1+m,1:n);
y(1+m+n,1+n:n2)=-rt2*y(1+m+n,1+n:n2);
   