function y=abel_tr(x,n1,n2);
[m1,m2]=size(x);
for k1=1:m1
   kk1=mod(k1-1-n1,m1)+1;
   for k2=1:m2
      kk2=mod(k2-1-n2,m2)+1;
      y(k1,k2)=x(kk1,kk2);
   end
end   