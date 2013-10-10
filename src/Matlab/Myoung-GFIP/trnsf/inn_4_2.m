function y=inn_4_2(x,gp)
[n4,tem]=size(x);
%
% Use this routine for powers of 2.
% CN sdp (C4 sdp C2)
%
n=n4/4;
n2=n+n;
n3=n2+n;
n4=n3+n;
nd2=n/2;
rt2=1/sqrt(2);
sc=1/n;
y=zeros(n4,n2);
%
if (gp == 1)
   d1=2;
   d21=2;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=nd2+1;
   c1(2,2)=nd2+1;
   c21=c1;
   d22=2;
   c22(1,1)=1;
   c22(2,1)=nd2+1;
   c22(1,2)=nd2+1;
   c22(2,2)=1;
   d41=n2-4;
   d42=n2-4;
   d43=n-2;
   d44=n-2;
   for k=2:nd2
      c41(1,k-1)=k;
      c41(2,k-1)=1;
      c41(1,k+nd2-2)=k+nd2;
      c41(2,k+nd2-2)=1;
      c41(1,k+n-3)=k;
      c41(2,k+n-3)=nd2+1;
      c41(1,k+nd2+n-4)=k+nd2;
      c41(2,k+nd2+n-4)=nd2+1;
      %
      c42(1,k-1)=1;
      c42(2,k-1)=k;
      c42(1,k+nd2-2)=1;
      c42(2,k+nd2-2)=k+nd2;
      c42(1,k+n-3)=nd2+1;
      c42(2,k+n-3)=k;
      c42(1,k+nd2+n-4)=nd2+1;
      c42(2,k+nd2+n-4)=k+nd2;
      %
      c43(1,k-1)=k;
      c43(2,k-1)=k;
      c43(1,k+nd2-2)=k+nd2;
      c43(2,k+nd2-2)=k+nd2;
      %
      c44(1,k-1)=k;
      c44(2,k-1)=n-k+2;
      c44(1,k+nd2-2)=nd2+k;
      c44(2,k+nd2-2)=nd2-k+2;      
   end   
end
% the H centralizer
for k=1:d1
   k1=c1(1,k);
   k2=c1(2,k);
   t1(1,1)=x(k1,k2);
   t1(2,1)=x(k1+n,k2);
   t1(3,1)=x(k1+n2,k2);
   t1(4,1)=x(k1+n3,k2);
   t1(5,1)=x(k1,k2+n);
   t1(6,1)=x(k1+n,k2+n);
   t1(7,1)=x(k1+n2,k2+n);
   t1(8,1)=x(k1+n3,k2+n);
   %
   tt1(1,1)=rt2*(t1(1,1)+t1(5,1));
   tt1(3,1)=rt2*(t1(3,1)+t1(7,1));
   tt1(5,1)=rt2*(t1(1,1)-t1(5,1));
   tt1(7,1)=rt2*(t1(3,1)-t1(7,1));
   tt1(2,1)=t1(2,1);
   tt1(4,1)=t1(4,1);
   tt1(6,1)=t1(6,1);
   tt1(8,1)=t1(8,1);
   %
   tt1(1:4,1)=.5*fft(tt1(1:4,1));
   tt2(1:4,1)=.5*fft(tt1(5:8,1));
   %
   x(k1,k2)=tt1(1);
   x(k1+n2,k2)=tt1(3);
   x(k1,k2+n)=tt2(1);
   x(k1+n2,k2+n)=tt2(3);
   %
   x(k1+n,k2)=tt1(2);
   x(k1+n3,k2)=tt1(4);
   x(k1+n,k2+n)=tt2(2);
   x(k1+n3,k2+n)=tt2(4);
end
%
for k=1:d22
   k1=c22(1,k);
   k2=c22(2,k);
   t1=x(k1,k2)+x(k1+n2,k2);
   t2=x(k1,k2)-x(k1+n2,k2);
   t3=x(k1+n,k2+n)+x(k1+n3,k2+n);
   t4=x(k1+n,k2+n)-x(k1+n3,k2+n);
   x(k1,k2)=.5*(t1+t3);
   x(k1+n2,k2)=.5*(t2+t4);
   x(k1+n,k2+n)=.5*(t1-t3);
   x(k1+n3,k2+n)=.5*(t2-t4);
   
   t1=x(k1+n,k2)+x(k1+n3,k2);
   t2=x(k1+n,k2)-x(k1+n3,k2);
   t3=x(k1+n2,k2+n)+x(k1,k2+n);
   t4=x(k1+n2,k2+n)-x(k1,k2+n);
   x(k1+n,k2)=.5*(t1+t3);
   x(k1+n3,k2)=.5*(t2+t4);
   x(k1+n2,k2+n)=.5*(t1-t3);
   x(k1,k2+n)=.5*(t2-t4);
end   
%
for k=1:d41
   k1=c41(1,k);
   k2=c41(2,k);
   t1=rt2*(x(k1,k2)+x(k1+n,k2+n));
   t2=rt2*(x(k1,k2)-x(k1+n,k2+n));
   x(k1,k2)=t1;
   x(k1+n,k2+n)=t2;
   %
   t1=rt2*(x(k1+n,k2)+x(k1+n2,k2+n));
   t2=rt2*(x(k1+n,k2)-x(k1+n2,k2+n));
   x(k1+n,k2)=t1;
   x(k1+n2,k2+n)=t2;
   %
   t1=rt2*(x(k1+n2,k2)+x(k1+n3,k2+n));
   t2=rt2*(x(k1+n2,k2)-x(k1+n3,k2+n));
   x(k1+n2,k2)=t1;
   x(k1+n3,k2+n)=t2;
   %
   t1=rt2*(x(k1+n3,k2)+x(k1,k2+n));
   t2=rt2*(x(k1+n3,k2)-x(k1,k2+n));
   x(k1+n3,k2)=t1;
   x(k1,k2+n)=t2;
end   
for k=1:d42
   k1=c42(1,k);
   k2=c42(2,k);
   t1=rt2*(x(k1,k2)+x(k1+n3,k2+n));
   t2=rt2*(x(k1,k2)-x(k1+n3,k2+n));
   x(k1,k2)=t1;
   x(k1+n3,k2+n)=t2;
   
   t1=rt2*(x(k1+n,k2)+x(k1,k2+n));
   t2=rt2*(x(k1+n,k2)-x(k1,k2+n));
   x(k1+n,k2)=t1;
   x(k1,k2+n)=t2;
   
   t1=rt2*(x(k1+n2,k2)+x(k1+n,k2+n));
   t2=rt2*(x(k1+n2,k2)-x(k1+n,k2+n));
   x(k1+n2,k2)=t1;
   x(k1+n,k2+n)=t2;
   
   t1=rt2*(x(k1+n3,k2)+x(k1+n2,k2+n));
   t2=rt2*(x(k1+n3,k2)-x(k1+n2,k2+n));
   x(k1+n3,k2)=t1;
   x(k1+n2,k2+n)=t2;
end   
for k=1:d43
   k1=c43(1,k);
   k2=c43(2,k);
   t1=rt2*(x(k1,k2)+x(k1,k2+n));
   t2=rt2*(x(k1,k2)-x(k1,k2+n));
   x(k1,k2)=t1;
   x(k1,k2+n)=t2;
   
   t1=rt2*(x(k1+n,k2)+x(k1+n,k2+n));
   t2=rt2*(x(k1+n,k2)-x(k1+n,k2+n));
   x(k1+n,k2)=t1;
   x(k1+n,k2+n)=t2;
   
   t1=rt2*(x(k1+n2,k2)+x(k1+n2,k2+n));
   t2=rt2*(x(k1+n2,k2)-x(k1+n2,k2+n));
   x(k1+n2,k2)=t1;
   x(k1+n2,k2+n)=t2;
   
   t1=rt2*(x(k1+n3,k2)+x(k1+n3,k2+n));
   t2=rt2*(x(k1+n3,k2)-x(k1+n3,k2+n));
   x(k1+n3,k2)=t1;
   x(k1+n3,k2+n)=t2;
end   
for k=1:d44
   k1=c44(1,k);
   k2=c44(2,k);
   t1=rt2*(x(k1,k2)+x(k1+n2,k2+n));
   t2=rt2*(x(k1,k2)-x(k1+n2,k2+n));
   x(k1,k2)=t1;
   x(k1+n2,k2+n)=t2;
   
   t1=rt2*(x(k1+n,k2)+x(k1+n3,k2+n));
   t2=rt2*(x(k1+n,k2)-x(k1+n3,k2+n));
   x(k1+n,k2)=t1;
   x(k1+n3,k2+n)=t2;

   t1=rt2*(x(k1+n2,k2)+x(k1,k2+n));
   t2=rt2*(x(k1+n2,k2)-x(k1,k2+n));
   x(k1+n2,k2)=t1;
   x(k1,k2+n)=t2;
   
   t1=rt2*(x(k1+n3,k2)+x(k1+n,k2+n));
   t2=rt2*(x(k1+n3,k2)-x(k1+n,k2+n));
   x(k1+n3,k2)=t1;
   x(k1+n,k2+n)=t2;
end
%
y(1:n,1:n)=sc*fft2(x(1:n,1:n));
y(1+n:n2,1:n)=sc*fft2(x(1+n:n2,1:n));
y(1+n2:n3,1:n)=sc*fft2(x(1+n2:n3,1:n));
y(1+n3:n4,1:n)=sc*fft2(x(1+n3:n4,1:n));
y(1:n,1+n:n2)=sc*fft2(x(1:n,1+n:n2));
y(1+n:n2,1+n:n2)=sc*fft2(x(1+n:n2,1+n:n2));
y(1+n2:n3,1+n:n2)=sc*fft2(x(1+n2:n3,1+n:n2));
y(1+n3:n4,1+n:n2)=sc*fft2(x(1+n3:n4,1+n:n2));
