clear;
n=32;
n2=n+n;
s2=input('input the scene, 1--3    ')
sz=input('input the strip size  ')
mn=input('input the mean    ')
%lvl=input('input the noise level     ')
pat1=bkgd(s2,sz,n/4);
if (s2==1)
   gp=11;
   prj=23;
end
if (s2==2)
   gp=12;
   prj=1;
end   
if (s2==3)
   gp=12;
   prj=1;
end   
%bkgd : 3 -- gp = 12,13,14 : prj=1
%bkgd : 1 -- gp = 11       : prj=23
flg0=floor(10*rand);
flg0=rem(flg0,2);
flg0=1;
%
sdv=1;
ns=noise(n2,n2,mn,sdv);
%ns=.7*(ns+bkgd(0,4,n));
%ns=bkgd(0,4,n);
ngg=ns;
xx1=floor((n+n/2)*rand)+1;
yy1=floor((n+n/2)*rand)+1;
if (flg0==1)
   ngg(xx1:xx1+n/2-1,yy1:yy1+n/2-1)=mn*pat1;
   %ngg(xx1:xx1+n/2-1,yy1:yy1+n/2-1)=.8*(pat1+.2*ns(xx1:xx1+n/2-1,yy1:yy1+n/2-1));
end   
clf
subplot(3,2,1),imagesc(ngg)
pause
%
%gp=11;
%prj=23;
%
%[x1,x21,x22,x23,x4]=nn_22(ngg,gp);
y=real(ww_22(ngg,gp,prj));
%y23=real(inn_22(x23,gp));
%y4=real(inn_22(x4,gp));
%mm(1)=max(max(y1));
%mm(2)=max(max(y23));
%mm(3)=max(max(y4));
%
%if (mm(1)+mm(2)>mn*.9*mm(3))
   [ox,oy]=lct3(y,n/2);
%else
%   error('Cannot find it')
%end
sz1=n2-n/2;
frm1(1:sz1,1:sz1)=ngg(1+ox:sz1+ox,1+oy:sz1+oy);
subplot(3,2,2),imagesc(frm1)
pause
[ox oy]
%
%[x1,x21,x22,x23,x4]=nn_22(frm1,gp);
y=real(ww_22(frm1,gp,prj));
%y23=real(inn_22(x23,gp));
%y4=real(inn_22(x4,gp));
%mm(1)=max(max(y1));
%mm(2)=max(max(y23));
%mm(3)=max(max(y4));
%
%if (mm(1)+mm(2)>mn*.9*mm(3))
   tr=n/2;
   [oox,ooy]=lct3(y,tr);
%else
%   error('Cannot find it')
%end
ox=ox+oox;
oy=oy+ooy;
sz2=sz1-tr;
frm2(1:sz2,1:sz2)=ngg(1+ox:sz2+ox,1+oy:sz2+oy);
%
subplot(3,2,3),imagesc(frm2)
pause
[ox oy]
%
%[x1,x21,x22,x23,x4]=nn_22(frm2,gp);
y=real(ww_22(frm2,gp,prj));
%y23=real(inn_22(x23,gp));
%y4=real(inn_22(x4,gp));
%mm(1)=max(max(y1));
%mm(2)=max(max(y23));
%mm(3)=max(max(y4));
%
%if (mm(1)+mm(2)>mn*.9*mm(3))
   tr=n/4;
   [oox,ooy]=lct3(y,tr);
%else
%   error('Cannot find it')
%end
ox=ox+oox;
oy=oy+ooy;
sz3=sz2-tr;
frm3(1:sz3,1:sz3)=ngg(1+ox:sz3+ox,1+oy:sz3+oy);
subplot(3,2,4),imagesc(frm3)
pause
[ox oy]
%
%
%[x1,x21,x22,x23,x4]=nn_22(frm3,gp);
y=real(ww_22(frm3,gp,prj));
%y23=real(inn_22(x23,gp));
%y4=real(inn_22(x4,gp));
%mm(1)=max(max(y1));
%mm(2)=max(max(y23));
%mm(3)=max(max(y4));
%if (mm(1)+mm(2)>mn*.9*mm(3))
   tr=n/8;
   [oox,ooy]=lct3(y,tr);
%else
%   error('Cannot find it')
%end
ox=ox+oox;
oy=oy+ooy;
sz4=sz3-tr;
frm4(1:sz4,1:sz4)=ngg(1+ox:sz4+ox,1+oy:sz4+oy);
subplot(3,2,5),imagesc(frm4)
[ox+1 oy+1]
