function [y1,y21,y22,y4,y8]=n_4_2(x,gp)
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
rtn=sqrt(n);
y1=zeros(n8,1);
y21=zeros(n8,1);
y22=zeros(n8,1);
y4=zeros(n8,1);
y8=zeros(n8,1);
%
bbf=rtn*ifft(reshape(x,n,8));
bf=reshape(bbf,n8,1);
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
      t1(l1,1)=bf(c1(k)+n*(l1-1),1);
   end
   tt1(1:4,1)=2*ifft(t1(1:4,1));
   tt2(1:4,1)=2*ifft(t1(5:8,1));
   %
   bf(c1(k),1)=rt2*(tt1(1)+tt2(1));
   bf(c1(k)+n2,1)=rt2*(tt1(3)+tt2(3));
   bf(c1(k)+n4,1)=rt2*(tt1(1)-tt2(1));
   bf(c1(k)+n6,1)=rt2*(tt1(3)-tt2(3));
   y1(c1(k),1)=bf(c1(k),1);
   y1(c1(k)+n2,1)=bf(c1(k)+n2,1);
   y1(c1(k)+n4,1)=bf(c1(k)+n4,1);
   y1(c1(k)+n6,1)=bf(c1(k)+n6,1);
   %
   bf(c1(k)+n,1)=tt1(2);
   bf(c1(k)+n3,1)=tt1(4);
   bf(c1(k)+n5,1)=tt2(2);
   bf(c1(k)+n7,1)=tt2(4);
   y21(c1(k)+n,1)=tt1(2);
   y21(c1(k)+n3,1)=tt1(4);
   y21(c1(k)+n5,1)=tt2(2);
   y21(c1(k)+n7,1)=tt2(4);
end
%
for k=1:d22
   t1=bf(c22(k),1)+bf(c22(k)+n2,1);
   t2=bf(c22(k),1)-bf(c22(k)+n2,1);
   t3=bf(c22(k)+n5,1)+bf(c22(k)+n7,1);
   t4=bf(c22(k)+n5,1)-bf(c22(k)+n7,1);
   bf(c22(k),1)=.5*(t1+t3);
   bf(c22(k)+n2,1)=.5*(t2+t4);
   bf(c22(k)+n5,1)=.5*(t1-t3);
   bf(c22(k)+n7,1)=.5*(t2-t4);
   y22(c22(k),1)=bf(c22(k),1);
   y22(c22(k)+n2,1)=bf(c22(k)+n2,1);
   y22(c22(k)+n5,1)=bf(c22(k)+n5,1);
   y22(c22(k)+n7,1)=bf(c22(k)+n7,1);
   
   t1=bf(c22(k)+n,1)+bf(c22(k)+n3,1);
   t2=bf(c22(k)+n,1)-bf(c22(k)+n3,1);
   t3=bf(c22(k)+n6,1)+bf(c22(k)+n4,1);
   t4=bf(c22(k)+n6,1)-bf(c22(k)+n4,1);
   bf(c22(k)+n,1)=.5*(t1+t3);
   bf(c22(k)+n3,1)=.5*(t2+t4);
   bf(c22(k)+n6,1)=.5*(t1-t3);
   bf(c22(k)+n4,1)=.5*(t2-t4);
   y22(c22(k)+n,1)=bf(c22(k)+n,1);
   y22(c22(k)+n3,1)=bf(c22(k)+n3,1);
   y22(c22(k)+n6,1)=bf(c22(k)+n6,1);
   y22(c22(k)+n4,1)=bf(c22(k)+n4,1);
end   
%
for k=1:d4
   t1=rt2*(bf(c4(k),1)+bf(c4(k)+n2,1));
   t2=rt2*(bf(c4(k),1)-bf(c4(k)+n2,1));
   bf(c4(k),1)=t1;
   bf(c4(k)+n2,1)=t2;
   y4(c4(k),1)=t1;
   y4(c4(k)+n2,1)=t2;
   %
   t1=rt2*(bf(c4(k)+n,1)+bf(c4(k)+n3,1));
   t2=rt2*(bf(c4(k)+n,1)-bf(c4(k)+n3,1));
   bf(c4(k)+n,1)=t1;
   bf(c4(k)+n3,1)=t2;
   y4(c4(k)+n,1)=t1;
   y4(c4(k)+n3,1)=t2;
   %
   t1=rt2*(bf(c4(k)+n4,1)+bf(c4(k)+n6,1));
   t2=rt2*(bf(c4(k)+n4,1)-bf(c4(k)+n6,1));
   bf(c4(k)+n4,1)=t1;
   bf(c4(k)+n6,1)=t2;
   y4(c4(k)+n4,1)=t1;
   y4(c4(k)+n6,1)=t2;
   %
   t1=rt2*(bf(c4(k)+n5,1)+bf(c4(k)+n7,1));
   t2=rt2*(bf(c4(k)+n5,1)-bf(c4(k)+n7,1));
   bf(c4(k)+n5,1)=t1;
   bf(c4(k)+n7,1)=t2;
   y4(c4(k)+n5,1)=t1;
   y4(c4(k)+n7,1)=t2;
end   
y8=bf-y1-y21-y22-y4;