clear;
n=64;
n2=n+n;
n3=n2+n;
n4=n3+n;
gg=zeros(n4,n4);
%S=imread('c:\my documents\my pictures\sar.tif');
%gg=double(S(1:256,1:256));
tr=0;
x_off=235;
gg(x_off,1+tr:64+tr)=1;
sdv=input('noise level = ?     ');
%ns=noise(n4,n4,0,sdv);
ns=sdv*randn(n4,n4);
for k1=1:n4
   for k2=1:n4
      ns(k1,k2)=ns(k1,k2)*(1-k1/n4)*(1-k2/n4);
   end
end   
ngg=gg+ns;
ngg=(n4/norm(ngg,1))*ngg;
gp=1;
x1=real(ww_2222(ngg,gp,1));
x21=real(ww_2222(ngg,gp,21));
x22=real(ww_2222(ngg,gp,22));
x23=real(ww_2222(ngg,gp,23));
x41=real(ww_2222(ngg,gp,41));
x42=real(ww_2222(ngg,gp,42));
x43=real(ww_2222(ngg,gp,43));
x44=real(ww_2222(ngg,gp,44));
x45=real(ww_2222(ngg,gp,45));
x8=real(ww_2222(ngg,gp,8));
x16=gg-x1-x21-x22-x23-x41-x42-x43-x44-x45-x8;
%
%figure(2)
subplot(2,2,1),imagesc(gg)
subplot(2,2,2),imagesc(ngg)
subplot(2,2,3),imagesc(x23+x42)
subplot(2,2,4),imagesc(x1+x23+x42)
%mm(1)=max(max(x1));
%mm(2)=max(max(x21));
%mm(3)=max(max(x22));
%mm(4)=max(max(x23));
%mm(5)=max(max(x41));
%mm(6)=max(max(x42));
%mm(7)=max(max(x43));
%mm(8)=max(max(x44));
%mm(9)=max(max(x45));
%mm(10)=max(max(x8));
%mm(11)=max(max(x16));
%kk=linspace(1,11,11);
%[kk',mm']
xx=x42+x23+x1;
%xx=x23;
[mm,xx_off]=max(max(x23'+x42'));
[xx(xx_off,1) xx(xx_off,n+1) xx(xx_off,n2+1) xx(xx_off,n3+1)]
%ss=xx(5,1)+xx(5,n+1)+xx(5,n2+1)+xx(5,n3+1);
ss=xx(xx_off,1)+xx(xx_off,n+1);
off_set=ss/64;
off1=(ss-xx(xx_off,1))/off_set;
[tr off1;x_off xx_off]