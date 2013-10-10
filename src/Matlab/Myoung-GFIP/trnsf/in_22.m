function y=in_22(x)
[n4,tem]=size(x);
%
% Use this routine for even n.
% Cn sdp C2 x C2
%
n1=n4/4;
n2=n1+n1;
n3=n2+n1;
m=n1/2;
rt2=1/sqrt(2);
sc=1/sqrt(n1);
%
d1=2;
c1(1)=1;
c1(2)=1+m;
d2=m-2;
for k=2:m/2
   c2(k-1)=2*k-1;
   c2(k-2+m/2)=2*(k+m/2-1)+1;
end   
%
%
%
for k=1:d1
   t0=.5*(x(c1(k),1)+x(c1(k)+n2,1));
   t2=.5*(x(c1(k),1)-x(c1(k)+n2,1));
   t1=.5*(x(c1(k)+n1,1)+x(c1(k)+n3,1));
   t3=.5*(x(c1(k)+n1,1)-x(c1(k)+n3,1));
   x(c1(k),1)=t0+t1;
   x(c1(k)+n1,1)=t2+t3;
   x(c1(k)+n2,1)=t0-t1;
   x(c1(k)+n3,1)=t2-t3;
end
for k=1:d2
   t0=rt2*(x(c2(k),1)+x(c2(k)+n2,1));
   t1=rt2*(x(c2(k),1)-x(c2(k)+n2,1));
   x(c2(k),1)=t0;
   x(c2(k)+n2,1)=t1;
end   
%
y(1:n1,1)=sc*fft(x(1:n1,1));
y(1+n1:n2,1)=sc*fft(x(1+n1:n2,1));
y(1+n2:n3,1)=sc*fft(x(1+n2:n3,1));
y(1+n3:n4,1)=sc*fft(x(1+n3:n4,1));
   