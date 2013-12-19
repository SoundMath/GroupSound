% Experiments performed on 20050318.
%
% Author: williamdemeo@yahoo.com
%    
TEST=[0 1 0 0];

N=4;  % order of each abelian dimension, as in $C_N(x) \times C_N(y)$
L=4;  % order of the non-abelian dimension, as in $C_L(k)$
NNL = N*N*L;   % total order (number of coordinate indices)


if(TEST(1)),
  gp=3;
  nn= uint16(0:NNL-1);  % integer labels for indices
  fNbyNL = reshape(nn,N,N*L);
  test_invariants(fNbyNL,char('unicity=1','integers=1','min=0', 'max=63','verbose=1'));
  ff=zeros(N,N,L,'uint16');
  for l1=0:L-1,
    ff(:,:,l1+1) = fNbyNL(1:N,1:N) +l1*N*N;
  end;
  ff(:,:)
  h1=zeros(N,N,L,'uint16');
  h2=zeros(N,N,L,'uint16');
  h3=zeros(N,N,L,'uint16');
  for m1=0:N-1,
    for n1=0:N-1,
      for l1=0:L-1,
        [m0,n0,l0]=f2h(m1,n1,l1,N,L,1);
        h1(m1+1,n1+1,l1+1) = ff(m0+1,n0+1,l0+1);
        [m0,n0,l0]=f2h(m1,n1,l1,N,L,2);
        h2(m1+1,n1+1,l1+1) = ff(m0+1,n0+1,l0+1);
        [m0,n0,l0]=f2h(m1,n1,l1,N,L,3);
        h3(m1+1,n1+1,l1+1) = ff(m0+1,n0+1,l0+1);
      end;
    end;
  end;
  h1(:,:)
  h2(:,:)
  h3(:,:)
end;

if(TEST(2)),
  ff=zeros(N,N,L,'uint16');
%  ff(1,:,:)=1;  ff(:,1,:)=1;  %  ff(3,3,1)=1; 
  ff(2:4,2:4,2)=1;  ff(2:4,2:4,3)=2;  ff(2:4,2:4,4)=3;
  ff(2,4,1)=2; ff(3,4,1)=3; ff(4,4,1)=4; 
  ff(4,3,1)=6; ff(2,3,1)=12; 
  ff(4,2,1)=8; ff(3,2,1)=9;  ff(2,2,1)=10;  
  ff(:,:)
  h1=zeros(N,N,L,'uint16');
  h2=zeros(N,N,L,'uint16');
  h3=zeros(N,N,L,'uint16');
  for m1=0:N-1,
    for n1=0:N-1,
      for l1=0:L-1,
        [m0,n0,l0]=f2h(m1,n1,l1,N,L,1);
        h1(m1+1,n1+1,l1+1) = ff(m0+1,n0+1,l0+1);
        [m0,n0,l0]=f2h(m1,n1,l1,N,L,2);
        h2(m1+1,n1+1,l1+1) = ff(m0+1,n0+1,l0+1);
        [m0,n0,l0]=f2h(m1,n1,l1,N,L,3);
        h3(m1+1,n1+1,l1+1) = ff(m0+1,n0+1,l0+1);
      end;
    end;
  end;
  h1(:,:)
  h2(:,:)
  h3(:,:)
  mat2tex(ff,'Rotation_44_4.tex');
  mat2tex(h1,'Rotation_44_4.tex');
  mat2tex(h2,'Rotation_44_4.tex');
  mat2tex(h3,'Rotation_44_4.tex');
end;


if(TEST(3)),
  for k=0:NN-1,
    [m,n,l] = gindex(k,N,L,0);  
    indx = iindex(m,n,l,N,0);
    disp(sprintf('k=%d:  [m,n,l]=[%d,%d,%d],   iindex(m,n,l)= %d',k,m,n,l,indx));
  end;
end;


if(TEST(4)),
  gp=1;
  hh=zeros(N,N,L,'uint16');
  ff=zeros(N,N,L,'uint16');
  for m0=0:N-1,
    for n0=0:N-1,
      for l0=0:L-1,
        ff(m0+1,n0+1,l0+1)=l0*L + n0*N + m0;
      end;
    end;
  end;
  for m1=0:N-1,
    for n1=0:N-1,
      for l1=0:L-1,
        [m0,n0,l0]=f2h(m1,n1,l1,N,L,gp);
        hh(m1+1,n1+1,l1+1) = ff(m0+1,n0+1,l0+1);
      end;
    end;
  end;

  % view ff and hh as images in C_N x C_N \sdp C_L:
  ff(:,:)
  hh(:,:)
end;
    
%    indx0 = iindex(m0,n0,l0,N,0);
%        for indx0=0:NN-1, 
%    [m0,n0,l0]=gindex(indx0,N,L,0);  
%  end;
%end;


