clear;
n=240;
n2=n*2;
nd2=n/2;
%orgn=1;
%
%S=imread('c:\my documents\my pictures\toad.tif');
%gg=double(S(1:256,1:256));
load gg
[nx,ny]=size(gg);
nx2=nx/2;
ny2=ny/2;
szx=n/2;
szy=2;
%hh=obj(0,szx,szy);
%gg(1+5:szy+5,1+3:szx+3)=hh;
%
[11 12 13 14 15 18 19 23 29 31]
[103 104 201 202 203]
gp1=input('input the group number    ');
%mm=max(max(gg));
%mn=0;
%lvl=input('input the noise level     ');
%sdv=lvl*mm;
%ns=noise(n2,n2,mn,sdv);
%gg=gg+ns;
%
[x1,x21,x22,x23,x4]=nn_22(gg,gp1);
xx1=(inn_22(x1,gp1));
xx21=(inn_22(x21,gp1));
xx22=(inn_22(x22,gp1));
xx23=(inn_22(x23,gp1));
xx4=(inn_22(x4,gp1));
y11=zeros(n2,n2);
y12=zeros(n2,n2);
y13=zeros(n2,n2);
y14=zeros(n2,n2);
y11(1:n,1:n)=x1(1:n,1:n);
y12(1:n,1+n:n2)=x1(1:n,1+n:n2);
y13(1+n:n2,1:n)=x1(1+n:n2,1:n);
y13(1+n:n2,1+n:n2)=x1(1+n:n2,1+n:n2);
yy11=inn_22(y11,gp1);
yy12=inn_22(y12,gp1);
yy13=inn_22(y13,gp1);
yy14=inn_22(y14,gp1);
y21=zeros(n2,n2);
y21(1:n,1:n2)=x21(1:n,1:n2);
yy21=(inn_22(y21,gp1));
y22=zeros(n2,n2);
y22(1:n2,1:n)=x22(1:n2,1:n);
yy22=(inn_22(y22,gp1));
y23=zeros(n2,n2);
y23(1:n2,1:n)=x23(1:n2,1:n);
yy23=(inn_22(y23,gp1));
mm(1)=max(max(real(xx1)));
mm(2)=max(max(real(xx21)));
mm(3)=max(max(real(xx22)));
mm(4)=max(max(real(xx23)));
mm(5)=max(max(real(xx4)));
%
big=.85*max(max(mm))*ones(4*n2+6,4*n2+6);
big(1:n2,1:n2)=real(yy11);
big(1:n2,3+n2:2+2*n2)=real(yy12);
big(1:n2,5+2*n2:4+3*n2)=real(yy13);
big(1:n2,7+3*n2:6+4*n2)=real(yy14);
%
big(3+n2:2+2*n2,1+n+1:n2+n+1)=real(yy21);
big(5+2*n2:4+3*n2,1+n+1:n2+n+1)=real(xx21-yy21);
big(3+n2:2+2*n2,3+n2+n+1:2+2*n2+n+1)=real(yy22);
big(5+2*n2:4+3*n2,3+n2+n+1:2+2*n2+n+1)=real(xx22-yy22);
big(3+n2:2+2*n2,5+2*n2+n+1:4+3*n2+n+1)=real(yy23);
big(5+2*n2:4+3*n2,5+2*n2+n+1:4+3*n2+n+1)=real(xx23-yy23);
%
big(7+3*n2:6+4*n2,3+n2+n+1:2+2*n2+n+1)=real(xx4);
%figure(2)
%colormap(gray)
%subplot(3,2,1),imagesc(gg)
%subplot(3,2,2),imagesc(real(xx1))
%subplot(3,2,3),imagesc(real(xx21))
%subplot(3,2,4),imagesc(real(xx22))
%subplot(3,2,5),imagesc(real(xx23))
%subplot(3,2,6),imagesc(real(xx4))
%k=input('input the position: 1 -- 5  ')
%colormap(gray)
%subplot(5,1,k),imagesc(big)
imagesc(big)
axis image
axis off
