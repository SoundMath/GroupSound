function y=f2(x,d2);
rt2=1/(sqrt(2));
for nn=1:d2
   y(1,nn)=rt2*(x(1,nn)+x(2,nn));
   y(2,nn)=rt2*(x(1,nn)-x(2,nn));
end   