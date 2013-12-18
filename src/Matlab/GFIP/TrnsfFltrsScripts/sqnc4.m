clear;
%load ps_inv60
n=32;
n2=2*n;
n3=3*n;
n4=4*n;
%
ln=zeros(n,n);
for k=1:n
   ln(k,k)=1;
end
for k1=1:n/2
   for k2=1:n/2
      chk(2*k1-1,2*k2-1)=1;
      chk(2*k1,2*k2-1)=2;
      chk(2*k1-1,2*k2)=3;
      chk(2*k1,2*k2)=4;
   end
end 
rd=rand(n,n);
f1=rd+chk;
ftwo=2*rd+chk;
f3=3*rd+chk;
f4=4*rd+chk;
ff_in=[f1 ftwo f3 f4];
ff=[f1 f3; ftwo f4];
%
[g1,g2,g4]=scl2_4(ff,n);
c1=iscl2_4(g1,n);
c2=iscl2_4(g2,n);
c4=iscl2_4(g4,n);
cc1=[c1(1:n,1:n) c1(1+n:n2,1:n) c1(1:n,1+n:n2) c1(1+n:n2,1+n:n2)];
cc2=[c2(1:n,1:n) c2(1+n:n2,1:n) c2(1:n,1+n:n2) c2(1+n:n2,1+n:n2)];
cc4=[c4(1:n,1:n) c4(1+n:n2,1:n) c4(1:n,1+n:n2) c4(1+n:n2,1+n:n2)];
figure(1);
colormap(gray)
subplot(4,1,1),imagesc(ff_in)
subplot(4,1,2),imagesc(real(cc1))
subplot(4,1,3),imagesc(real(cc2))
subplot(4,1,4),imagesc(real(cc4))
%
[g1,g2,g4]=nn2_22(ff,n);
d1=inn2_22(g1,n);
d2=inn2_22(g2,n);
d4=inn2_22(g4,n);
my_dd1=[d1(1:n,1:n) d1(1+n:n2,1:n) d1(1:n,1+n:n2) d1(1+n:n2,1+n:n2)];
my_dd2=[d2(1:n,1:n) d2(1+n:n2,1:n) d2(1:n,1+n:n2) d2(1+n:n2,1+n:n2)];
my_dd4=[d4(1:n,1:n) d4(1+n:n2,1:n) d4(1:n,1+n:n2) d4(1+n:n2,1+n:n2)];
figure(2);
colormap(gray)
subplot(4,1,1),imagesc(ff_in)
subplot(4,1,2),imagesc(real(my_dd1))
subplot(4,1,3),imagesc(real(my_dd2))
subplot(4,1,4),imagesc(real(my_dd4))
%
[g1,g2,g4 ]=nn2_4(ff,n);
e1=inn2_4(g1,n);
e2=inn2_4(g2,n);
e4=inn2_4(g4,n);
my_ee1=[e1(1:n,1:n) e1(1+n:n2,1:n) e1(1:n,1+n:n2) e1(1+n:n2,1+n:n2)];
my_ee2=[e2(1:n,1:n) e2(1+n:n2,1:n) e2(1:n,1+n:n2) e2(1+n:n2,1+n:n2)];
my_ee4=[e4(1:n,1:n) e4(1+n:n2,1:n) e4(1:n,1+n:n2) e4(1+n:n2,1+n:n2)];
figure(3);
colormap(gray)
subplot(4,1,1),imagesc(ff_in)
subplot(4,1,2),imagesc(real(my_ee1))
subplot(4,1,3),imagesc(real(my_ee2))
subplot(4,1,4),imagesc(real(my_ee4))
