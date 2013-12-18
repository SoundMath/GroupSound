function y=inn_2(x,gp)
% Use this for even m and even n:
[nx,ny]=size(x);
n=min(nx,ny);
m=n/2;
n2=n+n;
rt2=1/sqrt(2);
sc=1/n;
%
if (gp==1) % (y,x)
   d1=n;
   for k=1:n
      c1(1,k)=k;
      c1(2,k)=k;
   end   
end
%
if (gp==2) % (x+y,-y)
   d1=n;
   for k=1:m
      c1(1,k)=2*k-1;
      c1(2,k)=k;
      c1(1,k+m)=2*k-1;
      c1(2,k+m)=k+m;
   end   
end
%
if (gp==3) % (-x-y,y)
   d1=n;
   for k=1:n
      c1(1,k)=1;
      c1(2,k)=k;
   end   
end
%
if (gp==4) % (x,x-y)
   d1=n;
   for k=1:n
      c1(1,k)=k;
      c1(2,k)=1;
   end   
end
%
if (gp==5) % (x,-x-y)
   d1=n;
   for k=0:n-1
      c1(1,k+1)=mod(2*k,n)+1;
      c1(2,k+1)=mod(n-k,n)+1;
   end   
end
%
if (gp==6) % (-x,-x+y)
   d1=n;
   for k=1:n
      c1(1,k)=k;
      c1(2,k)=mod(n-2*k,n)+1;
   end   
end
%
if (gp==7) % (-x,y)
   d1=2*n;
   for k=1:n
      c1(1,k)=1;
      c1(2,k)=k;
      c1(1,k+n)=n/2+1;
      c1(2,k+n)=k;
   end   
end
%
%
%
%
if (ny > nx)
   for k=1:d1
      t1(1,k)=x(c1(1,k),c1(2,k));
      t1(2,k)=x(c1(1,k),c1(2,k)+n);
   end      
   t1=rt2*fft(t1);
   for k=1:d1
      x(c1(1,k),c1(2,k))=t1(1,k);
      x(c1(1,k),c1(2,k)+n)=t1(2,k);
   end
   y(1:n,1:n)=sc*fft2(x(1:n,1:n));
   y(1:n,1+n:n2)=sc*fft2(x(1:n,1+n:n2));
else   
   for k=1:d1
      t1(1,k)=x(c1(1,k),c1(2,k));
      t1(2,k)=x(c1(1,k)+n,c1(2,k));
   end      
   t1=rt2*fft(t1);
   for k=1:d1
      x(c1(1,k),c1(2,k))=t1(1,k);
      x(c1(1,k)+n,c1(2,k))=t1(2,k);
   end
   y(1:n,1:n)=sc*fft2(x(1:n,1:n));
   y(1+n:n2,1:n)=sc*fft2(x(1+n:n2,1:n));
end   
