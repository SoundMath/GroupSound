function y=ww_22(x,gp,prj)
% Use this for even n:
[n2,tem]=size(x);
y=zeros(n2,n2);
n=n2/2;
m=n/2;
l=n/4;
%
bf(1:n,1:n)=ifft2(x(1:n,1:n));
bf(1+n:n2,1:n)=ifft2(x(1+n:n2,1:n));
bf(1:n,1+n:n2)=ifft2(x(1:n,1+n:n2));
bf(1+n:n2,1+n:n2)=ifft2(x(1+n:n2,1+n:n2));
%
%
if (gp==1) % sdp T_0
   if (prj==1)
      dd=2;
      c(1,1)=1;
      c(2,1)=1;
      c(1,2)=1+m;
      c(2,2)=1+m;
   end
   if (prj==2)
      dd=2;
      c(1,1)=1;
      c(2,1)=1+m;
      c(1,2)=1+m;
      c(2,2)=1;
   end   
end   
if (gp==2) % sdp [n/4+1 0;0 1]
   if (prj==1)
      dd=m*m;
      for k1=0:n/4-1
         for k2=0:n-1
            c(1,k1+(n/4)*k2+1)=4*k1+1;
            c(2,k1+(n/4)*k2+1)=k2+1;
         end
      end   
   end   
   if (prj==2)
      dd=m*m;
      for k1=0:n/4-1
         for k2=0:n-1
            c(1,k1+(n/4)*k2+1)=4*k1+3;
            c(2,k1+(n/4)*k2+1)=k2+1;
         end
      end   
   end   
end   
if (gp==3) % sdp T_3
   if (prj==1)
      dd=m*m;
      for k1=1:n/4
         for k2=0:n/2-1
            c(1,k1+(n/4)*k2)=4*k1-3;
            c(2,k1+(n/4)*k2)=2*k2+1;
            c(1,k1+(n/4)*k2+dd/2)=4*k1-1;
            c(2,k1+(n/4)*k2+dd/2)=2*k2+2;
         end   
      end
   end   
   if (prj==2)
      dd=m*m;
      for k1=1:n/4
         for k2=0:n/2-1
            c(1,k1+(n/4)*k2)=4*k1-1;
            c(2,k1+(n/4)*k2)=2*k2+1;
            c(1,k1+(n/4)*k2+dd/2)=4*k1-3;
            c(2,k1+(n/4)*k2+dd/2)=2*k2+2;
         end   
      end
   end   
end   
%
if (gp==11)
   if (prj==1)
      dd=n*m-n;
      d1=m*m-m;
      for k1=1:m
         kk1=(m-1)*(k1-1);
         for k2=1:k1-1
            c(1,k2+kk1)=2*k1-1;
            c(2,k2+kk1)=2*k2-1;
            c(1,k2+kk1+d1)=2*k1;
            c(2,k2+kk1+d1)=2*k2;
         end
         for k2=k1+1:m
            c(1,k2-1+kk1)=2*k1-1;
            c(2,k2-1+kk1)=2*k2-1;
            c(1,k2-1+kk1+d1)=2*k1;
            c(2,k2-1+kk1+d1)=2*k2;
         end   
      end   
   end   
   if (prj==2)
      dd=n;
      for k=1:n
         c(1,k)=k;
         c(2,k)=k;
      end   
   end   
end
%
if (gp==12)
   if (prj==1)
      dd=n*m-n;
      for k2=1:m-1
         c(1,k2)=1;
         c(2,k2)=2*k2+1;
         c(1,k2+m-1)=2;
         c(2,k2+m-1)=2*k2;
      end
      for k1=2:m
         kk1=k1*(m-1);
         kk11=(k1+m-1)*(m-1);
         for k2=1:m-k1+1
            c(1,k2+kk1)=2*k1-1;
            c(2,k2+kk1)=2*k2-1;
         end
         for k2=m-k1+3:m
            c(1,k2-1+kk1)=2*k1-1;
            c(2,k2-1+kk1)=2*k2-1;
         end
         for k2=1:m-k1
            c(1,k2+kk11)=2*k1;
            c(2,k2+kk11)=2*k2;
         end
         for k2=m-k1+2:m
            c(1,k2-1+kk11)=2*k1;
            c(2,k2-1+kk11)=2*k2;
         end   
      end   
   end  
   if (prj==2)
      dd=n;
      c(1,1)=1;
      c(2,1)=1;
      for k=2:n
         c(1,k)=k;
         c(2,k)=n-k+2;
      end   
   end   
end
%
if (gp==21)
   if (prj==1)
      dd=n*m-n;
      for k1=0:m-1
         kk1=(m-1)*k1;
         for k2=1:k1
            c(1,k2+kk1)=2*k1+1;
            c(2,k2+kk1)=2*k2-1;
         end
         for k2=k1+1:m-1
            c(1,k2+kk1)=2*k1+1;
            c(2,k2+kk1)=2*k2+1;
         end   
      end   
      for k1=1:m/2
         kk1=(k1-1)*(n-2)+m*(m-1);
         for k2=1:k1+m/2-1
            c(1,k2+kk1)=2*k1;
            c(2,k2+kk1)=2*k2;
         end
         for k2=k1+m/2+1:m
            c(1,k2-1+kk1)=2*k1;
            c(2,k2-1+kk1)=2*k2;
         end   
         for k2=1:k1-1
            c(1,m+k2-1+kk1)=2*k1+m;
            c(2,m+k2-1+kk1)=2*k2;
         end
         for k2=k1+1:m
            c(1,m+k2-2+kk1)=2*k1+m;
            c(2,m+k2-2+kk1)=2*k2;
         end   
      end   
   end   
   if (prj==2)
      dd=n;
      for k=1:m/2
         kk=2*k;
         c(1,kk-1)=kk-1;
         c(2,kk-1)=kk-1;
         c(1,kk)=kk;
         c(2,kk)=kk+m;
         c(1,kk-1+m)=kk-1+m;
         c(2,kk-1+m)=kk-1+m;
         c(1,kk+m)=kk+m;
         c(2,kk+m)=kk;
      end   
   end   
end
%
if (gp==22)
   if (prj==1)
      dd=2*m*m-n;
      for k2=1:m-1
         c(1,k2)=1;
         c(2,k2)=2*k2+1;
      end   
      for k1=1:m/2
         kk1=(m-1)*(k1-1)+m-1;
         kk11=(m-1)*(k1+m/2-1)+m-1;
         for k2=1:m/2-k1
            c(1,k2+kk1)=2*k1;
            c(2,k2+kk1)=2*k2;
         end
         for k2=m/2-k1+2:m
            c(1,k2-1+kk1)=2*k1;
            c(2,k2-1+kk1)=2*k2;
         end
         for k2=1:m-k1
            c(1,k2+kk11)=2*k1+m;
            c(2,k2+kk11)=2*k2;
         end
         for k2=m-k1+2:m
            c(1,k2-1+kk11)=2*k1+m;
            c(2,k2-1+kk11)=2*k2;
         end
      end   
      for k1=1:m-1
         kk1=(m-1)*(k1+m);
         for k2=1:m-k1
            c(1,k2+kk1)=2*k1+1;
            c(2,k2+kk1)=2*k2-1;
         end
         for k2=m-k1+2:m
            c(1,k2-1+kk1)=2*k1+1;
            c(2,k2-1+kk1)=2*k2-1;
         end
      end   
   end  
   if (prj==2)
      dd=n;
      c(1,1)=1;
      c(2,1)=1;
      for k=1:m/2
         kk=2*k;
         c(1,kk)=kk;
         c(2,kk)=m-kk+2;
         c(1,kk+m)=kk+m;
         c(2,kk+m)=n-kk+2;
      end   
      for k=2:m
         kk=2*k;
         c(1,kk-1)=kk-1;
         c(2,kk-1)=n-kk+3;
      end   
   end  
end
%
if (gp==23)
   if (prj==1)
      dd=n*m-n;
      for k1=1:m/8
         for k2=1:2*k1+m/2+m/4-1
            c(1,k2+(m-1)*(k1-1))=4*k1;
            c(2,k2+(m-1)*(k1-1))=2*k2;
         end
         for k2=2*k1+m/2+m/4+1:m
            c(1,k2-1+(m-1)*(k1-1))=4*k1;
            c(2,k2-1+(m-1)*(k1-1))=2*k2;
         end
         for k2=1:2*k1-2
            c(1,k2+(m-1)*(k1-1+3*m/8+m))=4*k1+3*m/2-2;
            c(2,k2+(m-1)*(k1-1+3*m/8+m))=2*k2;
         end   
         for k2=2*k1:m
            c(1,k2-1+(m-1)*(k1-1+3*m/8+m))=4*k1+3*m/2-2;
            c(2,k2-1+(m-1)*(k1-1+3*m/8+m))=2*k2;
         end   
         for k2=1:2*k1+m/2+m/4-2
            c(1,k2+(m-1)*(k1-1+m/4+m))=4*k1+m-2;
            c(2,k2+(m-1)*(k1-1+m/4+m))=2*k2;
         end   
         for k2=2*k1+m/2+m/4:m
            c(1,k2-1+(m-1)*(k1-1+m/4+m))=4*k1+m-2;
            c(2,k2-1+(m-1)*(k1-1+m/4+m))=2*k2;
         end   
      end   
      for k1=1+m/8:m/2
         for k2=1:2*k1-m/4-1
            c(1,k2+(m-1)*(k1-1))=4*k1;
            c(2,k2+(m-1)*(k1-1))=2*k2;
         end
         for k2=2*k1-m/4+1:m
            c(1,k2-1+(m-1)*(k1-1))=4*k1;
            c(2,k2-1+(m-1)*(k1-1))=2*k2;
         end
      end   
      for k1=1:m/2
         for k2=1:2*k1-2
            c(1,k2+(m-1)*(k1-1+m/2))=4*k1-3;
            c(2,k2+(m-1)*(k1-1+m/2))=2*k2-1;
         end
         for k2=2*k1:m
            c(1,k2-1+(m-1)*(k1-1+m/2))=4*k1-3;
            c(2,k2-1+(m-1)*(k1-1+m/2))=2*k2-1;
         end   
      end
      for k1=1:m/4
         for k2=1:2*k1+m/4-2
            c(1,k2+(m-1)*(k1-1+m))=4*k1-2;
            c(2,k2+(m-1)*(k1-1+m))=2*k2;
         end   
         for k2=2*k1+m/4:m
            c(1,k2-1+(m-1)*(k1-1+m))=4*k1-2;
            c(2,k2-1+(m-1)*(k1-1+m))=2*k2;
         end   
         for k2=1:2*k1+m/2-1
            c(1,k2+(m-1)*(k1-1+m+m/2))=4*k1-1;
            c(2,k2+(m-1)*(k1-1+m+m/2))=2*k2-1;
         end
         for k2=2*k1+m/2+1:m
            c(1,k2-1+(m-1)*(k1-1+m+m/2))=4*k1-1;
            c(2,k2-1+(m-1)*(k1-1+m+m/2))=2*k2-1;
         end   
         for k2=1:2*k1-1
            c(1,k2+(m-1)*(k1-1+n-m/4))=4*k1+m-1;
            c(2,k2+(m-1)*(k1-1+n-m/4))=2*k2-1;
         end
         for k2=2*k1+1:m
            c(1,k2-1+(m-1)*(k1-1+n-m/4))=4*k1+m-1;
            c(2,k2-1+(m-1)*(k1-1+n-m/4))=2*k2-1;
         end   
      end   
   end 
   if (prj==2)
      dd=n;
      kkk=[m/2 m m+m/2 0 m/2 m];
      for k1=1:m/8
         kk1=4*k1;
         for k2=0:3
            kk2=k2*m/2;
            c(1,kk1-3+kk2)=kk1-3+kk2;
            c(2,kk1-3+kk2)=kk1-3+kk2;
            c(1,kk1-2+kk2)=kk1-2+kk2;
            c(2,kk1-2+kk2)=kk1-2+kkk(k2+1);
            c(1,kk1-1+kk2)=kk1-1+kk2;
            c(2,kk1-1+kk2)=kk1-1+kkk(k2+2);
            c(1,kk1  +kk2)=kk1  +kk2;
            c(2,kk1  +kk2)=kk1  +kkk(k2+3);
         end
      end   
   end
end   
%
%
for k=1:dd
   k1=c(1,k);
   k2=c(2,k);
   y(k1,k2)=bf(k1,k2);
   y(k1+n,k2)=bf(k1+n,k2);
   y(k1,k2+n)=bf(k1,k2+n);
   y(k1+n,k2+n)=bf(k1+n,k2+n);
end   
%
y(1:n,1:n)=fft2(y(1:n,1:n));
y(1+n:n2,1:n)=fft2(y(1+n:n2,1:n));
y(1:n,1+n:n2)=fft2(y(1:n,1+n:n2));
y(1+n:n2,1+n:n2)=fft2(y(1+n:n2,1+n:n2));
