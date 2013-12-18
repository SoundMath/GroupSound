function [y1,y2,y4]=n_22(x)
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
sc=sqrt(n1);
y1=zeros(n4,1);
y2=zeros(n4,1);
y4=zeros(n4,1);
%
bf(1:n1,1)=sc*ifft(x(1:n1,1));
bf(1+n1:n2,1)=sc*ifft(x(1+n1:n2,1));
bf(1+n2:n3,1)=sc*ifft(x(1+n2:n3,1));
bf(1+n3:n4,1)=sc*ifft(x(1+n3:n4,1));
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
   t0=.5*(bf(c1(k),1)+bf(c1(k)+n2,1));
   t2=.5*(bf(c1(k),1)-bf(c1(k)+n2,1));
   t1=.5*(bf(c1(k)+n1,1)+bf(c1(k)+n3,1));
   t3=.5*(bf(c1(k)+n1,1)-bf(c1(k)+n3,1));
   bf(c1(k),1)=t0+t1;
   bf(c1(k)+n1,1)=t2+t3;
   bf(c1(k)+n2,1)=t0-t1;
   bf(c1(k)+n3,1)=t2-t3;
   y1(c1(k),1)=bf(c1(k),1);
   y1(c1(k)+n1,1)=bf(c1(k)+n1,1);
   y1(c1(k)+n2,1)=bf(c1(k)+n2,1);
   y1(c1(k)+n3,1)=bf(c1(k)+n3,1);   
end
for k=1:d2
   t0=rt2*(bf(c2(k),1)+bf(c2(k)+n2,1));
   t1=rt2*(bf(c2(k),1)-bf(c2(k)+n2,1));
   bf(c2(k),1)=t0;
   bf(c2(k)+n2,1)=t1;
   y2(c2(k),1)=bf(c2(k),1);
   y2(c2(k)+n1,1)=bf(c2(k)+n1,1);
   y2(c2(k)+n2,1)=bf(c2(k)+n2,1);
   y2(c2(k)+n3,1)=bf(c2(k)+n3,1);
end   
y4=bf-y1-y2;
   