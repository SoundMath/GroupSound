function y=un_4_2(n);
n2=n+n;
n4=n2+n2;
n8=n4+n4;
nd2=n/2;
y=zeros(n8,n8);
e=eye(n,n);
a=sqrt(n)*ifft(e);
%
b0=.5*[1 1 1 1];
b1=.5*[1 i -1 -i];
b2=.5*[1 -1 1 -1];
b3=.5*[1 -i -1 i];
%
c0=1/sqrt(2)*[1 1];
c1=1/sqrt(2)*[1 -1];
d0=1/sqrt(2)*[1 0 1 0];
d1=1/sqrt(2)*[1 0 -1 0];
%
% 8-dimensional idempotents
for k2=0:7
   for k1=1:n/2
      y(2*k1+k2*n,1+k2*n:(k2+1)*n)=a(2*k1,1:n);
   end   
end   
% 
% 4-dimensional idempotents
for k1=1:n/4
   y(4*k1-1,1:n4)=kron(d0,a(4*k1-1,1:n));
   y(4*k1-1+n,1+n:n4+n)=y(4*k1-1,1:n4);
   y(4*k1-1+n4,1+n4:n8)=y(4*k1-1,1:n4);
   y(4*k1-1+n+n4,1+n+n4:n8)=y(4*k1-1,1:n4-n);
   y(4*k1-1+n2,1:n4)=kron(d1,a(4*k1-1,1:n));
   y(4*k1-1+n2+n,1+n:n4+n)=y(4*k1-1+n2,1:n4);
   y(4*k1-1+n2+n4,1+n4:n8)=y(4*k1-1+n2,1:n4);
   y(4*k1-1+n2+n+n4,1+n+n4:n8)=y(4*k1-1+n2,1:n4-n);   
end   
%
% 2-dimensional idempotents
e0=.5*[1 0  1 0  0  1  0  1];
e1=.5*[1 0 -1 0  0  1  0 -1];
e2=.5*[1 0  1 0  0 -1  0 -1];
e3=.5*[1 0 -1 0  0 -1  0  1];
f0=.5*[0 1 0  1   1  0  1  0 ];
f1=.5*[0 1 0 -1  -1  0  1  0 ];
f2=.5*[0 1 0  1  -1  0 -1  0 ];
f3=.5*[0 1 0 -1   1  0 -1  0 ];
for k=1:n/8-1
   kk=4*k+1;
   kk2=kk+n/2;
   y(kk,:)=kron(e0,a(kk,:));
   y(kk+n2,:)=kron(e1,a(kk,:));
   y(kk+n4+n,:)=kron(e2,a(kk,:));
   y(kk+n8-n,:)=kron(e3,a(kk,:));
   
   y(kk+n,:)=kron(f0,a(kk,:));
   y(kk+n2+n,:)=kron(f1,a(kk,:));
   y(kk+n4+n2,:)=kron(f2,a(kk,:));
   y(kk+n4,:)=kron(f3,a(kk,:));
   
   y(kk2,:)=kron(e0,a(kk2,:));
   y(kk2+n2,:)=kron(e1,a(kk2,:));
   y(kk2+n4+n,:)=kron(e2,a(kk2,:));
   y(kk2+n8-n,:)=kron(e3,a(kk2,:));
   
   y(kk2+n,:)=kron(f0,a(kk2,:));
   y(kk2+n2+n,:)=kron(f1,a(kk2,:));
   y(kk2+n4+n2,:)=kron(f2,a(kk2,:));
   y(kk2+n4,:)=kron(f3,a(kk2,:));
end   
%
y(1+n,1:n4)=kron(b1,a(1,1:n));
y(1+n+n4,1+n4:n8)=y(1+n,1:n4);
y(1+n2+n,1:n4)=kron(b3,a(1,1:n));
y(1+n2+n+n4,1+n4:n8)=y(1+n2+n,1:n4);
y(nd2+1+n,1:n4)=kron(b1,a(nd2+1,1:n));
y(nd2+1+n+n4,1+n4:n8)=y(nd2+1+n,1:n4);
y(nd2+1+n2+n,1:n4)=kron(b3,a(nd2+1,1:n));
y(nd2+1+n2+n+n4,1+n4:n8)=y(nd2+1+n2+n,1:n4);
%
% 1-dimensional idempotents
y(1,1:n8)=kron(kron(c0,b0),a(1,1:n));
y(1+n2,1:n8)=kron(kron(c0,b2),a(1,1:n));
y(1+n4,1:n8)=kron(kron(c1,b0),a(1,1:n));
y(1+n2+n4,1:n8)=kron(kron(c1,b2),a(1,1:n));
y(nd2+1,1:n8)=kron(kron(c0,b0),a(nd2+1,1:n));
y(nd2+1+n2,1:n8)=kron(kron(c0,b2),a(nd2+1,1:n));
y(nd2+1+n4,1:n8)=kron(kron(c1,b0),a(nd2+1,1:n));
y(nd2+1+n2+n4,1:n8)=kron(kron(c1,b2),a(nd2+1,1:n));
