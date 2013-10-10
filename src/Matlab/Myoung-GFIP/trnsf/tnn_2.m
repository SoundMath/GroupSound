clear;
n=16;
n2=n+n;
m=n/2;
u=rand(n2,1);
v=rand(n2,1);
%
gp=1;
uu=gn_2(u,gp);
y=uu*v;
%
yy=cn_2(u,v,gp);
%
% convolution theorem
for k=1:n2
   [f1,f2]=n_2(uu(:,k),gp);
   fu(:,k)=f1+f2;
end   
fut=fu';
for k=1:n2
   [f1,f2]=n_2(fut(:,k),gp);
   ffu(:,k)=f1+f2;
end
fuf=ffu';
[fv1,fv2]=n_2(v,gp);
fv=fv1+fv2;
dd=fuf*fv;
c2=in_2(dd,gp);
%
%
