%function [y1,y2,y4]=sn2_22(x,n)
% Use this for even n:
% (C_n x C_n) sdp (C_2 x C_2)
clear;
n=8;
nn=n*n;
nn2=nn+nn;
nn3=nn2+nn;
nn4=nn3+nn;
n2=n+n;
m=n/2;
rt2=1/sqrt(2);
%
f=ifft(eye(n));
ff=n*kron(f,f);
%
bf(1:nn,1:nn)=ff;
bf(1+nn:nn2,1+nn:nn2)=ff;
bf(1+nn2:nn3,1+nn2:nn3)=ff;
bf(1+nn3:nn4,1+nn3:nn4)=ff;
%
% 1-d idempotents
x(1,1:nn)=.5*bf(1,1:nn);
bf(1,1:nn)     =x;
bf(1,1+nn:nn2) =x;
bf(1,1+nn2:nn3)=x;
bf(1,1+nn3:nn4)=x;
bf(1+nn,1:nn)     = x;
bf(1+nn,1+nn:nn2) =-x;
bf(1+nn,1+nn2:nn3)= x;
bf(1+nn,1+nn3:nn4)=-x;
bf(1+nn2,1:nn)     = x;
bf(1+nn2,1+nn:nn2) = x;
bf(1+nn2,1+nn2:nn3)=-x;
bf(1+nn2,1+nn3:nn4)=-x;
bf(1+nn3,1:nn)     = x;
bf(1+nn3,1+nn:nn2) =-x;
bf(1+nn3,1+nn2:nn3)=-x;
bf(1+nn3,1+nn3:nn4)= x;
%
x=.5*bf(1+m+m*n,1:nn);
bf(1+m+m*n,1:nn)     =x; 
bf(1+m+m*n,1+nn:nn2) =x;
bf(1+m+m*n,1+nn2:nn3)=x;
bf(1+m+m*n,1+nn3:nn4)=x;
bf(1+m+m*n+nn,1:nn)     = x;
bf(1+m+m*n+nn,1+nn:nn2) =-x;
bf(1+m+m*n+nn,1+nn2:nn3)= x;
bf(1+m+m*n+nn,1+nn3:nn4)=-x;
bf(1+m+m*n+nn2,1:nn)     = x;
bf(1+m+m*n+nn2,1+nn:nn2) = x;
bf(1+m+m*n+nn2,1+nn2:nn3)=-x;
bf(1+m+m*n+nn2,1+nn3:nn4)=-x;
bf(1+m+m*n+nn3,1:nn)     = x;
bf(1+m+m*n+nn3,1+nn:nn2) =-x;
bf(1+m+m*n+nn3,1+nn2:nn3)=-x;
bf(1+m+m*n+nn3,1+nn3:nn4)= x;
%
% 2-d idempotents
x=rt2*bf(1+m*n,1:nn);
bf(1+m*n,1:nn)         = x;
bf(1+m*n,1+nn2:nn3)    = x;
bf(1+m*n+nn2,1:nn)     = x;
bf(1+m*n+nn2,1+nn2:nn3)=-x;
x=rt2*bf(1+m,1:nn);
bf(1+m,1:nn)         = x;
bf(1+m,1+nn2:nn3)    = x;
bf(1+m+nn2,1:nn)     = x;
bf(1+m+nn2,1+nn2:nn3)=-x;
for k=2:m
   x=rt2*bf(k+(k-1)*n,1:nn);
   bf(k+(k-1)*n,1:nn)       = x;
   bf(k+(k-1)*n,1+nn:nn2)   = x;
   bf(k+(k-1)*n+nn,1:nn)    = x;
   bf(k+(k-1)*n+nn,1+nn:nn2)=-x;
   x=rt2*bf(k+m+(k+m-1)*n,1:nn);
   bf(k+m+(k+m-1)*n,1:nn)       = x;
   bf(k+m+(k+m-1)*n,1+nn:nn2)   = x;
   bf(k+m+(k+m-1)*n+nn,1:nn)    = x;
   bf(k+m+(k+m-1)*n+nn,1+nn:nn2)=-x;
   x=rt2*bf(k+n*(n-k+1),1:nn);
   bf(k+n*(n-k+1),1:nn)         = x;
   bf(k+n*(n-k+1),1+nn3:nn4)    = x;
   bf(k+n*(n-k+1)+nn3,1:nn)     = x;
   bf(k+n*(n-k+1)+nn3,1+nn3:nn4)=-x;
   x=rt2*bf(k+m+n*(n-k-m+1),1:nn);
   bf(k+m+n*(n-k-m+1),1:nn)         = x;
   bf(k+m+n*(n-k-m+1),1+nn3:nn4)    = x;
   bf(k+m+n*(n-k-m+1)+nn3,1:nn)     = x;
   bf(k+m+n*(n-k-m+1)+nn3,1+nn3:nn4)=-x;
end   
%
xx(1:n2,1:n2)=rand(n2,n2);
x1=xx(1:n,1:n);
x2=xx(1+n:n2,1:n);
x3=xx(1:n,1+n:n2);
x4=xx(1+n:n2,1+n:n2);
y(1:nn,1)=reshape(x1,nn,1);
y(1+nn:nn2,1)=reshape(x2,nn,1);
y(1+nn2:nn3,1)=reshape(x3,nn,1);
y(1+nn3:nn4,1)=reshape(x4,nn,1);
%
% filtering by dimensionality
by=bf*y;
id1=zeros(nn4,1);
id2=zeros(nn4,1);
id4=zeros(nn4,1);
id1(1,1)=by(1);
id1(1+nn,1)=by(1+nn);
id1(1+nn2,1)=by(1+nn2);
id1(1+nn3,1)=by(1+nn3);
%
id1(1+m+m*n,1)=by(1+m+m*n); 
id1(1+m+m*n+nn,1)=by(1+m+m*n+nn);
id1(1+m+m*n+nn2,1)=by(1+m+m*n+nn2);
id1(1+m+m*n+nn3,1)=by(1+m+m*n+nn3);
idd1(1:n,1:n)=reshape(id1(1:nn,1),n,n);
idd1(1+n:n2,1:n)=reshape(id1(1+nn:nn2,1),n,n);
idd1(1:n,1+n:n2)=reshape(id1(1+nn2:nn3,1),n,n);
idd1(1+n:n2,1+n:n2)=reshape(id1(1+nn3:nn4,1),n,n);
%
id2(1+m*n,1)=by(1+m*n);
id2(1+m*n+nn2,1)=by(1+m*n+nn2);
id2(1+m,1)=by(1+m);
id2(1+m+nn2,1)=by(1+m+nn2);
for k=2:m
   id2(k+(k-1)*n,1)=by(k+(k-1)*n);
   id2(k+(k-1)*n+nn,1)=by(k+(k-1)*n+nn);
   id2(k+m+(k+m-1)*n,1)=by(k+m+(k+m-1)*n);
   id2(k+m+(k+m-1)*n+nn,1)=by(k+m+(k+m-1)*n+nn);
   id2(k+n*(n-k+1),1)=by(k+n*(n-k+1));
   id2(k+n*(n-k+1)+nn3,1)=by(k+n*(n-k+1)+nn3);
   id2(k+m+n*(n-k-m+1),1)=by(k+m+n*(n-k-m+1));
   id2(k+m+n*(n-k-m+1)+nn3,1)=by(k+m+n*(n-k-m+1)+nn3);
end   
idd2(1:n,1:n)=reshape(id2(1:nn,1),n,n);
idd2(1+n:n2,1:n)=reshape(id2(1+nn:nn2,1),n,n);
idd2(1:n,1+n:n2)=reshape(id2(1+nn2:nn3,1),n,n);
idd2(1+n:n2,1+n:n2)=reshape(id2(1+nn3:nn4,1),n,n);
%
[fs1,fs2,fs4]=nn2_22(xx,n);
%
bk1=bf'*id1;
bb1(1:n,1:n)=reshape(bk1(1:nn,1),n,n);
bb1(1+n:n2,1:n)=reshape(bk1(1+nn:nn2,1),n,n);
bb1(1:n,1+n:n2)=reshape(bk1(1+nn2:nn3,1),n,n);
bb1(1+n:n2,1+n:n2)=reshape(bk1(1+nn3:nn4,1),n,n);
%
fst1=inn2_22(fs1,n);
%
bk2=bf'*id2;
bb2(1:n,1:n)=reshape(bk2(1:nn,1),n,n);
bb2(1+n:n2,1:n)=reshape(bk2(1+nn:nn2,1),n,n);
bb2(1:n,1+n:n2)=reshape(bk2(1+nn2:nn3,1),n,n);
bb2(1+n:n2,1+n:n2)=reshape(bk2(1+nn3:nn4,1),n,n);
%
fst2=inn2_22(fs2,n);
%
