clear;
n=16;
nm=n*16;
%
gp=22;
s2=1;
gg=bkgd(s2,1,n);
mm=max(max(gg));
sc=256/mm;
ns=mm*rand(nm,nm);
ngg=gg+ns;
