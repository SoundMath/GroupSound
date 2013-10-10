function f=lum(n2,n)
x=linspace(0,1,n2);
if (n==0)
   f=x'*x;
end
if (n==1)
   f=x'*(1-x);
end   
if (n==2)
   f=(1-x')*x;
end
if (n==3)
   f=(1-x')*(1-x);
end   