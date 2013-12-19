function myfigure(u,v,figopt)
% Subroutine used by EX_6_8 for figure generation.
%
% HISTORY
%   2004.04.29 & William DeMeo & initial file

subplot(1,2,1); axis tight;
  plot(u); 
  if figopt,
    axis([0,length(u),min(u),max(u)]);
  end;
subplot(1,2,2);
  plot(v); 
  if figopt,
    axis([0,length(v),min(v),max(v)]);
  end;

