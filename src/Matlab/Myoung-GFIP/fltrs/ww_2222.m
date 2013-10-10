function y=ww_2222(x,gp,prj)
% Use this for even n:
[n4,tem]=size(x);
n=n4/4;
n2=n+n;
n3=n2+n;
m=n/2;
l=n/4;
rt2=sqrt(2);
y=zeros(n4,n4);
%
bf(1:n,1:n)=ifft2(x(1:n,1:n));
bf(1+n:n2,1:n)=ifft2(x(1+n:n2,1:n));
bf(1+n2:n3,1:n)=ifft2(x(1+n2:n3,1:n));
bf(1+n3:n4,1:n)=ifft2(x(1+n3:n4,1:n));
bf(1:n,1+n:n2)=ifft2(x(1:n,1+n:n2));
bf(1+n:n2,1+n:n2)=ifft2(x(1+n:n2,1+n:n2));
bf(1+n2:n3,1+n:n2)=ifft2(x(1+n2:n3,1+n:n2));
bf(1+n3:n4,1+n:n2)=ifft2(x(1+n3:n4,1+n:n2));
bf(1:n,1+n2:n3)=ifft2(x(1:n,1+n2:n3));
bf(1+n:n2,1+n2:n3)=ifft2(x(1+n:n2,1+n2:n3));
bf(1+n2:n3,1+n2:n3)=ifft2(x(1+n2:n3,1+n2:n3));
bf(1+n3:n4,1+n2:n3)=ifft2(x(1+n3:n4,1+n2:n3));
bf(1:n,1+n3:n4)=ifft2(x(1:n,1+n3:n4));
bf(1+n:n2,1+n3:n4)=ifft2(x(1+n:n2,1+n3:n4));
bf(1+n2:n3,1+n3:n4)=ifft2(x(1+n2:n3,1+n3:n4));
bf(1+n3:n4,1+n3:n4)=ifft2(x(1+n3:n4,1+n3:n4));
%
% ([-1 0;0 -1]x[1 1;0 -1]x[1 M;0 1]x[M-1 M;0 M-1])
if (gp==1) 
   if (prj==1)
      dd=2;
      cc(1,1)=1;
      cc(2,1)=1;
      cc(1,2)=1+m;
      cc(2,2)=1;
   end   
   if (prj==21)
      dd=2;
      cc(1,1)=1;
      cc(2,1)=1+m;
      cc(1,2)=1+m;
      cc(2,2)=1+m;
   end   
   if (prj==22)
      dd=m-2;
      for k=1:n/4-1
         cc(1,k)=2*k+1;
         cc(2,k)=n-4*k+1;
         cc(1,k+n/4-1)=2*k+n/2+1;
         cc(2,k+n/4-1)=n-4*k+1;
      end   
   end   
   if (prj==23)
      dd=m-2;
      for k=1:n/4-1
         cc(1,k)=2*k+1;
         cc(2,k)=1;
         cc(1,k+n/4-1)=2*k+n/2+1;
         cc(2,k+n/4-1)=1;
      end   
   end   
   if (prj==41)
      dd=m;
      for k=1:m/2
         cc(1,k)=2*k;
         cc(2,k)=n-4*k+3;
         cc(1,k+m/2)=2*k+m;
         cc(2,k+m/2)=n-4*k+3;
      end   
   end   
   if (prj==42)
      dd=m;
      for k=1:m
         cc(1,k)=2*k;
         cc(2,k)=1;
      end   
   end   
   if (prj==43)
      dd=m;
      for k=1:m
         cc(1,k)=2*k;
         cc(2,k)=1+m;
      end   
   end   
   if (prj==44)
      dd=m;
      for k=1:m/4
         kk2=2*k;
         kk4=4*k;
         cc(1,k)=kk2;
         cc(2,k)=m-kk4+3;
         cc(1,k+m/2)=kk2+m;
         cc(2,k+m/2)=m-kk4+3;
         cc(1,k+m/4)=kk2+m/2;
         cc(2,k+m/4)=n-kk4+3;
         cc(1,k+m/4+m/2)=kk2+m/2+m;
         cc(2,k+m/4+m/2)=n-kk4+3;
      end   
   end   
   if (prj==45)
      dd=m*m-n+2;
      for k1=0:n/4-1
         kk4=4*k1;
         mk1=m*k1;
         for k2=0:m-1
            kk2=2*k2;
            cc(1,1+k2+mk1)=2*k2+1;
            cc(2,1+k2+mk1)=kk4+3;
         end   
      end   
      d1=m*m/2;
      for k1=1:n/4-1
         kk4=4*k1;
         mk1=(m-2)*(k1-1)+d1;
         for k2=0:m/2-1-k1
            kk2=2*k2;
            cc(1,1+k2+mk1)=kk2+1;
            cc(2,1+k2+mk1)=kk4+1;
            kk2=2*k2+m;
            cc(1,k2+m/2+mk1)=kk2+1;
            cc(2,k2+m/2+mk1)=kk4+1;
         end   
         for k2=m/2-1-k1+2:m/2-1
            kk2=2*k2;
            cc(1,k2+mk1)=kk2+1;
            cc(2,k2+mk1)=kk4+1;
            kk2=2*k2+m;
            cc(1,k2-1+m/2+mk1)=kk2+1;
            cc(2,k2-1+m/2+mk1)=kk4+1;
         end   
      end   
   end   
   if (prj==8)
      dd=m*m-n-m;
      d1=m*m/2-n;
      d2=d1+m*m/4-m/2;
      for k1=1:n/8-1
         kk1=4*k1;
         mk1=m*(k1-1);
         mk2=m*(k1+n/8-2);
         for k2=0:m-1
            kk2=2*k2+1;
            cc(1,k2+1+mk1)=kk2+1;
            cc(2,k2+1+mk1)=kk1+1;
            cc(1,k2+1+mk2)=kk2+1;
            cc(2,k2+1+mk2)=kk1+m+1;
         end   
      end
      for k1=0:n/8-1
         kk1=4*k1+2;
         for k2=0:n/8-k1-2
            cc(1,k2+1+(m-2)*k1+d1)=2*k2+2;
            cc(2,k2+1+(m-2)*k1+d1)=kk1+1;
            cc(1,k2+m/2+(m-2)*k1+d1)=2*k2+m+2;
            cc(2,k2+m/2+(m-2)*k1+d1)=kk1+1;
         end   
         for k2=n/8-k1:m/2-1
            cc(1,k2+(m-2)*k1+d1)=2*k2+2;
            cc(2,k2+(m-2)*k1+d1)=kk1+1;
            cc(1,k2+m/2-1+(m-2)*k1+d1)=2*k2+m+2;
            cc(2,k2+m/2-1+(m-2)*k1+d1)=kk1+1;
         end  
      end   
      for k1=0:n/8-1
         kk1=m+4*k1+2;
         for k2=0:m/2-1-(k1+1)
            cc(1,k2+1+(m-2)*(k1)+d2)=2*k2+2;
            cc(2,k2+1+(m-2)*(k1)+d2)=kk1+1;
            cc(1,k2+m/2+(m-2)*(k1)+d2)=2*k2+m+2;
            cc(2,k2+m/2+(m-2)*(k1)+d2)=kk1+1;
         end   
         for k2=m/2-1-(k1+1)+2:m/2-1
            cc(1,k2+(m-2)*(k1)+d2)=2*k2+2;
            cc(2,k2+(m-2)*(k1)+d2)=kk1+1;
            cc(1,k2+m/2-1+(m-2)*(k1)+d2)=2*k2+m+2;
            cc(2,k2+m/2-1+(m-2)*(k1)+d2)=kk1+1;
         end   
      end   
   end   
end   
%
% ([-1 0;0 -1]x[-1 0;-1 1]x[1 0;M 1]x[M-1 0;M M-1])
if (gp==2) 
   if (prj==1)
      dd=2;
      cc(1,1)=1;
      cc(2,1)=1;
      cc(1,2)=1;
      cc(2,2)=1+m;
   end   
   if (prj==21)
      dd=2;
      cc(1,1)=1+m;
      cc(2,1)=1;
      cc(1,2)=1+m;
      cc(2,2)=1+m;
   end   
   if (prj==22)
      dd=m-2;
      for k=1:m/2-1
         cc(1,k)=1;
         cc(2,k)=2*k+1;
         cc(1,k+m/2-1)=1;
         cc(2,k+m/2-1)=m+2*k+1;
      end   
   end   
   if (prj==23)
      dd=m-2;
      for k=1:m/2-1
         cc(1,k)=4*k+1;
         cc(2,k)=2*k+1;
         cc(1,k+m/2-1)=4*k+1;
         cc(2,k+m/2-1)=m+2*k+1;
      end   
   end   
   if (prj==41)
      dd=m;
      for k=1:m
         cc(1,k)=1;
         cc(2,k)=2*k;
      end   
   end   
   if (prj==42)
      dd=m;
      for k=1:m/2
         cc(1,k)=4*k-1;
         cc(2,k)=2*k;
         cc(1,k+m/2)=4*k-1;
         cc(2,k+m/2)=2*k+m;
      end   
   end   
   if (prj==43)
      dd=m;
      for k=1:m/4
         cc(1,k)=2*k;
         cc(2,k)=m+4*k-1;
         cc(1,k+m/4)=2*k+m/2;
         cc(2,k+m/4)=4*k-1;
         cc(1,k+m/2)=2*k+m;
         cc(2,k+m/2)=m+4*k-1;
         cc(1,k+m/2+m/4)=2*k+m/2+m;
         cc(2,k+m/2+m/4)=4*k-1;
      end   
   end   
   if (prj==44)
      dd=m;
      for k=1:m
         cc(1,k)=m+1;
         cc(2,k)=2*k;
      end   
   end   
   if (prj==45)
      dd=m*m-n;
      for k1=0:m/2-1
         for k2=0:m-1
            cc(1,k2+1+m*k1)=4*k1+3;
            cc(2,k2+1+m*k1)=2*k2+1;
         end   
      end   
      d1=m*m/2;
      for k1=1:m/4-1
         mk1=(m-2)*(k1-1)+d1;
         for k2=0:k1-1
            cc(1,k2+1+mk1)=4*k1+1;
            cc(2,k2+1+mk1)=2*k2+1;
            cc(1,k2+m/2+mk1)=4*k1+1;
            cc(2,k2+m/2+mk1)=2*k2+m+1;
         end   
         for k2=k1+1:m/2-1
            cc(1,k2+mk1)=4*k1+1;
            cc(2,k2+mk1)=2*k2+1;
            cc(1,k2+m/2-1+mk1)=4*k1+1;
            cc(2,k2+m/2-1+mk1)=2*k2+m+1;
         end   
      end   
      for k1=m/4+1:m/2-1
         mk1=(m-2)*(k1-2)+d1;
         for k2=0:k1-1
            cc(1,k2+1+mk1)=4*k1+1;
            cc(2,k2+1+mk1)=2*k2+1;
            cc(1,k2+m/2+mk1)=4*k1+1;
            cc(2,k2+m/2+mk1)=2*k2+m+1;
         end   
         for k2=k1+1:m/2-1
            cc(1,k2+mk1)=4*k1+1;
            cc(2,k2+mk1)=2*(k2)+1;
            cc(1,k2+m/2-1+mk1)=4*k1+1;
            cc(2,k2+m/2-1+mk1)=2*k2+m+1;
         end   
      end   
      d2=d1+(m-2)*(m/2-2);
      for k2=1:m/4-1
         cc(1,k2+d2)=m+1;
         cc(2,k2+d2)=2*k2+1;
         cc(1,k2-2+m/2+d2)=m+1;
         cc(2,k2-2+m/2+d2)=2*k2+m+1;
      end   
      for k2=m/4+1:m/2-1
         cc(1,k2-1+d2)=m+1;
         cc(2,k2-1+d2)=2*k2+1;
         cc(1,k2-3+m/2+d2)=m+1;
         cc(2,k2-3+m/2+d2)=2*k2+m+1;
      end   
   end   
   if (prj==8)
      dd=m*m-n-m;
      for k1=1:m/4-1
         for k2=0:m-1
            cc(1,k2+1+m*(k1-1))=4*k1+1;
            cc(2,k2+1+m*(k1-1))=2*k2+2;
            cc(1,k2+1+m*(k1+m/4-2))=4*k1+m+1;
            cc(2,k2+1+m*(k1+m/4-2))=2*k2+2;
         end   
      end
      d1=(m/2-2)*m;
      for k1=0:m/2-1
         mk1=(m-2)*k1+d1;
         for k2=0:k1-1
            cc(1,k2+1+mk1)=4*k1+3;
            cc(2,k2+1+mk1)=2*k2+2;
            cc(1,k2+m/2+mk1)=4*k1+3;
            cc(2,k2+m/2+mk1)=2*k2+m+2;
         end   
         for k2=k1+1:m/2-1
            cc(1,k2+mk1)=4*k1+3;
            cc(2,k2+mk1)=2*k2+2;
            cc(1,k2+m/2-1+mk1)=4*k1+3;
            cc(2,k2+m/2-1+mk1)=2*k2+m+2;
         end   
      end   
   end   
end   
%
%
%
%
for k=1:dd
   k1=cc(1,k);
   k2=cc(2,k);
   y(k1,k2)=bf(k1,k2);
   y(k1+n,k2)=bf(k1+n,k2);
   y(k1+n2,k2)=bf(k1+n2,k2);
   y(k1+n3,k2)=bf(k1+n3,k2);
   y(k1,k2+n)=bf(k1,k2+n);
   y(k1+n,k2+n)=bf(k1+n,k2+n);
   y(k1+n2,k2+n)=bf(k1+n2,k2+n);
   y(k1+n3,k2+n)=bf(k1+n3,k2+n);
   y(k1,k2+n2)=bf(k1,k2+n2);
   y(k1+n,k2+n2)=bf(k1+n,k2+n2);
   y(k1+n2,k2+n2)=bf(k1+n2,k2+n2);
   y(k1+n3,k2+n2)=bf(k1+n3,k2+n2);
   y(k1,k2+n3)=bf(k1,k2+n3);
   y(k1+n,k2+n3)=bf(k1+n,k2+n3);
   y(k1+n2,k2+n3)=bf(k1+n2,k2+n3);
   y(k1+n3,k2+n3)=bf(k1+n3,k2+n3);
end   
%
y(1:n,1:n)=fft2(y(1:n,1:n));
y(1+n:n2,1:n)=fft2(y(1+n:n2,1:n));
y(1+n2:n3,1:n)=fft2(y(1+n2:n3,1:n));
y(1+n3:n4,1:n)=fft2(y(1+n3:n4,1:n));
y(1:n,1+n:n2)=fft2(y(1:n,1+n:n2));
y(1+n:n2,1+n:n2)=fft2(y(1+n:n2,1+n:n2));
y(1+n2:n3,1+n:n2)=fft2(y(1+n2:n3,1+n:n2));
y(1+n3:n4,1+n:n2)=fft2(y(1+n3:n4,1+n:n2));
y(1:n,1+n2:n3)=fft2(y(1:n,1+n2:n3));
y(1+n:n2,1+n2:n3)=fft2(y(1+n:n2,1+n2:n3));
y(1+n2:n3,1+n2:n3)=fft2(y(1+n2:n3,1+n2:n3));
y(1+n3:n4,1+n2:n3)=fft2(y(1+n3:n4,1+n2:n3));
y(1:n,1+n3:n4)=fft2(y(1:n,1+n3:n4));
y(1+n:n2,1+n3:n4)=fft2(y(1+n:n2,1+n3:n4));
y(1+n2:n3,1+n3:n4)=fft2(y(1+n2:n3,1+n3:n4));
y(1+n3:n4,1+n3:n4)=fft2(y(1+n3:n4,1+n3:n4));
