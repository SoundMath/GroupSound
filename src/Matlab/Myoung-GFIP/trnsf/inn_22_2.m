function y=inn_22_2(x,gp)
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
nd4=n/4;
nd8=n/8;
rt2=1/sqrt(2);
sc=1/n;
y=zeros(n4,n2);
%
if (gp == 1)
   d1=nd2;
   d21=nd2;
   d22=nd2*nd2-nd2;
   d41=nd2;
   d42=nd2;
   d43=nd2*nd2;
   d44=nd2*nd2;
   for k1=0:nd4-1
      c1(1,k1+1)=4*k1+1;
      c1(2,k1+1)=2*k1+1;
      c1(1,k1+nd4+1)=4*k1+1;
      c1(2,k1+nd4+1)=2*k1+nd2+1;
      for k2=0:2*k1-1
         c22(1,k2+1+(nd2-1)*k1)=2*k2+1;
         c22(2,k2+1+(nd2-1)*k1)=2*k1+1;
         c22(1,k2+1+(nd2-1)*(k1+nd4))=2*k2+1;
         c22(2,k2+1+(nd2-1)*(k1+nd4))=2*k1+nd2+1;
      end
      for k2=2*k1+1:nd2-1
         c22(1,k2+(nd2-1)*k1)=2*k2+1;
         c22(2,k2+(nd2-1)*k1)=2*k1+1;
         c22(1,k2+(nd2-1)*(k1+nd4))=2*k2+1;
         c22(2,k2+(nd2-1)*(k1+nd4))=2*k1+nd2+1;
      end   
      c41(1,k1+1)=4*k1+3;
      c41(2,k1+1)=2*k1+2;
      c41(1,k1+1+nd4)=4*k1+3;
      c41(2,k1+1+nd4)=2*k1+nd2+2;
   end 
   for k1=0:nd8-1
      c42(1,k1+1)=nd2+4*k1+3;
      c42(2,k1+1)=2*k1+2;
      c42(1,k1+nd8+1)=4*k1+3;
      c42(2,k1+nd8+1)=2*k1+nd4+2;
      c42(1,k1+nd4+1)=nd2+4*k1+3;
      c42(2,k1+nd4+1)=2*k1+nd2+2;
      c42(1,k1+nd4+nd8+1)=4*k1+3;
      c42(2,k1+nd4+nd8+1)=2*k1+nd2+nd4+2;
   end   
   for k1=0:nd2-1
      for k2=0:nd2-1
         c43(1,k2+1+nd2*k1)=2*k2+2;
         c43(2,k2+1+nd2*k1)=2*k1+1;
         c44(1,k2+1+nd2*k1)=2*k2+2;
         c44(2,k2+1+nd2*k1)=2*k1+2;
      end   
   end   
end   
% the H centralizer
for k=1:d1
   k1=c1(1,k);
   k2=c1(2,k);
   %
   t1(1,1)=rt2*(x(k1,k2)+x(k1,k2+n));
   t1(3,1)=rt2*(x(k1+n2,k2)+x(k1+n2,k2+n));
   t1(5,1)=rt2*(x(k1,k2)-x(k1,k2+n));
   t1(7,1)=rt2*(x(k1+n2,k2)-x(k1+n2,k2+n));
   t1(2,1)=x(k1+n,k2);
   t1(4,1)=x(k1+n3,k2);
   t1(6,1)=x(k1+n,k2+n);
   t1(8,1)=x(k1+n3,k2+n);
   %
   tt1(1,1)=.5*(t1(1,1)+t1(2,1));
   tt1(2,1)=.5*(t1(1,1)-t1(2,1));
   tt1(3,1)=.5*(t1(3,1)+t1(4,1));
   tt1(4,1)=.5*(t1(3,1)-t1(4,1));
   %
   tt2(1,1)=.5*(t1(5,1)+t1(6,1));
   tt2(2,1)=.5*(t1(5,1)-t1(6,1));
   tt2(3,1)=.5*(t1(7,1)+t1(8,1));
   tt2(4,1)=.5*(t1(7,1)-t1(8,1));
   %
   x(k1,k2)=tt1(1)+tt1(3,1);
   x(k1+n,k2)=tt1(2)+tt1(4,1);
   x(k1+n2,k2)=tt1(1)-tt1(3,1);
   x(k1+n3,k2)=tt1(2)-tt1(4,1);
   %
   x(k1,k2+n)=tt2(1)+tt2(3,1);
   x(k1+n,k2+n)=tt2(2)+tt2(4,1);
   x(k1+n2,k2+n)=tt2(1)-tt2(3,1);
   x(k1+n3,k2+n)=tt2(2)-tt2(4,1);
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
