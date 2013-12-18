clear;
n=64;
n4=n*4;
%gg=mdaread('plane.tiff',256,256);
%gg=gg1(1:128,113:240);
%gg1=mdaread('grass.tiff',512,512);
%gg(1:256,1:256)=gg1(1:256,1:256);
%gg=zeros(n4,n4);
%f1 = fopen('brst512.mat','rt');
%[gg,cc]=fscanf(f1,'%4f',[512,512]);
%fclose(f1);
%gg=gg';
%ff(1:256,1:256)=gg(257:512,100:355);
%
chk=zeros(n4,n4);
for k1=1:n*2
   for k2=1:n*2
      chk(2*k1-1,2*k2-1)=1;
      chk(2*k1,2*k2-1)=2;
      chk(2*k1-1,2*k2)=3;
      chk(2*k1,2*k2)=4;
   end
end   
sm=zeros(n4,n4);
for k1=1:n/4
   for k2=1:n/4
      sm(2*k1-1+n,2*k2-1+n)=5;
   end
end   
for k=1:n4
   ln(k,k)=5;
end 
chk=chk+rrtt(ln,n4,25)+rrtt(ln,n4,79);
chk=chk+rrtt(sm,n4,30)+rrtt(sm,n4,55);
%chk=gg;
%
[f1,f2,f4,f8,f16]=scl2_16(chk,n);
c1=iscl2_16(f1,n);
c2=iscl2_16(f2,n);
c4=iscl2_16(f4,n);
c8=iscl2_16(f8,n);
c16=iscl2_16(f16,n);
figure(1);
subplot(2,3,1),imagesc(chk)
subplot(2,3,2),imagesc(real(c1))
subplot(2,3,3),imagesc(real(c2))
subplot(2,3,4),imagesc(real(c4))
subplot(2,3,5),imagesc(real(c8))
subplot(2,3,6),imagesc(real(c16))
%

