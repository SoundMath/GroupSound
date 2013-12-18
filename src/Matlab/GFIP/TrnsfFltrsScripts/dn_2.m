%function y=dn_2(u,v);
clear;
u=rand(8,1);
v=rand(8,1);
[sx,sy]=size(u);
nn=sx;
n=sx/2;
%
xx(1:n,1)=u(1:n,1);
u1(1:n,1)=xx;
for k=2:n
   u1(1:n-1,k)=u1(2:n,k-1);
   u1(n,k)=u1(1,k-1);
end   


%uu=[u1 u2;u2 u1];
