function y=cn_2(u,v,gp)
% Semidirect product convolution of 1-dimensional signals.
%
% INPUT
%   u & 1D array (signal)
%   v & 1D array (signal) of same length as u
%   gp & (int) indicates group wrtw convolution is performed & default: 1 
%
% OUTPUT
%   y & 1D array (signal) stores resulting convolution product.
%
% REMARKS
%   o  The key operation which distinguishes the convolution
%      \[        
%             C(u)v = sum_x u(x) T(x) v
%      \]
%      over different groups is the translation $T(x) v$.
%
% See also: conv2sdp
%
% HISTORY
% 2001.04.03 & Myoung An     & wrote original program, named the 
%                            & file cn_2, but named the function cnv2. 
% 2004.03.29 & William DeMeo & added documentation, changed name 
%                            & of function from cnv2 to cn_2.
% 2004.04.29 & William DeMeo & minor mods
%
if nargin < 3, 
  gp=1;    
end;
if length(u) ~= length(v), 
  error('input signals must be of the same length'); 
end;
% TODO % accommodate signals of different length
n2=size(u,1);             % signal length $2N$
n=n2/2;                % $N$ : signal half-length
nn=(0:n-1);            % $\{0,1,\ldots,N-1\}$
rn = indexset(n,gp);
uu(1:n,1)=u(1:n,1);
for k=1:n
  uu(k+n,1)=u(rn(k)+n,1);
end   
[u1,u2]=n_2(uu(:,1),gp);
[v1,v2]=n_2(v(:,1),gp);
c(1:n)=u2(1:n).*v2(1:n) + u2(1+n:n2).*v2(1+n:n2)...
       + sqrt(2)*u1(1:n).*v1(1:n);
c(1+n:n2)=u2(1+n:n2).*v2(1:n) + u2(1:n).*v2(1+n:n2)...
          + sqrt(2)*u1(1+n:n2).*v1(1+n:n2);
y=sqrt(n)*in_2(c,gp);
