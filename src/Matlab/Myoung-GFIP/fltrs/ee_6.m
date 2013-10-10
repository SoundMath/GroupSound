clear;
q_sls
n=48;
n2=n*2;
n3=n*3;
ox=[1 144 287 430 569];
oy=[1 84 167 250 333 412]
%
[1 2 3 4]
gp=input('the group number    ');
for k1=1:5
   for k2=1:6
      gg(1:n3,1:n2)=qdata(ox(k1):ox(k1)+n3-1,oy(k2):oy(k2)+n2-1);
      [x1,x2,x3,x6]=kk6(gg,gp);
      xx1=real(ikk6(x1,gp));
      xx2=real(ikk6(x2,gp));
      xx3=real(ikk6(x3,gp));
      qq1(ox(k1):ox(k1)+n3-1,oy(k2):oy(k2)+n2-1)=xx1;
      qq2(ox(k1):ox(k1)+n3-1,oy(k2):oy(k2)+n2-1)=xx2;
      qq3(ox(k1):ox(k1)+n3-1,oy(k2):oy(k2)+n2-1)=xx3;
   end
end
figure(1)
colormap(gray)
imagesc(qdata)
figure(2)
colormap(gray)
imagesc(qq1)
figure(3)
colormap(gray)
imagesc(qq2)
figure(4)
colormap(gray)
imagesc(qq3)
figure(5)
colormap(gray)
imagesc(qdata-qq1-qq2-qq3)
