function y=inn_4(x,gp)
% Use this for even n:
[n2,tem]=size(x);
n=n2/2;
nn=n*n;
nn2=nn+nn;
n2=n+n;
m=n/2;
rt2=1/sqrt(2);
%
if (gp==1) % sdp T_0
   d1=2;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+m;
   c1(2,2)=1+m;
   d2=2;
   c2(1,1)=1;
   c2(2,1)=1+m;
   c2(1,2)=1+m;
   c2(2,2)=1;
end
if (gp==2) % sdp T_2
   d1=m*m;
   for k1=0:n/4-1
      for k2=0:n-1
         c1(1,k1+(n/4)*k2+1)=4*k1+1;
         c1(2,k1+(n/4)*k2+1)=k2+1;
      end
   end   
   d2=m*m;
   for k1=0:n/4-1
      for k2=0:n-1
         c2(1,k1+(n/4)*k2+1)=4*k1+3;
         c2(2,k1+(n/4)*k2+1)=k2+1;
      end
   end   
end   
if (gp==3) % sdp T_3
   d1=m*m;
   for k1=0:n/4-1
      for k2=0:n/2-1
         c1(1,k1+(n/4)*k2+1)=4*k1+1;
         c1(2,k1+(n/4)*k2+1)=2*k2+1;
         c1(1,k1+(n/4)*k2+d1/2+1)=4*k1+3;
         c1(2,k1+(n/4)*k2+d1/2+1)=2*k2+2;
      end
   end   
   d2=m*m;
   for k1=0:n/4-1
      for k2=0:n/2-1
         c2(1,k1+(n/4)*k2+1)=4*k1+3;
         c2(2,k1+(n/4)*k2+1)=2*k2+1;
         c2(1,k1+(n/4)*k2+d2/2+1)=4*k1+1;
         c2(2,k1+(n/4)*k2+d2/2+1)=2*k2+2;
      end
   end   
end   
%
if (gp==11)
   d1=2*m*m-n;
   ndx1=0;
   for k1=1:m
      for k2=1:k1-1
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1-1;
         c1(2,ndx1)=2*k2-1;
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1;
         c1(2,ndx1)=2*k2;
      end
      for k2=k1+1:m
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1-1;
         c1(2,ndx1)=2*k2-1;
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1;
         c1(2,ndx1)=2*k2;
      end   
   end   
   d2=n;
   for k=1:n
      c2(1,k)=k;
      c2(2,k)=k;
   end   
end
%
if (gp==12)
   d1=2*m*m-n;
   ndx1=0;
   for k2=2:m
      ndx1=ndx1+1;
      c1(1,ndx1)=1;
      c1(2,ndx1)=2*k2-1;
   end
   for k2=1:m-1
      ndx1=ndx1+1;
      c1(1,ndx1)=2;
      c1(2,ndx1)=2*k2;
   end
   for k1=2:m
      for k2=1:m-k1+1
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1-1;
         c1(2,ndx1)=2*k2-1;
      end
      for k2=m-k1+3:m
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1-1;
         c1(2,ndx1)=2*k2-1;
      end
      for k2=1:m-k1
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1;
         c1(2,ndx1)=2*k2;
      end
      for k2=m-k1+2:m
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1;
         c1(2,ndx1)=2*k2;
      end   
   end   
   d2=n;
   c2(1,1)=1;
   c2(2,1)=1;
   for k=2:n
      c2(1,k)=k;
      c2(2,k)=n-k+2;
   end   
end
%
if (gp==21)
   d1=2*m*m-n;
   ndx1=0;
   for k1=1:m
      for k2=1:k1-1
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1-1;
         c1(2,ndx1)=2*k2-1;
      end
      for k2=k1+1:m
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1-1;
         c1(2,ndx1)=2*k2-1;
      end   
   end   
   for k1=1:m/2
      for k2=1:k1+m/2-1
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1;
         c1(2,ndx1)=2*k2;
      end
      for k2=k1+m/2+1:m
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1;
         c1(2,ndx1)=2*k2;
      end   
      for k2=1:k1-1
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1+m;
         c1(2,ndx1)=2*k2;
      end
      for k2=k1+1:m
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1+m;
         c1(2,ndx1)=2*k2;
      end   
   end   
   d2=n;
   for k=1:m/2
      c2(1,2*k-1)=2*k-1;
      c2(2,2*k-1)=2*k-1;
      c2(1,2*k)=2*k;
      c2(2,2*k)=2*k+m;
      c2(1,2*k-1+m)=2*k-1+m;
      c2(2,2*k-1+m)=2*k-1+m;
      c2(1,2*k+m)=2*k+m;
      c2(2,2*k+m)=2*k;
   end   
end
%
if (gp==22)
   d1=2*m*m-n;
   ndx1=0;
   for k2=1:m-1
      ndx1=ndx1+1;
      c1(1,ndx1)=1;
      c1(2,ndx1)=2*k2+1;
   end   
   for k1=1:m/2
      for k2=1:m/2-k1
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1;
         c1(2,ndx1)=2*k2;
      end
      for k2=m/2-k1+2:m
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1;
         c1(2,ndx1)=2*k2;
      end
      for k2=1:m-k1
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1+m;
         c1(2,ndx1)=2*k2;
      end
      for k2=m-k1+2:m
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1+m;
         c1(2,ndx1)=2*k2;
      end
   end
   for k1=1:m-1
      for k2=1:m-k1
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1+1;
         c1(2,ndx1)=2*k2-1;
      end
      for k2=m-k1+2:m
         ndx1=ndx1+1;
         c1(1,ndx1)=2*k1+1;
         c1(2,ndx1)=2*k2-1;
      end
   end   
   d2=n;
   c2(1,1)=1;
   c2(2,1)=1;
   for k=1:m/2
      c2(1,2*k)=2*k;
      c2(2,2*k)=m-2*k+2;
      c2(1,2*k+m)=2*k+m;
      c2(2,2*k+m)=n-2*k+2;
   end   
   for k=2:m
      c2(1,2*k-1)=2*k-1;
      c2(2,2*k-1)=n-2*k+3;
   end   
end
%
if (gp==23)
   d1=2*m*m-n;
   d2=n;
   ndx1=0;
   for k1=1:m/8
      c2(1,4*k1)=4*k1;
      c2(2,4*k1)=4*k1+3*m/2;
      for k2=1:2*k1+3*m/4-1
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1;
         c1(2,ndx1)=2*k2;
      end
      for k2=2*k1+3*m/4+1:m
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1;
         c1(2,ndx1)=2*k2;
      end
   end
   for k1=1+m/8:m/2
      c2(1,4*k1)=4*k1;
      c2(2,4*k1)=4*k1-m/2;
      for k2=1:2*k1-n/8-1
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1;
         c1(2,ndx1)=2*k2;
      end
      for k2=2*k1-n/8+1:m
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1;
         c1(2,ndx1)=2*k2;
      end
   end   
   for k1=1:m/2
      c2(1,4*k1-3)=4*k1-3;
      c2(2,4*k1-3)=4*k1-3;
      for k2=1:2*k1-2
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1-3;
         c1(2,ndx1)=2*k2-1;
      end
      for k2=2*k1:m
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1-3;
         c1(2,ndx1)=2*k2-1;
      end   
   end
   for k1=1:3*m/8
      c2(1,4*k1-2)=4*k1-2;
      c2(2,4*k1-2)=m/2+4*k1-2;
      for k2=1:2*k1+m/4-2
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1-2;
         c1(2,ndx1)=2*k2;
      end   
      for k2=2*k1+m/4:m
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1-2;
         c1(2,ndx1)=2*k2;
      end   
   end   
   for k1=1+3*m/8:m/2
      c2(1,4*k1-2)=4*k1-2;
      c2(2,4*k1-2)=4*k1-2-3*m/2;
      for k2=1:2*k1-3*m/4-2
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1-2;
         c1(2,ndx1)=2*k2;
      end   
      for k2=2*k1-3*m/4:m
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1-2;
         c1(2,ndx1)=2*k2;
      end   
   end
   for k1=1:m/4
      c2(1,4*k1-1)=4*k1-1;
      c2(2,4*k1-1)=4*k1-1+m;
      for k2=1:2*k1+m/2-1
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1-1;
         c1(2,ndx1)=2*k2-1;
      end
      for k2=2*k1+m/2+1:m
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1-1;
         c1(2,ndx1)=2*k2-1;
      end   
   end
   for k1=1+m/4:m/2
      c2(1,4*k1-1)=4*k1-1;
      c2(2,4*k1-1)=4*k1-1-m;
      for k2=1:2*k1-m/2-1
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1-1;
         c1(2,ndx1)=2*k2-1;
      end
      for k2=2*k1-m/2+1:m
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1-1;
         c1(2,ndx1)=2*k2-1;
      end   
   end      
end   
%
if (gp==24)
   d1=2*m*m-n;
   d2=n;
   ndx1=0;
   c2(1,1)=1;
   c2(2,1)=1;
   for k2=2:m
      ndx1=ndx1+1;
      c1(1,ndx1)=1;
      c1(2,ndx1)=2*k2-1;
   end   
   for k1=2:m/2
      c2(1,4*k1-3)=4*k1-3;
      c2(2,4*k1-3)=n-4*k1+5;
      for k2=1:m-2*k1+2
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1-3;
         c1(2,ndx1)=2*k2-1;
      end   
      for k2=m-2*k1+4:m
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1-3;
         c1(2,ndx1)=2*k2-1;
      end   
   end   
   for k1=0:m/8-1
      c2(1,4*k1+2)=4*k1+2;
      c2(2,4*k1+2)=m/2-4*k1;
      for k2=0:m/4-2*k1-2
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1+2;
         c1(2,ndx1)=2*k2+2;         
      end   
      for k2=m/4-2*k1:m-1
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1+2;
         c1(2,ndx1)=2*k2+2;         
      end   
   end
   for k1=m/8:m/2-1
      c2(1,4*k1+2)=4*k1+2;
      c2(2,4*k1+2)=n+m/2-4*k1;
      for k2=0:m+m/4-2*k1-2
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1+2;
         c1(2,ndx1)=2*k2+2;         
      end   
      for k2=m+m/4-2*k1:m-1
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1+2;
         c1(2,ndx1)=2*k2+2;         
      end   
   end   
   for k1=0:m/4-1
      c2(1,4*k1+3)=4*k1+3;
      c2(2,4*k1+3)=m-4*k1-1;
      for k2=0:m/2-2*k1-2
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1+3;
         c1(2,ndx1)=2*k2+1;
      end   
      for k2=m/2-2*k1:m-1
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1+3;
         c1(2,ndx1)=2*k2+1;
      end   
   end
   for k1=m/4:m/2-1
      c2(1,4*k1+3)=4*k1+3;
      c2(2,4*k1+3)=n+m-4*k1-1;
      for k2=0:m+m/2-2*k1-2
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1+3;
         c1(2,ndx1)=2*k2+1;
      end   
      for k2=m+m/2-2*k1:m-1
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1+3;
         c1(2,ndx1)=2*k2+1;
      end   
   end   
   for k1=0:3*m/8-1
      c2(1,4*k1+4)=4*k1+4;
      c2(2,4*k1+4)=3*m/2-4*k1-2;
      for k2=0:3*m/4-2*k1-3
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1+4;
         c1(2,ndx1)=2*k2+2;
      end   
      for k2=3*m/4-2*k1-1:m-1
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1+4;
         c1(2,ndx1)=2*k2+2;
      end   
   end   
   for k1=3*m/8:m/2-1
      c2(1,4*k1+4)=4*k1+4;
      c2(2,4*k1+4)=7*m/2-4*k1-2;
      for k2=0:7*m/4-2*k1-3
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1+4;
         c1(2,ndx1)=2*k2+2;
      end   
      for k2=7*m/4-2*k1-1:m-1
         ndx1=ndx1+1;
         c1(1,ndx1)=4*k1+4;
         c1(2,ndx1)=2*k2+2;
      end   
   end   
end   
%
%
%
for k=1:d1
   t1(1,k)=x(c1(1,k),c1(2,k));
   t1(2,k)=x(c1(1,k)+n,c1(2,k));
   t1(3,k)=x(c1(1,k),c1(2,k)+n);
   t1(4,k)=x(c1(1,k)+n,c1(2,k)+n);
end   
t1=.5*fft(t1);
for k=1:d1
   x(c1(1,k),c1(2,k))=t1(1,k);
   x(c1(1,k)+n,c1(2,k))=t1(2,k);
   x(c1(1,k),c1(2,k)+n)=t1(3,k);
   x(c1(1,k)+n,c1(2,k)+n)=t1(4,k);
end   
for k=1:d2
   t2(1,k)=x(c2(1,k),c2(2,k));
   t2(2,k)=x(c2(1,k),c2(2,k)+n);
   s2(1,k)=x(c2(1,k)+n,c2(2,k));
   s2(2,k)=x(c2(1,k)+n,c2(2,k)+n);
end   
t2=(1/sqrt(2))*fft(t2);
s2=(1/sqrt(2))*fft(s2);
for k=1:d2
   k1=c2(1,k);
   k2=c2(2,k);
   x(k1,k2)=t2(1,k);
   x(k1,k2+n)=t2(2,k);
   x(k1+n,k2)=s2(1,k);
   x(k1+n,k2+n)=s2(2,k);
end
%
y(1:n,1:n)=(1/n)*fft2(x(1:n,1:n));
y(n+1:n2,1:n)=(1/n)*fft2(x(1+n:n2,1:n));
y(1:n,1+n:n2)=(1/n)*fft2(x(1:n,1+n:n2));
y(1+n:n2,1+n:n2)=(1/n)*fft2(x(1+n:n2,1+n:n2));
