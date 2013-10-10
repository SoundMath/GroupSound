function y=shw_sp(x)
[m,n]=size(x);
for k=1:m
   y(k,:)=x(k,:)+k-1+i*(k-1);
end   
