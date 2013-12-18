function y=cnnv2(f,g,gp)
[n,tem]=size(f);
n2=2*n;
%
if (gp==1)
   ftf=fft2(f);
   ftg=fft2(g);
   ftfg=ftf.*ftg;
   y=ifft2(ftfg);
else
   ftf1=fft2(f(1:n,1:n));
   ftf2=fft2(f(1:n,1+n:n2));
   ftg1=fft2(g(1:n,1:n));
   ftg2=fft2(g(1:n,1+n:n2));
   %
   if (gp==2)                        %(zx=xz, zy=yz)   
      y=[ifft2(ftf1.*ftg1+ftf2.*ftg2) ifft2(ftf1.*ftg2+ftf2.*ftg1)];
   end   
   %
   if (gp==3)             %(z x^k y^l = x^-k y^-l z)
      ff1(1,1)=ftf2(1,1)*ftg2(1,1);
      ff2(1,1)=ftf2(1,1)*ftg1(1,1);
      for k2=2:n
         rk2=n-k2+2;
         ff1(1,k2)=ftf2(1,k2)*ftg2(1,rk2);
         ff2(1,k2)=ftf2(1,k2)*ftg1(1,rk2);
      end
      for k1=2:n
         rk1=n-k1+2;
         ff1(k1,1)=ftf2(k1,1)*ftg2(rk1,1);
         ff2(k1,1)=ftf2(k1,1)*ftg1(rk1,1);
         for k2=2:n
            rk2=n-k2+2;
            ff1(k1,k2)=ftf2(k1,k2)*ftg2(rk1,rk2);
            ff2(k1,k2)=ftf2(k1,k2)*ftg1(rk1,rk2);
         end
      end   
      y=[ifft2(ftf1.*ftg1+ff1) ifft2(ftf1.*ftg2+ff2)];
   end   
   %
   if (gp==4)                 %(z x^k y^l = x^l y^k z)
      y=[ifft2(ftf1.*ftg1+ftf2.*ftg2.') ifft2(ftf1.*ftg2+ftf2.*ftg1.')];
   end   
end