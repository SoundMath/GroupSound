clear;
n=16;
n2=n*2;
% gp: 11, 13, 14, 23, 29, 31
s2=1;
gg=bkgd(s2,8,n);
mm=max(max(gg));
sc=128/mm;
ns=mm*rand(n2,n2);
ngg=gg+ns;
%
gp=1;
[v1,v2,v4]=dgn22(gg,n,gp);
vv1=real(idgn22(v1,n,gp));
vv2=real(idgn22(v2,n,gp));
vv4=real(idgn22(v4,n,gp));
