function y=fil22(x,gp,cord)
% Extract the filter from the coordinates of
% the first quadrant.
%
kk=size(cord,1);
n2=size(x,1);
n=n2/2;
y=zeros(n2,n2);
%
if (gp==11) % (-x,-y), (y,x)
   for k=1:kk
      acord(k,1)=mod(n-(cord(k,1)-1),n)+1;
      acord(k,2)=mod(n-(cord(k,2)-1),n)+1;
      bcord(k,1)=cord(k,2);
      bcord(k,2)=cord(k,1);
      ccord(k,1)=acord(k,2);
      ccord(k,2)=acord(k,1);
   end
end
if (gp==13) % (-x,-y), (x+y,-y)
   for k=1:kk
      acord(k,1)=mod(n-(cord(k,1)-1),n)+1;
      acord(k,2)=mod(n-(cord(k,2)-1),n)+1;
      bcord(k,1)=mod(cord(k,1)+cord(k,2)-2,n)+1;
      bcord(k,2)=acord(k,2);
      ccord(k,1)=mod(n2-cord(k,1)-cord(k,2)+2,n)+1;
      ccord(k,2)=cord(k,2);
   end
end
for k=1:kk
   k1=cord(k,1);
   k2=cord(k,2);
   a1=acord(k,1);
   a2=acord(k,2);
   b1=bcord(k,1);
   b2=bcord(k,2);
   c1=ccord(k,1);
   c2=ccord(k,2);
   %
   y(k1,k2)=x(k1,k2);
   y(a1,a2+n)=x(a1,a2+n);
   y(b1+n,b2)=x(b1+n,b2);
   y(c1+n,c2+n)=x(c1+n,c2+n);
   %
   y(k1,k2+n)=x(k1,k2+n);
   y(a1,a2)=x(a1,a2);
   y(b1+n,b2+n)=x(b1+n,b2+n);
   y(c1+n,c2)=x(c1+n,c2);
   %
   y(k1+n,k2)=x(k1+n,k2);
   y(a1+n,a2+n)=x(a1+n,a2+n);
   y(b1,b2)=x(b1,b2);
   y(c1,c2+n)=x(c1,c2+n);
   %
   y(k1+n,k2)=x(k1+n,k2);
   y(a1+n,a2+n)=x(a1+n,a2+n);
   y(b1,b2)=x(b1,b2);
   y(c1,c2+n)=x(c1,c2+n);
end
%
if (gp==13) % (-x,-y), (x+y,-y)
end
%
