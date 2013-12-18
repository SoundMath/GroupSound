clear;
%q_sls
n=64;
n2=n*2;
%ox=[1 117 234 351 468 585];
%oy=[1 128 255 380]
%
[1 2 3 11 12 21 22]
gp=input('the group number    ');
%for k1=1:6
%   for k2=1:4
%      gg(1:n2,1:n2)=qdata(ox(k1):ox(k1)+127,oy(k2):oy(k2)+127);
%      x1=real(ww_4(gg,gp,1));
%      x2=real(ww_4(gg,gp,2));
%      qq1(ox(k1):ox(k1)+127,oy(k2):oy(k2)+127)=x1;
%      qq2(ox(k1):ox(k1)+127,oy(k2):oy(k2)+127)=x2;
%   end
%end
%figure(1)
%imagesc(qdata)
%colormap(gray)
gg=zeros(n2,n2);
for k=1:n
   gg(k,2*k)=1;
end
sdv=input('noise level?   ');
ns=noise(n2,n2,0,sdv);
ngg=gg+ns;
[x1,x2,x4]=nn_4(ngg,gp);
xx1=real(inn_4(x1,gp));
xx2=real(inn_4(x2,gp));
xx4=real(inn_4(x4,gp));
u4=zeros(n2,n2);
for k=1:n-1
   u4(mod(-2*k,n)+1,k+1)=x4(mod(-2*k,n)+1,k+1);
end   
figure(1)
colormap(gray)
subplot(2,2,1),imagesc(gg)
subplot(2,2,2),imagesc(xx1)
subplot(2,2,3),imagesc(xx2)
subplot(2,2,4),imagesc(xx4)
