clear;
s=0; %(s can be 0, 1 or 2 for directionality)
m=3; %(m can be 1 to the half of the image size;
     % and determines size of the basic structure.)
n=128; %(2*n is the imagesize)
y0=bkgd(s,m,n);
%
s1=1;
m1=5;
n1=n;
y1=bkgd(s1,m1,n1);
%
yy1=zeros(2*n,2*n);
yy2=zeros(2*n,2*n);
%
yy1=y0+y1;
%
yy2(1:n,1:n)=y0(1:n,1:n);
yy2(1:n,1+n:2*n)=y1(1:n,1:n);
yy2(1+n:n*2,1:n)=y1(1:n,1+n:2*n);
yy2(1+n:2*n,1+n:2*n)=y0(1:n,1+n:2*n);

