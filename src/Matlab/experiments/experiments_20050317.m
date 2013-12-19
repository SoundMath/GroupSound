% [a one-line statement of function's purpose]
%
% Input:
%    
% Output:
%    
% Usage:
%    
% Description:
%    
% Examples:
%    
% To do:
%    
% See also:
%    
% Author:
%    
TEST=[0 1];

gp=1;
N=2;  % order of each abelian dimension, as in $C_N(x) \times C_N(y)$
L=4;  % order of the non-abelian dimension, as in $C_L(k)$
NN = N*N*L;   % total order (number of coordinate indices)
nn = 0:NN-1;  % integer labels for indices
ff= [(0:2:NN-2); (1:2:NN-1)];   % an example image
                                %  ff = [0 2 4 6 8 10 12 14;...
                                %        1 3 5 7 9 11 13 15]
                                %  ff(11) == ff(1,6) == 10
[m,n,l] = gindex(ff(11),N,L,0); % group index for 11th entry, 
                                % should be m=0, n=1, l=2
indx = iindex(m,n,l,N,0);       % should be 10 == ff(11)  

if(TEST(1)),
  for k=0:NN-1,
    [m,n,l] = gindex(k,N,L,0);  
    indx = iindex(m,n,l,N,0);
    disp(sprintf('k=%d:  [m,n,l]=[%d,%d,%d],   iindex(m,n,l)= %d',k,m,n,l,indx));
  end;
end;


hh=zeros(N,N,L);
ff=zeros(N,N,L);
if(TEST(2)),
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
end;
    
%    indx0 = iindex(m0,n0,l0,N,0);
%        for indx0=0:NN-1, 
%    [m0,n0,l0]=gindex(indx0,N,L,0);  
%  end;
%end;


