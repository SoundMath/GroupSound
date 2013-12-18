% test1.m
% Matlab workspace for testing WHopera programs
%
%     1. Diracs, (N atoms)
%     2. K Weyl-Heisenberg systems, (2^(K+3) atoms per system)
%     3. complex exponentials (N atoms)

K = 9;
N = pow2(K+1);
f0 = 55;
f = frequencies(12,1,f0);
% The p-th WH system will start at: k = N + p*pow2(K+3)
% There are pow2(K+3) atoms per system
% Let's sample 6 atoms from each system at pow2(K) intervals:
% 0, pow2(K), pow2(K+1), 3*pow2(K), pow2(K+2), 5*pow2(K)

p = 5;  % system number we want to sample
interval = pow2(K);  % sample interval
startatom = N + (p-1)*pow2(K+3) + 7;
finishatom = startatom + 5*pow2(K);
cnt = 1;
for k= startatom:interval:finishatom;
  figure(cnt);
  disp(sprintf('k = %d',k)); 
  DisplayParams('P(k,:) = ',P(k,:),3);
  WHatom(K,P(k,1),P(k,2),P(k,3),1);
  cnt = cnt+1;
end;

if(0),
cnt = 1;
for k= 16897:10:16947
  figure(cnt);
  disp(sprintf('k = %d',k)); 
  DisplayParams('P(k,:) = ',P(k,:),3);
  WHatom(K,P(k,1),P(k,2),P(k,3),1);   
  cnt = cnt+1;
end;

end;
