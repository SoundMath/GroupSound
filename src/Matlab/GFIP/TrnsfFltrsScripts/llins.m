function yy=llins(m,n)
%s=5;
%m=4;
%n=32;
n2=2*n;
nn=linspace(0,n2+m-1,n2+m);
mnn=mod(m*nn,n2)+1;
sl=ceil(n2/m)+2;
chk=zeros(m*sl,m*sl);
for k=1:n2+m
   chk(k,mnn(k))=1;
   chk(k+2,mnn(k)+1)=1;
   chk(k+4,mnn(k)+2)=1;
end   
yy(1:n2,1:n2)=chk(1+m:n2+m,1:n2);
