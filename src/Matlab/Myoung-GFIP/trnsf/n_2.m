function [y1,y2]=n_2(x,gp)
[n2,tem]=size(x);
%
% Use this routine for even n.
% C_n sdp C_2 
%
n=n2/2;
m=n/2;
rt2=1/sqrt(2);
y1=zeros(n2,1);
y2=zeros(n2,1);
%
bf(1:n,1)=sqrt(n)*ifft(x(1:n,1));
bf(1+n:n2,1)=sqrt(n)*ifft(x(1+n:n2,1));
%
if (gp==1) % x --> x^-1
   d1=2;
   c1(1)=1;
   c1(2)=1+m;
end   
%
if (gp==2) % x^k --> x^(m+1)k
   d1=m;
   for k=1:m
      c1(k)=2*k-1;
   end   
end
%
if (gp==3) % x^k --> x^(m-1)k
   d1=2;
   c1(1)=1;
   c1(2)=1+m;
end
%
%
%
for k=1:d1
   t1=rt2*(bf(c1(k),1)+bf(c1(k)+n,1));
   t2=rt2*(bf(c1(k),1)-bf(c1(k)+n,1));
   bf(c1(k),1)=t1;
   bf(c1(k)+n,1)=t2;
   y1(c1(k),1)=t1;
   y1(c1(k)+n,1)=t2;
end
y2=bf-y1;
   