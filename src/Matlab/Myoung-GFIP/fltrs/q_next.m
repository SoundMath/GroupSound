for n=1:26,
qdata(1:712,n)=qdata(1:712,n+481);
end;
for n=27:507,
qdata(1:712,n)=fread(fid,712,'uchar');
end;
figure(1);
imagesc(qdata);
slsimage=slsimage+1;
xxx=sprintf('%d',slsimage);
titleLine=['sls image',xxx];
title(titleLine);
%
%
