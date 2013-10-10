function y=iscl2_16(x,n);
%
% (C_n x C_n) sdp C_16 
% n must be a power of 2, and at least 64.
% (a,b)^t = (sa,sb), s=n/16-1
%
n2=2*n;
n3=3*n;
n4=4*n;
m=n/2;
mm=n/16;
rt2=sqrt(2);
t4=zeros(4,1);
t8=zeros(8,1);
t16=zeros(16,1);
%x=rand(n4,n4);
%
%
for k2=0:n/4-1
   kk2=1+4*k2;
   for k1=0:n/4-1
      kk1=1+4*k1;
      t1=x(2+kk1,kk2)+x(2+kk1,kk2+n2);   
      t2=x(2+kk1,kk2)-x(2+kk1,kk2+n2);   
      x(2+kk1,kk2)=rt2*t1;
      x(2+kk1,kk2+n2)=rt2*(t2);
      t1=x(kk1,2+kk2)+x(kk1,2+kk2+n2);   
      t2=x(kk1,2+kk2)-x(kk1,2+kk2+n2);   
      x(kk1,2+kk2)=rt2*t1;
      x(kk1,2+kk2+n2)=rt2*(t2);
      t1=x(2+kk1,2+kk2)+x(2+kk1,2+kk2+n2);   
      t2=x(2+kk1,2+kk2)-x(2+kk1,2+kk2+n2);   
      x(2+kk1,2+kk2)=rt2*t1;
      x(2+kk1,2+kk2+n2)=rt2*(t2);
   end
end   
for k2=0:n/8-1
   kk2=1+8*k2;
   for k1=0:n/8-1
      kk1=1+8*k1;
      for l=0:3
         t(1+l)=x(4+kk1,kk2+l*n);
      end
      t=.5*fft(t);
      for l=0:3
         x(4+kk1,kk2+l*n)=t(1+l);
      end
      for l=0:3
         t(1+l)=x(kk1,4+kk2+l*n);
      end
      t=.5*fft(t);
      for l=0:3
         x(kk1,4+kk2+l*n)=t(1+l);
      end
      for l=0:3
         t(1+l)=x(4+kk1,4+kk2+l*n);
      end
      t=.5*fft(t);
      for l=0:3
         x(4+kk1,4+kk2+l*n)=t(1+l);
      end
   end
end   
for k2=0:n/8-1
   kk2=1+8*k2;
   for k1=0:n/8-1
      kk1=1+8*k1;
      t8(1)=x(kk1,   kk2);
      t8(2)=x(kk1+n2,kk2);
      t8(3)=x(kk1,   kk2+n);
      t8(4)=x(kk1+n2,kk2+n);
      t8(5)=x(kk1,   kk2+n2);
      t8(6)=x(kk1+n2,kk2+n2);
      t8(7)=x(kk1,   kk2+n3);
      t8(8)=x(kk1+n2,kk2+n3);
      t8=(1/sqrt(8))*fft(t8);
      x(kk1,   kk2)=t8(1);
      x(kk1+n2,kk2)=t8(2);
      x(kk1,   kk2+n)=t8(3);
      x(kk1+n2,kk2+n)=t8(4);
      x(kk1,   kk2+n2)=t8(5);
      x(kk1+n2,kk2+n2)=t8(6);
      x(kk1,   kk2+n3)=t8(7);
      x(kk1+n2,kk2+n3)=t8(8);
   end
end   
for k2=0:1
   kk2=m*k2;
   for k1=0:1
      kk1=m*k1;
      for l2=0:3
         ll2=kk2+n*l2;
         for l1=0:3
            ll1=kk1+n*l1;
            t(1+l1+4*l2)=x(1+ll1,1+ll2);
         end   
      end   
      t=.25*fft(t);
      for l2=0:3
         ll2=kk2+n*l2;
         for l1=0:3
            ll1=kk1+n*l1;
            x(1+ll1,1+ll2)=t(1+l1+4*l2);
         end   
      end   
   end   
end
for k2=0:3
   for k1=0:3
      y(1+k1*n:(k1+1)*n,1+k2*n:(k2+1)*n)=1/n*fft2(x(1+k1*n:(k1+1)*n,1+k2*n:(k2+1)*n));
   end
end 
