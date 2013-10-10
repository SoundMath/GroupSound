function [ox,oy]=lct(y1,frm0,tr,gp);
[n2,tem]=size(y1);
n=n2/2;
tr2=tr/2;
nn(1)=max(max(y1(1:n,1:n)));
nn(2)=max(max(y1(1+n:n2,1:n)));
nn(3)=max(max(y1(1:n,1+n:n2)));
nn(4)=max(max(y1(1+n:n2,1+n:n2)));
[a,b]=mysort(nn);
ox=n2;
oy=n2;
if (a(4)/a(1) < 1.2)
   ox=tr2;
   oy=tr2;
end   
if (.9*a(4) > a(3) & ox==n2)
   if (b(4)==1)
      ox=0;
      oy=0;
   end
   if (b(4)==2)
      ox=tr;
      oy=0;
   end
   if (b(4)==3)
      ox=0;
      oy=tr;
   end
   if (b(4)==4)
      ox=tr;
      oy=tr;
   end   
else
   if (.99*a(4)>a(3) & b(4)+b(1)==5)
      if (b(4)==1)
         ox=0;
         oy=0;
      end
      if (b(4)==2)
         ox=tr;
         oy=0;
      end
      if (b(4)==3)
         ox=0;
         oy=tr;
      end
      if (b(4)==4)
         ox=tr;
         oy=tr;
      end   
   end   
end
%
if (.95*a(4) < a(1) & ox==n2)
   ox=tr/2;
   oy=tr/2;
end   
if (ox==n2)
   if (b(4)==1)
      ox=0;
      oy=0;
   end
   if (b(4)==2)
      ox=tr;
      oy=0;
   end
   if (b(4)==3)
      ox=0;
      oy=tr;
   end
   if (b(4)==4)
      ox=tr;
      oy=tr;
   end   
end