clear;
n=128;
n2=n*2;
orgn=1;
%
A=imread('fiber.bmp');
%B=double(A(43:534,1:648));
B=double(A(54:309,11:266));
%spg=pg(1341:1596,1157:1412);
%spg=double(spg);
%
%nn2_22
[11 12 13 14 15 18 19 23 29 31]
[103 104 201 202 203]
%12 (R22 X A29)
%18 (A71 x A23)
%104 (A12 X A30) 
%201 [1 0;0 -1],[1 0;N/2 1]
%202 [1 0;N/2 N/2-1],[1 N/2;N/2 1]
%203 [-1 0;0 1],[N/2+1 N/2;N/2 1]
%
%
%nn2_4
%[1 2 11 12 21 22 23 24]
gp1=input('input the group number    ')
[x1,x21,x22,x23,x4]=nn2_22(B,n,gp1,orgn);
xx1=real(inn2_22(x1,n,gp1,orgn));
xx21=real(inn2_22(x21,n,gp1,orgn));
xx22=real(inn2_22(x22,n,gp1,orgn));
xx23=real(inn2_22(x23,n,gp1,orgn));
xx4=real(inn2_22(x4,n,gp1,orgn));
%
subplot(3,2,1),imagesc(B)
subplot(3,2,2),imagesc(xx1)
subplot(3,2,3),imagesc(xx21)
subplot(3,2,4),imagesc(xx22)
subplot(3,2,5),imagesc(xx23)
subplot(3,2,6),imagesc(xx4)
%
%[x1,x2,x4]=nn2_4(B,n,gp1);
%xx1=real(inn2_4(x1,n,gp1));
%xx2=real(inn2_4(x2,n,gp1));
%xx22=real(inn2_22(x22,n,gp1,orgn));
%xx23=real(inn2_22(x23,n,gp1,orgn));
%xx4=real(inn2_4(x4,n,gp1));
%
%subplot(2,2,1),imagesc(B)
%subplot(2,2,2),imagesc(xx1)
%subplot(2,2,3),imagesc(xx2)
%subplot(3,2,4),imagesc(xx22)
%subplot(3,2,5),imagesc(xx23)
%subplot(2,2,4),imagesc(xx4)
