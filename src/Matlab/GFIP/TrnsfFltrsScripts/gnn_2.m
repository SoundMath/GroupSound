function y=gnn_2(u,gp);
%
[n,tem]=size(u);
m=n/2;
n2=n+n;
nn=linspace(0,n-1,n);
if (gp==1) % (y,x)
   for k2=0:n-1
      for k1=0:n-1
         act(k1+1+n*k2)=k2+1+n*k1;
      end
   end   
end
%
if (gp==2) % (x+y,-y)
   for k2=0:n-1
      ak2=mod(n-k2,n);
      for k1=0:n-1
         ak1=mod(k1+k2,n);
         act(k1+1+n*k2)=ak1+1+n*ak2;
      end
   end   
end
%
if (gp==3) % (-x-y,y)
   for k2=0:n-1
      for k1=0:n-1
         ak1=mod(n-k1-k2,n);
         act(k1+1+n*k2)=ak1+1+n*k2;
      end
   end   
end
%
if (gp==4) % (x,x-y)
   for k2=0:n-1
      for k1=0:n-1
         ak2=mod(k1-k2,n);
         act(k1+1+n*k2)=k1+1+n*ak2;
      end
   end   
end
%
%
%
u1=cnv2mt(u(1:n,1:n));
u2=cnv2mt(u(1:n,1+n:n2));
for k2=0:n-1
   for k1=0:n-1
      kk=k1+1+n*k2;
      ak=act(kk);
      for l2=0:n-1
         for l1=0:n-1
            ll=l1+1+n*l2;
            al=act(ll);
            ur(al,ak)=u2(ll,kk);      
         end
      end   
   end
end   
y=[u1 ur;ur u1];

