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
aa1=a(1)/a(2);
aa2=a(2)/a(3);
aa3=a(3)/a(4);
if ((aa1>.9 & aa2>.9) & aa3>.9)
   ox=tr/2;
   oy=tr/2;
else
   if (b(4)+b(1)==5)
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
      nm=b(4)+b(3);
      if (nm==3)
         ox=tr/2;
         oy=0;
      end
      if (nm==4)
         ox=0;
         oy=tr/2;
      end
      if (nm==5)
         
      end   
      if (nm==6)
         ox=tr;
         oy=tr/2;
      end
      if (nm==7)
         ox=tr/2;
         oy=tr;
      end
   end   
end   
%
if (ox==n2 & a(4)/a(3) > 1.3)
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
%
if (ox==n2)
end   