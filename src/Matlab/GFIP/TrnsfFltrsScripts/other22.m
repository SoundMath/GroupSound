clear;
n=32;
nd2=n/2;
n2=n*2;
orgn=1;
%
% nn2_22
%s2=1;
s2=input('input the scene number 0--6     ')
sz=input('input the strip size 1--32    ')
gg1=bkgd(s2,sz,nd2);
%
[11 12 13 14 15 18 19 23 29 31]
[103 104 201 202 203]
gp1=input('input the group number    ')
mm=max(max(gg1));
mn=0;
lvl=input('input the noise level     ')
sdv=lvl*mm;
ns=noise(n,n,mn,sdv);
ngg1=gg1+ns;
ngg=fill22(ngg1,n,gp1);
%
%pg=imread('fx1.tif');
%spg=pg(1341:1596,1157:1412);
%spg=double(spg);
%
%gp2=104;
%[y1,y21,y22,y23,y4]=mm2_22(spg,n,gp2);
%yy1=real(imm2_22(y1,n,gp2));
%yy21=real(imm2_22(y21,n,gp2));
%yy22=real(imm2_22(y22,n,gp2));
%yy23=real(imm2_22(y23,n,gp2));
%yy4=real(imm2_22(y4,n,gp2));
%
[x1,x21,x22,x23,x4]=nn2_22(ngg,n,gp1,orgn);
xx1=real(inn2_22(x1,n,gp1,orgn));
xx21=real(inn2_22(x21,n,gp1,orgn));
xx22=real(inn2_22(x22,n,gp1,orgn));
xx23=real(inn2_22(x23,n,gp1,orgn));
xx4=real(inn2_22(x4,n,gp1,orgn));
%
figure(1)
subplot(3,2,1),imagesc(ngg1)
subplot(3,2,2),imagesc(xx1(1:n,1:n))
subplot(3,2,3),imagesc(xx21(1:n,1:n))
subplot(3,2,4),imagesc(xx22(1:n,1:n))
subplot(3,2,5),imagesc(xx23(1:n,1:n))
subplot(3,2,6),imagesc(xx4(1:n,1:n))
figure(2)
subplot(3,2,1),imagesc(ngg)
subplot(3,2,2),imagesc(xx1)
subplot(3,2,3),imagesc(xx21)
subplot(3,2,4),imagesc(xx22)
subplot(3,2,5),imagesc(xx23)
subplot(3,2,6),imagesc(xx4)
