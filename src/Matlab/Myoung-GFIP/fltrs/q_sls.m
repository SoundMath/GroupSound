%fid=fopen(filename,'r');
fid=fopen('SLS_PORT.CAD','r');
overlap = 26;
filter_delay = 5;
column_size = 712;
row_size = 507;
qdata=zeros(column_size,row_size);
figure(1);
colormap(gray);
brighten(0.8);
for n=1:filter_delay,
qdata(1:column_size,n)=fread(fid,column_size,'uchar');
end;
for n=1:overlap,
qdata(1:column_size,n+row_size-overlap)=fread(fid,column_size,'uchar');
end;
figure(1);
slsimage=0;
stop_image=1;
brighten(-0.6)

stop_image= 	input(' Enter SLS Image #: ');
  
while slsimage<stop_image,
for n=1:overlap,
qdata(1:column_size,n)=qdata(1:column_size,n+row_size-overlap);
end;
for n=overlap+1:row_size,
qdata(1:column_size,n)=fread(fid,column_size,'uchar');
end;
slsimage=slsimage+1;
end;
stop_image=stop_image+1;
figure(1);
imagesc(qdata);
xxx=sprintf('%d',slsimage);
titleLine=['sls image ',xxx];
title(titleLine);
%
%
%
