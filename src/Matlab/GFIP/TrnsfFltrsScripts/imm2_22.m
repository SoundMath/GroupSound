function y=imm2_22(x,n,gp)
% Use this for even n:
n2=n+n;
m=n/2;
rt2=1/sqrt(2);
%
%
if (gp==12) % sdp (R22 x A_29)
   d1=m;
   for k=1:m
      c1(1,k)=2*k-1;
      c1(2,k)=2*k-1;
   end   
   d21=m;
   for k=1:m
      kk1=2*k;
      c21(1,k)=kk1;
      c21(2,k)=kk1;
   end   
   d22=m*m-m;
   knt=0;
   for k2=0:m-1
      kk2=1+2*k2;
      for k1=0:k2-1
         kk1=1+2*k1;
         knt=knt+1;
         c22(1,knt)=kk1;
         c22(2,knt)=kk2;
      end
      for k1=k2+1:m-1
         kk1=1+2*k1;
         knt=knt+1;
         c22(1,knt)=kk1;
         c22(2,knt)=kk2;
      end   
   end   
   d23=m;
   for k=0:m/2-1
      k1=2+2*k;
      kk1=m+k1;
      c23(1,k+1)=k1;
      c23(2,k+1)=kk1;
      c23(1,m/2+k+1)=kk1;
      c23(2,m/2+k+1)=k1;
   end   
end
%
if (gp==103) % sdp (R22 x A_30)
   d1=2;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+m;
   c1(2,2)=1+m;
   d21=2;
   c21(1,1)=1+m;
   c21(2,1)=1;
   c21(1,2)=1;
   c21(2,2)=1+m;
   d22=n-2;
   for k=1:m-1
      c22(1,k)=k+1;
      c22(2,k)=k+1;
      c22(1,k+m-1)=m+k+1;
      c22(2,k+m-1)=m+k+1;
   end   
   d23=n-2;
   for k=1:m/2-1
      c23(1,k)=2*k+1;
      c23(2,k)=n-2*k+1;
      c23(1,k+m/2-1)=2*k+m+1;
      c23(2,k+m/2-1)=m-2*k+1;
   end
   for k=0:m/2-1
      c23(1,m-2+k+1)=2*k+2;
      c23(2,m-2+k+1)=m-2*k;
      c23(1,m-2+m/2+k+1)=2*k+m+2;
      c23(2,m-2+m/2+k+1)=n-2*k;
   end   
end
%
if (gp==104) % sdp (A_12 x A_30)
   d1=m;
   c1(1,1)=1;
   c1(2,1)=1;
   for k=2:m
      c1(1,k)=2*k-1;
      c1(2,k)=n-2*k+3;
   end   
   d21=m*m-m;
   for k2=1:m-1
      c21(1,k2)=1;
      c21(2,k2)=2*k2+1;
   end   
   knt=m-1;
   for k1=1:m-1
      for k2=0:m-1
         if (k2~=m-k1)
            knt=knt+1;
            c21(1,knt)=2*k1+1;
            c21(2,knt)=2*k2+1;
         end   
      end   
   end  
   d22=m;
   for k=0:m-1
      c22(1,k+1)=2*k+2;
      c22(2,k+1)=n-2*k;
   end   
   d23=m;
   c23(1,1)=2;
   c23(2,1)=m;
   c23(1,m/2+1)=m+2;
   c23(2,m/2+1)=n;
   for k=1:m/2-1
      c23(1,k+1)=2*k+2;
      c23(2,k+1)=m-2*k;
      c23(1,m/2+k+1)=2*k+m+2;
      c23(2,m/2+k+1)=n-2*k;
   end   
end
%
if (gp==15) % sdp (A_12 x A_29)
   d1=2;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=m+1;
   c1(2,2)=m+1;
   d21=2;
   c21(1,1)=m+1;
   c21(2,1)=1;
   c21(1,2)=1;
   c21(2,2)=m+1;
   d22=n-2;
   for k=1:m-1
      c22(1,k)=k+1;
      c22(2,k)=n-k+1;
      c22(1,k+m-1)=k+m+1;
      c22(2,k+m-1)=m-k+1;
   end   
   d23=n-2;
   for k=1:m/2-1
      c23(1,k)=2*k+1;
      c23(2,k)=2*k+1;
      c23(1,k+m/2-1)=2*k+m+1;
      c23(2,k+m/2-1)=2*k+m+1;
   end   
   for k=0:m/2-1
      c23(1,k+m-1)=2*k+2;
      c23(2,k+m-1)=m+2*k+2;
      c23(1,k+m-1+m/2)=2*k+m+2;
      c23(2,k+m-1+m/2)=2*k+2;
   end   
end
%
if (gp==18) % sdp (A_71 x A_23)
   d1=m;
   for k=0:m/2-1
      c1(1,k+1)=2*k+1;
      c1(2,k+1)=4*k+1;
      c1(1,k+1+m/2)=2*k+m+1;
      c1(2,k+1+m/2)=4*k+1;
   end   
   d21=m*m-m;
   knt=0;
   for k2=0:m/2-1
      for k1=0:m-1
         if (k1~=k2 & k1~=k2+m/2)
            knt=knt+1;
            c21(1,knt)=2*k1+1;
            c21(2,knt)=4*k2+1;
         end   
         knt=knt+1;
         c21(1,knt)=2*k1+1;
         c21(2,knt)=4*k2+3;
      end   
   end   
   d22=m;
   for k=0:m/2-1
      c22(1,k+1)=2*k+2;
      c22(2,k+1)=4*k+3;
      c22(1,k+1+m/2)=2*k+m+2;
      c22(2,k+1+m/2)=4*k+3;
   end   
   d23=m;
   for k=0:m-1
      c23(1,k+1)=2*k+2;
      c23(2,k+1)=4*k+2+m;
   end
   c23(2,:)=mod(c23(2,:),n)+1;
end
%
if (gp==19) % sdp (B_0 x A_23)
   d1=2;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+m;
   c1(2,2)=1;
   d21=2;
   c21(1,1)=1;
   c21(2,1)=1+m;
   c21(1,2)=1+m;
   c21(2,2)=1+m;
   d22=n-2;
   for k=1:m-1
      c22(1,k)=k+1;
      c22(2,k)=2*k+1;
      c22(1,m-1+k)=k+m+1;
      c22(2,m-1+k)=2*k+1;
   end
   d23=n-2;
   for k=1:m/2-1
      c23(1,k)=2*k+1;
      c23(2,k)=1;
      c23(1,k+m/2-1)=2*k+m+1;
      c23(2,k+m/2-1)=1;
   end
   for k=0:m-1
      c23(1,k+m-1)=2*k+2;
      c23(2,k+m-1)=m+1;
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
t1=ft4(t1,d1);
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
t21=ft2(t21,d21);
for k=1:d21
   x(c21(1,k),c21(2,k))=t21(1,k);
   x(c21(1,k)+n,c21(2,k))=t21(2,k);
end
for k=1:d22
   t22(1,k)=x(c22(1,k),c22(2,k));
   t22(2,k)=x(c22(1,k),c22(2,k)+n);
end   
t22=ft2(t22,d22);
for k=1:d22
   x(c22(1,k),c22(2,k))=t22(1,k);
   x(c22(1,k),c22(2,k)+n)=t22(2,k);
end
for k=1:d23
   t23(1,k)=x(c23(1,k),c23(2,k));
   t23(2,k)=x(c23(1,k)+n,c23(2,k)+n);
end   
t23=ft2(t23,d23);
for k=1:d23
   x(c23(1,k),c23(2,k))=t23(1,k);
   x(c23(1,k)+n,c23(2,k)+n)=t23(2,k);
end
%
y(1:n,1:n)=(1/n)*fft2(x(1:n,1:n));
y(1+n:n2,1:n)=(1/n)*fft2(x(1+n:n2,1:n));
y(1:n,1+n:n2)=(1/n)*fft2(x(1:n,1+n:n2));
y(1+n:n2,1+n:n2)=(1/n)*fft2(x(1+n:n2,1+n:n2));
