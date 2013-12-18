function y=ft4(x,d1);
for nn=1:d1
   t1=x(1,nn)+x(3,nn);
   t2=x(1,nn)-x(3,nn);
   t3=x(2,nn)+x(4,nn);
   t4=x(2,nn)-x(4,nn);
   y(1,nn)=.5*(t1+t3);
   y(2,nn)=.5*(t2+t4);
   y(3,nn)=.5*(t1-t3);
   y(4,nn)=.5*(t2-t4);
end   