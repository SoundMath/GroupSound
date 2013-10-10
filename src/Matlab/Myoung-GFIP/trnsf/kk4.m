function [y1,y2,y4]=nn_4(x,gp)
% n must be a multiple of 4
[n2,tem]=size(x);
n=n2/2;
nn=n*n;
nn2=nn+nn;
n2=n+n;
m=n/2;
l=n/4;
rt2=1/sqrt(2);
%
bf(1:n,1:n)=n*ifft2(x(1:n,1:n));
bf(1+n:n2,1:n)=n*ifft2(x(1+n:n2,1:n));
bf(1:n,1+n:n2)=n*ifft2(x(1:n,1+n:n2));
bf(1+n:n2,1+n:n2)=n*ifft2(x(1+n:n2,1+n:n2));
%
y1=zeros(n2,n2);
y2=zeros(n2,n2);
y4=zeros(n2,n2);
%
if (gp==101)                    %[0 m-1;-1 m]
   d1=n;                        %(k,(m-1)k)
   c1(1,1:n)=linspace(1,n,n);
   c1(2,1:n)=rem((m-1)*(c1(1,:)-1),n)+1;
   d2=n*m;
   ev=linspace(0,n-2,m)+1;
   od=linspace(1,n-1,m)+1;
   c2(1,1:m*m)=repmat(ev,1,m);
   c2(2,1:m*m)=kron(ev,ones(1,m));
   c2(1,1+m*m:n*m)=repmat(od,1,m);
   c2(2,1+m*m:n*m)=kron(od,ones(1,m));
end   
%
if (gp==102)                    %[m l+1;l+1 0]
   d1=n;                        %(k,(l+1)k)
   c1(1,1:n)=linspace(1,n,n);
   c1(2,1:n)=rem((l+1)*(c1(1,:)-1),n)+1;
   d2=n*m;
   ev=linspace(0,n-2,m)+1;
   od=linspace(1,n-1,m)+1;
   c2(1,1:m*m)=repmat(ev,1,m);
   c2(2,1:m*m)=kron(ev,ones(1,m));
   c2(1,1+m*m:n*m)=repmat(od,1,m);
   c2(2,1+m*m:n*m)=kron(od,ones(1,m));
end   
%
if (gp==103)                    %[m l-1;l-1 0]
   d1=n;                        %(k,(l-1)k)
   c1(1,1:n)=linspace(1,n,n);
   c1(2,1:n)=rem((l-1)*(c1(1,:)-1),n)+1;
   d2=n*m;
   ev=linspace(0,n-2,m)+1;
   od=linspace(1,n-1,m)+1;
   c2(1,1:m*m)=repmat(ev,1,m);
   c2(2,1:m*m)=kron(ev,ones(1,m));
   c2(1,1+m*m:n*m)=repmat(od,1,m);
   c2(2,1+m*m:n*m)=kron(od,ones(1,m));
end   
%
%
%
for k=1:d1
   t1(1,k)=bf(c1(1,k),c1(2,k));
   t1(2,k)=bf(c1(1,k)+n,c1(2,k));
   t1(3,k)=bf(c1(1,k),c1(2,k)+n);
   t1(4,k)=bf(c1(1,k)+n,c1(2,k)+n);
end   
t1=2*ifft(t1);
for k=1:d1
   y1(c1(1,k),c1(2,k))=t1(1,k);
   y1(c1(1,k)+n,c1(2,k))=t1(2,k);
   y1(c1(1,k),c1(2,k)+n)=t1(3,k);
   y1(c1(1,k)+n,c1(2,k)+n)=t1(4,k);
end   
for k=1:d2
   t2(1,k)=bf(c2(1,k),c2(2,k));
   t2(2,k)=bf(c2(1,k),c2(2,k)+n);
   s2(1,k)=bf(c2(1,k)+n,c2(2,k));
   s2(2,k)=bf(c2(1,k)+n,c2(2,k)+n);
end   
t2=sqrt(2)*ifft(t2);
s2=sqrt(2)*ifft(s2);
for k=1:d2
   k1=c2(1,k);
   k2=c2(2,k);
   bf(k1,k2)=t2(1,k);
   bf(k1,k2+n)=t2(2,k);
   bf(k1+n,k2)=s2(1,k);
   bf(k1+n,k2+n)=s2(2,k);
   y2(k1,k2)=bf(k1,k2);
   y2(k1+n,k2)=bf(k1+n,k2);
   y2(k1,k2+n)=bf(k1,k2+n);
   y2(k1+n,k2+n)=bf(k1+n,k2+n);
end
for k=1:d1
   bf(c1(1,k),c1(2,k))=y1(c1(1,k),c1(2,k));
   bf(c1(1,k)+n,c1(2,k))=y1(c1(1,k)+n,c1(2,k));
   bf(c1(1,k),c1(2,k)+n)=y1(c1(1,k),c1(2,k)+n);
   bf(c1(1,k)+n,c1(2,k)+n)=y1(c1(1,k)+n,c1(2,k)+n);
   y2(c1(1,k),c1(2,k))=0;
   y2(c1(1,k)+n,c1(2,k))=0;
   y2(c1(1,k),c1(2,k)+n)=0;
   y2(c1(1,k)+n,c1(2,k)+n)=0;
end   
%
y4=bf-y1-y2;
