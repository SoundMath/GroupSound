function y=noise(bk,bm,mn,sdv);
for k1=1:bk
   for k2=1:bm
      x1=rand;
      x2=rand;
      y(k1,k2)=mn+sdv*sqrt(-2.0*log(x1))*cos(2.0);
   end
end   

