function [a,b]=mysort(nn);
[n,tem]=size(nn);
[c,d]=sort(nn);
flg=1;
for kk=1:n-1
   if (c(kk)>.999*c(kk+1))
      error('there is a tie')
      flg=0;
   end
end
if (flg==1)
   a=c;
   b=d;
end   