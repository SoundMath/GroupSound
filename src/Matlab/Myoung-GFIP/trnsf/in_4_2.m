function y=in_4_2(x,gp)
[n8,tem]=size(x);
%
% Use this routine for powers of 2.
% CN sdp (C4 sdp C2)
%
n=n8/8;
n2=n+n;
n3=n2+n;
n4=n3+n;
n5=n4+n;
n6=n5+n;
n7=n6+n;
nd2=n/2;
nd4=n/4;
nd8=n/8;
rt2=1/sqrt(2);
rtn=1/sqrt(n);
%
%
if (gp == 1)
   d1=2;
   d21=2;
   c1(1)=1;
   c1(2)=nd2+1;
   d22=n/4-2;
   for k=1:nd8-1
      c22(k)=4*k+1;
      c22(k+nd8-1)=nd2+4*k+1;
   end   
   d4=nd4;
   for k=0:d4-1
      c4(k+1)=4*k+3;
   end   
end
% the H centralizer
for k=1:d1
   for l1=1:8
      t1(l1,1)=x(c1(k)+n*(l1-1),1);
   end
   tt1(1,1)=rt2*(t1(1,1)+t1(5,1));
   tt1(3,1)=rt2*(t1(3,1)+t1(7,1));
   tt1(5,1)=rt2*(t1(1,1)-t1(5,1));
   tt1(7,1)=rt2*(t1(3,1)-t1(7,1));
   tt1(2,1)=t1(2,1);
   tt1(4,1)=t1(4,1);
   tt1(6,1)=t1(6,1);
   tt1(8,1)=t1(8,1);
   
   tt1(1:4,1)=.5*fft(tt1(1:4,1));
   tt2(1:4,1)=.5*fft(tt1(5:8,1));
   %
   x(c1(k),1)=tt1(1);
   x(c1(k)+n2,1)=tt1(3);
   x(c1(k)+n4,1)=tt2(1);
   x(c1(k)+n6,1)=tt2(3);
   %
   x(c1(k)+n,1)=tt1(2);
   x(c1(k)+n3,1)=tt1(4);
   x(c1(k)+n5,1)=tt2(2);
   x(c1(k)+n7,1)=tt2(4);
end
%
for k=1:d22
   t1=x(c22(k),1)+x(c22(k)+n2,1);
   t2=x(c22(k),1)-x(c22(k)+n2,1);
   t3=x(c22(k)+n5,1)+x(c22(k)+n7,1);
   t4=x(c22(k)+n5,1)-x(c22(k)+n7,1);
   x(c22(k),1)=.5*(t1+t3);
   x(c22(k)+n2,1)=.5*(t2+t4);
   x(c22(k)+n5,1)=.5*(t1-t3);
   x(c22(k)+n7,1)=.5*(t2-t4);
   
   t1=x(c22(k)+n,1)+x(c22(k)+n3,1);
   t2=x(c22(k)+n,1)-x(c22(k)+n3,1);
   t3=x(c22(k)+n6,1)+x(c22(k)+n4,1);
   t4=x(c22(k)+n6,1)-x(c22(k)+n4,1);
   x(c22(k)+n,1)=.5*(t1+t3);
   x(c22(k)+n3,1)=.5*(t2+t4);
   x(c22(k)+n6,1)=.5*(t1-t3);
   x(c22(k)+n4,1)=.5*(t2-t4);
end   
%
for k=1:d4
   t1=rt2*(x(c4(k),1)+x(c4(k)+n2,1));
   t2=rt2*(x(c4(k),1)-x(c4(k)+n2,1));
   x(c4(k),1)=t1;
   x(c4(k)+n2,1)=t2;
   %
   t1=rt2*(x(c4(k)+n,1)+x(c4(k)+n3,1));
   t2=rt2*(x(c4(k)+n,1)-x(c4(k)+n3,1));
   x(c4(k)+n,1)=t1;
   x(c4(k)+n3,1)=t2;
   %
   t1=rt2*(x(c4(k)+n4,1)+x(c4(k)+n6,1));
   t2=rt2*(x(c4(k)+n4,1)-x(c4(k)+n6,1));
   x(c4(k)+n4,1)=t1;
   x(c4(k)+n6,1)=t2;
   %
   t1=rt2*(x(c4(k)+n5,1)+x(c4(k)+n7,1));
   t2=rt2*(x(c4(k)+n5,1)-x(c4(k)+n7,1));
   x(c4(k)+n5,1)=t1;
   x(c4(k)+n7,1)=t2;
end   
bbf=rtn*fft(reshape(x,n,8));
y=reshape(bbf,n8,1);
