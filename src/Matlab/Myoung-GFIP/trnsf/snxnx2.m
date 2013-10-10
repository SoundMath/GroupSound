clear;
n=10;
nn=n*n;
nn2=nn*2;
rt2=sqrt(2);
a=conj(fft(eye(n)));
b=kron(a,a);
c=zeros(nn2,nn2);
c(1:nn,1:nn)=b;
c(nn+1:nn2,nn+1:nn2)=b;
for i=0:n-1
   ii=i*(n+1)+1;
   c(ii,1:nn)=1/rt2*b(ii,1:nn);
   c(ii,nn+1:nn2)=1/rt2*b(ii,1:nn);
   c(ii+nn,1:nn)=1/rt2*b(ii,1:nn);
   c(ii+nn,nn+1:nn2)=-1/rt2*b(ii,1:nn);
end
c=(1/n)*c;
%f=rand(n,2*n);
%for k=1:2*n
%   f(4,k)=1.5;
%end   
%for k=1:n
%   f(k,k)=f(k,k)+10;
%end 
%for k=2:n
%   f(k,k+n)=f(k,k+n)+10;
%end   
%
f=rand(n,n*2);
cf=c*reshape(f,nn2,1);
d1=zeros(nn2,1);
d2=zeros(nn2,1);
for k=1:n
   d1(k+(k-1)*n)=cf(k+(k-1)*n);
end
d2=cf-d1;
b1=c'*d1;
b2=c'*d2;

bb1=reshape(b1,n,2*n);
bb2=reshape(b2,n,2*n);
