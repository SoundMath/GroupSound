function y=iscl2(x,n,gp)
% Use this for even n:
n2=n+n;
m=n/2;
l=n/4;
rt2=1/sqrt(2);
%
if (gp==1) %[-1 0;0 1],[1 0;0 -1]
   d1=4;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+m;
   c1(2,2)=1;
   c1(1,3)=1+m;
   c1(2,3)=1;
   c1(1,4)=1+m;
   c1(2,4)=1+m;
   d21=2*n-4;
   for k=2:m
      c21(1,k-1)=k;
      c21(2,k-1)=1;
      c21(1,k-2+m)=k+m;
      c21(2,k-2+m)=1;
      c21(1,k-3+n)=k;
      c21(2,k-3+n)=1+m;
      c21(1,k-4+m+n)=k+m;
      c21(2,k-4+m+n)=1+m;
   end   
   d22=2*n-4;
   for k=2:m
      c22(1,k-1)=1;
      c22(2,k-1)=k;
      c22(1,k-2+m)=1;
      c22(2,k-2+m)=k+m;
      c22(1,k-3+n)=1+m;
      c22(2,k-3+n)=k;
      c22(1,k-4+m+n)=1+m;
      c22(2,k-4+m+n)=k+m;
   end   
end   
%
if (gp==2) %[n/2+1 0;0 1],[1 0;0 n/2+1]
   d1=m*m;
   d21=m*m;
   d22=m*m;
   for k1=0:m-1
      for k2=0:m-1
         c1(1,k1+m*k2+1)=2*k1+1;   
         c1(2,k1+m*k2+1)=2*k2+1;
         c21(1,k1+m*k2+1)=2*k1+1;   
         c21(2,k1+m*k2+1)=2*k2+2;
         c22(1,k1+m*k2+1)=2*k1+2;   
         c22(2,k1+m*k2+1)=2*k2+1;
      end
   end   
end   
%
%
%
for k=1:d1
   t1(1,k)=x(c1(1,k),c1(2,k));
   t1(3,k)=x(c1(1,k),c1(2,k)+n);
   t1(2,k)=x(c1(1,k)+n,c1(2,k));
   t1(4,k)=x(c1(1,k)+n,c1(2,k)+n);
end      
t1=f22(t1,d1);
for k=1:d1
   x(c1(1,k),c1(2,k))=t1(1,k);
   x(c1(1,k),c1(2,k)+n)=t1(3,k);
   x(c1(1,k)+n,c1(2,k))=t1(2,k);
   x(c1(1,k)+n,c1(2,k)+n)=t1(4,k);
end
for k=1:d21
   t21(1,k)=x(c21(1,k),c21(2,k));
   t21(2,k)=x(c21(1,k)+n,c21(2,k));
end   
t21=rt2*fft(t21);
for k=1:d21
   x(c21(1,k),c21(2,k))=t21(1,k);
   x(c21(1,k)+n,c21(2,k))=t21(2,k);
end
for k=1:d22
   t22(1,k)=x(c22(1,k),c22(2,k));
   t22(2,k)=x(c22(1,k),c22(2,k)+n);
end   
t22=rt2*fft(t22);
for k=1:d22
   x(c22(1,k),c22(2,k))=t22(1,k);
   x(c22(1,k),c22(2,k)+n)=t22(2,k);
end
%
y(1:n,1:n)=(1/n)*fft2(x(1:n,1:n));
y(1+n:n2,1:n)=(1/n)*fft2(x(1+n:n2,1:n));
y(1:n,1+n:n2)=(1/n)*fft2(x(1:n,1+n:n2));
y(1+n:n2,1+n:n2)=(1/n)*fft2(x(1+n:n2,1+n:n2));
