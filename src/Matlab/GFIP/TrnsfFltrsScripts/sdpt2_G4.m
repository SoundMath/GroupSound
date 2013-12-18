function y=sdpt2_G4(x)
% 2-D semidirect product transform wrt group G4.
%
% INPUTS
%   x & signal for which to compute expansion coefs.
%
% OUTPUTS
%   y & expansion coefs of x wrt group G4.
%
% REMARKS/BUGS/OPEN ISSUES
%   \item[A] 
%   This code is a slightly modified version of that given on 
%   page 201 of [1]. For a given input signal, x, it computes the
%   expansion coefficients for x wrt the semidirect product group 
%   \[
%            G4 = (C_N X C_N) \sdp [1 0; 1 -1]. 
%   \]
%   \item[B]
%   Use this program for even N.
%   \item[C]
%   Line 6 of the program listing on page 201 of [1] has a minor typo
%   (fixed in this version).
%
% HISTORY
%   2001.04.02 & Myoung An & initial src code listing [1]
%   2004.02.29 & William DeMeo & docs/comments, minor mods/adds
%   2004.04.29 & William DeMeo & minor mods
%
% REFERENCES
% [1] Myoung An and Richard Tolimieri, 
%     "Group Filters and Image Processing." 
%     Psypher Press, 2003.

N=size(x,1);  %                            _________________
n2=length(x); %                           |        |        |
if n2~=N,     % In case x is shaped like  |        |        |
    x=x';     %                           |________|________|
end;          %
n=n2/2;       % n  : abelian normal subgroup is C_n X C_n
y=zeros(n2,n);
y=n*[ifft2(x(1:n,1:n)); ifft2(x(1+n:n2,1:n))];
t=zeros(2,n);
for k=1:n
    t(1:2,k)=[y(k,1); y(k+n,1)];  % (cf. typo, p. 201)
end;
t=sqrt(2)*ifft(t);
for k=1:n,
    y(k,1)=t(1,k);
    y(k+n,1)=t(2,k);
end;
% end of file: coef_G4.m
