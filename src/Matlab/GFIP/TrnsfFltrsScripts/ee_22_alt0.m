clear;
n=64;
n2=n*2;
nd2=n/2;
gg=zeros(n2,n2);
%S=imread('c:\my documents\my pictures\toad.tif');
%gg=double(S(1:256,1:256));
%[nx,ny]=size(gg);
%nx2=nx/2;
%ny2=ny/2;
for k=1:n
   gg(k,2*k-1)=1;
end   
sdv=input('noise level?   ');
ns=noise(n2,n2,0,sdv);
ngg=gg+ns;
%
[11 12 13 14 15 18 19 23 29 31]
[103 104 201 202 203]
gp=input('input the group number    ')
%gp=203;
%
x1=real(ww_22(ngg,gp,1));
x21=real(ww_22(ngg,gp,21));
x22=real(ww_22(ngg,gp,22));
x23=real(ww_22(ngg,gp,23));
x4=gg-x1-x21-x22-x23;
figure(1)
colormap(gray)
subplot(3,2,1),imagesc(gg)
subplot(3,2,2),imagesc(ngg)
subplot(3,2,3),imagesc(x21)
subplot(3,2,4),imagesc(x22)
subplot(3,2,5),imagesc(x23)
subplot(3,2,6),imagesc(x4)
