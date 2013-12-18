clear;
n=8*9;
m=n/2;
l=n/3;
l2=l+l;
a1=[0 1;l+1 l2];
a2=mod(a1*a1,n);
a3=mod(a2*a1,n);
a4=mod(a3*a1,n);
a5=mod(a4*a1,n);
a6=mod(a5*a1,n);
%
b1=[0 l2+1;1 0];
b2=mod(b1*b1,n);
b3=mod(b2*b1,n);
b4=mod(b3*b1,n);
b5=mod(b4*b1,n);
b6=mod(b5*b1,n);
