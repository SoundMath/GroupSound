function [ox,oy]=lct(y1,tr);
[n2,tem]=size(y1);
n=n2/2;
tr2=tr/2;
nn(1)=max(max(y1(1:n,1:n)));
nn(2)=max(max(y1(1+n:n2,1:n)));
nn(3)=max(max(y1(1:n,1+n:n2)));
nn(4)=max(max(y1(1+n:n2,1+n:n2)));
ss=nn(1)+nn(2)+nn(3)+nn(4);
kk=nn/ss;
ll=zeros(4,1);
for k=1:4
   if (kk(k) > .25)
      ll(k)=1;
   end
end   
ox=n2;
oy=n2;
flg=0;
tr2=tr/2;
lll=ll(1)+ll(2)+ll(3)+ll(4);
if (lll==1)
   if (ll(1)==1)
      ox=0;
      oy=0;
   else
      if (ll(2)==1)
         ox=tr;
         oy=0;
      else
         if (ll(3)==1)
            ox=0;
            oy=tr;
         else
            ox=tr;
            oy=tr;
         end
      end
   end
end
%
if (lll==3)
   if (ll(1)==0)
      ox=tr;
      oy=tr;
   else
      if (ll(2)==0)
         ox=0;
         oy=tr;
      else
         if (ll(3)==0)
            ox=tr;
            oy=0;
         else
            ox=0;
            oy=0;
         end
      end
   end
end
%   
if (lll==2 & kk(1) > .25)
   if (kk(2) > .25)
      oy=0;
      if (abs(kk(1)-kk(2)) < .01)
         ox=tr2;
      else
         if (kk(1) > kk(2))
            ox=0;   
         else
            ox=tr;
         end
      end
   end
   if (kk(3) > .25)
      ox=0;
      if (abs(kk(1)-kk(3)) < .01)
         oy=tr2;
      else
         if (kk(1) > kk(3))
            oy=0;
         else
            oy=tr;
         end
      end
   end
   if (kk(4) > .25)
      if (abs(kk(1)-kk(4)) < .01)
         ox=tr2;
         oy=tr2;
      else
         if (kk(1) > kk(4))
            ox=0;
            oy=0;
         else
            ox=tr;
            oy=tr;
         end   
      end   
   end   
end
%
if (lll==2 & kk(1) < .25)
   if (kk(2) > .25)
      if (kk(3) > .25)
         ox=tr2;
         oy=tr2;
      else
         ox=tr;
         if (abs(kk(2)-kk(4)) < .01)
            oy=tr2;
         else
            if (kk(2) > kk(4))
               oy=0;
            else
               oy=tr;
            end   
         end   
      end   
   else
      oy=tr;
      if (abs(kk(3)-kk(4)) < .01)
         ox=tr2;
      else
         if (kk(3) > kk(4))
            ox=0;
         else
            ox=tr;
         end
      end   
   end   
end      