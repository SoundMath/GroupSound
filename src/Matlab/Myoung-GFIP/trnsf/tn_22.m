clear;
n=8;
n2=n+n;
n4=n2+n2;
m=n/2;
u=rand(n4,1);
v=rand(n4,1);
%
[x1,x2,x4]=n_22(u);
xx1=in_22(x1);
xx2=in_22(x2);
xx4=in_22(x4);
%
uu=gn_22(u);
y=uu*v;
%
%yy=cn_22(u,v);
%
% convolution theorem
for k=1:n4
   [f1,f2,f4]=n_22(uu(:,k));
   fu(:,k)=f1+f2+f4;
end   
fut=fu';
for k=1:n4
   [f1,f2,f4]=n_22(fut(:,k));
   ffu(:,k)=f1+f2+f4;
end
fuf=ffu';
[fv1,fv2,fv4]=n_22(v);
fv=fv1+fv2+fv4;
dd=fuf*fv;
c2=in_22(dd);
%
%
