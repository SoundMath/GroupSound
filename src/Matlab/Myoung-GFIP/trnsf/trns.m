clear;
n=32;
n2=n+n;
m=n/2;
g=zeros(n2,n2);
for k=1:n2
   g(k,k)=1;
end 
fg=real(fft(g));
mm=max(max(fg));
mn=0;
lvl=input('input the noise level     ')
sdv=lvl*mm;
ns=noise(n2,n2,mn,sdv);
%
nfg=fg+ns;
ifg=real(ifft(nfg));
figure(1)
clf
subplot(2,2,1),imagesc((fg))
subplot(2,2,2),imagesc(nfg)
%
%[11 12 13 14 15 18 19 23 29 31]
%[103 104 201 202 203]
%gp1=input('input the group number    ')
gp1=11;
%
[x1,x21,x22,x23,x4]=nn_22(ifg,gp1);
xx1=real(inn_22(x1,gp1));
xx21=real(inn_22(x21,gp1));
xx22=real(inn_22(x22,gp1));
xx23=real(inn_22(x23,gp1));
xx4=real(inn_22(x4,gp1));
%
yy=xx22+xx23;
yy(1,1)=yy(1,1)+xx4(1,1);
yy(n+1,1)=yy(n+1,1)+xx4(n+1,1);
yy(1,n+1)=yy(1,n+1)+xx4(1,n+1);
yy(n+1,n+1)=yy(n+1,n+1)+xx4(n+1,n+1);
y=real(fft(yy));
subplot(2,2,3),imagesc(y)
