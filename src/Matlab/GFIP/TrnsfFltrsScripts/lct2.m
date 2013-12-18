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
if (.9*a(4) > a(3))
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
   else
      nm=b(4)+b(3);
      if (nm==3)
         ox1=0;
         oy1=0;
         ox2=tr;
         oy2=0;
      end
      if (nm==4)
         ox1=0;
         oy1=0;
         ox2=0;
         oy2=tr;
      end   
      if (nm==6)
         ox1=tr;
         oy1=0;
         ox2=tr;
         oy2=tr;
      end   
      if (nm==7)
         ox1=0;
         oy1=tr;
         ox2=tr;
         oy2=tr;
      end  
      if (nm==5)
         ox=n2;
         oy=n2;
      end   
      if (ox==n2 & nm~=5)
         frmm1(1:n2-tr,1:n2-tr)=frm0(1+ox1:n2-tr+ox1,1+oy1:n2-tr+oy1);
         frmm2(1:n2-tr,1:n2-tr)=frm0(1+ox2:n2-tr+ox2,1+oy2:n2-tr+oy2);
         [x1,x21,x22,x23,x4]=nn_22(frmm1,gp);
         y11=real(inn_22(x1,gp));
         y21=real(inn_22(x23,gp));
         [x1,x21,x22,x23,x4]=nn_22(frmm2,gp);
         y12=real(inn_22(x1,gp));
         y22=real(inn_22(x23,gp));
         m11=max(max(y11));
         m21=max(max(y21));
         m12=max(max(y12));
         m22=max(max(y22));
         if (m11+m21 > m12+m22)
            ox=ox1;
            oy=oy1;
         else
            ox=ox2;
            oy=oy2;
         end 
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