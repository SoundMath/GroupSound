function y=cnn_2(u,v,gp);
% file/fctn name mismatch: was file cnn_2.m
[n,tem]=size(u);
m=n/2;
n2=n+n;
%
%
ur(1:n,1:n)=u(1:n,1:n);
if (gp==1) % (y,x)
   for k2=0:n-1
      for k1=0:n-1
         ur(k1+1,k2+1+n)=u(k2+1,k1+1+n);
      end
   end   
end   
%
if (gp==2) % (x+y,-y)
   for k2=0:n-1
      ak2=mod(n-k2,n);
      for k1=0:n-1
         ak1=mod(k1+k2,n);
         ur(k1+1,k2+1+n)=u(ak1+1,ak2+1+n);
      end
   end   
end
%
if (gp==3) % (-x-y,y)
   for k2=0:n-1
      for k1=0:n-1
         ak1=mod(n-k1-k2,n);
         ur(k1+1,k2+1+n)=u(ak1+1,k2+1+n);
      end
   end   
end
%
if (gp==4) % (x,x-y)
   for k2=0:n-1
      for k1=0:n-1
         ak2=mod(k1-k2,n);
         ur(k1+1,k2+1+n)=u(k1+1,ak2+1+n);
      end
   end   
end
%
[d11,d12]=nn_2(ur,gp);
[d21,d22]=nn_2(v,gp);
%
c(:,1:n)=d12(:,1:n).*d22(:,1:n)+d12(:,1+n:n2).*d22(:,1+n:n2);
c(:,1+n:n2)=d12(:,1+n:n2).*d22(:,1:n)+d12(:,1:n).*d22(:,1+n:n2);
c=c+sqrt(2)*d11.*d21;
y=n*inn_2(c,gp);
%
