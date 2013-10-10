function ww=gnn_22(u,gp);
[n2,tm]=size(u);
n=n2/2;
%
nn1=n*n;
nn2=nn1+nn1;
nn3=nn2+nn1;
nn4=nn3+nn1;
nn=linspace(0,n-1,n);
rnn=mod(n-nn,n);
%
if (gp==11)
   for k2=0:n-1
      for k1=0:n-1
         act1(k1+1+n*k2)=rnn(k1+1)+1+n*rnn(k2+1);
         act2(k1+1+n*k2)=k2+1+n*k1;
         act3(k1+1+n*k2)=rnn(k2+1)+1+n*rnn(k1+1);
      end   
   end   
end   
for l=0:n-1
   l1=l+1;
   for k=0:n-1
      k1=k+1;
      for j=0:n-1
         j1=j+1;
         lmj=mod(l-j,n)+1;
         lpj=mod(l+j,n)+1;
         kmj=mod(k-j,n)+1;
         kpj=mod(k+j,n)+1;
         for i=0:n-1
            i1=i+1;
            kmi=mod(k-i,n)+1;
            kpi=mod(k+i,n)+1;
            lpi=mod(l+i,n)+1;
            lmi=mod(l-i,n)+1;
            %
            ww(k1+n*l,i1+n*j)=u(kmi,lmj);
            ww(k1+n*l,i1+n*j+nn1)=u(kpi+n,lpj);
            ww(k1+n*l,i1+n*j+nn2)=u(kmj,lmi+n);
            ww(k1+n*l,i1+n*j+nn3)=u(kpj+n,lpi+n);
            %
            ww(k1+n*l+nn1,i1+n*j)=u(kpi+n,lpj);
            ww(k1+n*l+nn1,i1+n*j+nn1)=u(kmi,lmj);
            ww(k1+n*l+nn1,i1+n*j+nn2)=u(kpj+n,lpi+n);
            ww(k1+n*l+nn1,i1+n*j+nn3)=u(kmj,lmi+n);
            %
            ww(k1+n*l+nn2,i1+n*j)=u(kmj,lmi+n);
            ww(k1+n*l+nn2,i1+n*j+nn1)=u(kpj+n,lpi+n);
            ww(k1+n*l+nn2,i1+n*j+nn2)=u(kmi,lmj);
            ww(k1+n*l+nn2,i1+n*j+nn3)=u(kpi+n,lpj);
            %
            ww(k1+n*l+nn3,i1+n*j)=u(kpj+n,lpi+n);
            ww(k1+n*l+nn3,i1+n*j+nn1)=u(kmj,lmi+n);
            ww(k1+n*l+nn3,i1+n*j+nn2)=u(kpi+n,lpj);
            ww(k1+n*l+nn3,i1+n*j+nn3)=u(kmi,lmj);
         end
      end   
   end   
end   
%
%
