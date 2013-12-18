function y=gn_22(u);
[n4,tem]=size(u);
n1=n4/4;
n2=n1+n1;
n3=n2+n1;
m=n1/2;
nn=linspace(0,n1-1,n1);
%
rn2=mod(n1-nn,n1)+1;
rn3=mod((m+1)*nn,n1)+1;
rn4=mod((m-1)*nn,n1)+1;
%
u1=cnvmt(u(1:n1,1));
u2=cnvmt(u(1+n1:n2,1));
u3=cnvmt(u(1+n2:n3,1));
u4=cnvmt(u(1+n3:n4,1));
%
for k2=1:n1
   for k1=1:n1
      ur2(k1,k2)=u2(rn2(k1),rn2(k2));
      ur3(k1,k2)=u3(rn3(k1),rn3(k2));
      ur4(k1,k2)=u4(rn4(k1),rn4(k2));
   end
end   
y=[u1 ur2 ur3 ur4;ur2 u1 ur4 ur3;ur3 ur4 u1 ur2;ur4 ur3 ur2 u1];
