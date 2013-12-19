function y=abel_tr(x,t1,t2)
% Abelian (cyclic) translation
%
% INPUT
%   x   2-D array
%   t1  integer by which to translate x in first dimension
%   t2  integer by which to translate x in second dimension
%
% OUTPUT
%   y   2-D array containing translated version of x
%
[m2,n2]=size(x);
for k1=1:m2
   kk1=mod(k1-1-t1,m2)+1;
   for k2=1:n2
      kk2=mod(k2-1-t2,n2)+1;
      y(k1,k2)=x(kk1,kk2);
   end
end   
