% Experiments performed on 20050321.
%
% Author: williamdemeo@yahoo.com
%    
TEST=[0 1 0 0];

N=4;  % order of each abelian dimension, as in $C_N(x) \times C_N(y)$
L=6;  % order of the non-abelian dimension, as in $C_L(k)$
NNL = N*N*L;   % total order (number of coordinate indices)

%c = [0 -1; 1 0];
c = [0 1; -1 1];

L_c = group_order(c);
if L~=L_c,
  L_c
  error('L_c is not the expected order of the group');
end;

if(TEST(2)),
  ff=zeros(N,N,L,'uint16');
  %  ff(1,:,:)=1;  ff(:,1,:)=1;  %  ff(3,3,1)=1; 
  for k=0:L-1,
    ff(1:N,2:N,k+1)=k;
  end
  ff(2,4,1)=2; ff(3,4,1)=3; ff(4,4,1)=4; 
  ff(2,3,1)=12; ff(3,3,1)=0; ff(4,3,1)=6; 
  ff(2,2,1)=10; ff(3,2,1)=9; ff(4,2,1)=8;  
  ff(:,:)
  H=zeros(N,N,L,L,'uint16');
  for k=0:L-1,
    for l=0:L-1,
      for n=0:N-1,
        for m=0:N-1,
          [m0,n0,l0]=f2h(c,k,m,n,l,N,L);
          H(m+1,n+1,l+1,k+1) = ff(m0+1,n0+1,l0+1);
        end;
      end;
    end;
  end;
  for k=0:L-1,
    h = H(:,:,:,k+1);
    h(:,:)
    if true,
      mat2tex(h,'Rotation_44_6.tex');  
    end;
  end;
end;

