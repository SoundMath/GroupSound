function [MaxC,MaxP]=WHMP(x,MAXITERS,TOLERANCE,OPT,DEBUG,DISP)
% WHMP.m 
% Matlab function for Weyl-Heisenberg Matching Pursuit (WHMP) algorithm.
%
% Inputs
%    x       analytic signal with which to correlate atoms;
%              signal length must be a power of 2
%    MAXITERS  (default 20) stop after MAXITERS iterations, even
%              if TOLERANCE is not reached.
%    TOLERANCE (default 0.05) stop after relative error is less 
%              than TOLERANCE (i.e. |Rx|/|x| < TOLERANCE)
%    OPT       (default 0) OPT=1 ==> use extra oversampling optimization
%    DEBUG     (default 0) DEBUG=1 ==> print extra debugging information
%    DISP      (default 0) DISP>0 ==> display plots of max atoms and
%                          signal estimate and estimate error starting with
%                          figure number DISP
%
% Outputs
%    MaxC   1xMAXITERS vector where MaxC(i) is the correlation of the
%           signal remainder with max correl atom at iteration i.
%    MaxP   MAXITERSx4 array of atom parameters. MaxP(i,:) are the 4
%           parameters specifying the the atoms having correlation
%           MaxC(i) with the signal remainder at step i.
%
% Notes
%    The total number of atoms in the dictionary is computed as follows:
%     (K+2)*4*N = (K+2)*2^(K+3) = 2^(K+3)    Diracs
%                               + 2^(K+3)*K  Gabor atoms
%                               + 2^(K+3)    Complex exponentials
%
%    This version does not consider whether the signal is real or
%    complex and, therefore, the resulting decomposition comprises
%    complex atoms. See MZRealMP for special handling of real signals.
%
% Other Notes
%    Now that this program has been tested and seems to work, all
%    major debugging conditionals have been removed in the interest of
%    efficiency.  See WHMP_DEBUG.m
%
% See also: IP.m, WHip.m, AtomIP.m
%
% Author: William DeMeo <williamdemeo@yahoo.com>
% Date: 2002.02.20
% (c) 2002, William DeMeo
% All rights reserved


if nargin < 1, 
  disp('USAGE: WHMP(x,[MAXITERS, [TOL, [DEBUG, [DISP]]]])')
  disp('       you must at least input an analytic signal');
  exit(1);
end;  % we used to create a synthetic signal here (see oldsignal.m)

if nargin < 2, MAXITERS = 20; end;     % max number of iterations

if nargin < 3, TOLERANCE = 0.05; end;  % stop when |Rx|/|x| < TOLERANCE

if nargin < 4, OPT=0; end;

if nargin < 5, DEBUG=0; end;

if nargin < 6, DISP=0; end;

N=length(x); K=log2(N)-1; 
if(pow2(K+1) ~= N), error('input signal length must be a power of 2'); end;

if(DEBUG), disp('WHMP: STEP I. max <f,g>'); end;

MaxP=zeros(MAXITERS,3); % store all max parameters
MaxC=zeros(1,MAXITERS); % store all max correl values
RxoxE=zeros(1,MAXITERS);% est. norm of remainder at each iter.

% compute correlations C (inner prods of signal with atoms)
% and corresponding P (atom parameters)
[C, P] = IP(x,DEBUG);  % inner products: <x,g> = <signal,atom>

[maxC, maxCi] = max(abs(C));  

MaxC(1) = C(maxCi);     % correlation having max absolute value

MaxP(1,:) = P(maxCi,:); % parameters of atom yielding max corr.

if(DEBUG),
  DisplayParams('WHMP:            MaxP(1,:) = ',MaxP(1,:),3);
  DisplayParams('WHMP:            MaxC(1) = ',MaxC(1),1);
end;

%% OPTIMIZE:
cntopt = 0;  % on how many iterations was optimization useful
if(OPT),
  s = MaxP(1,1);
  if( s > 0 & s < K+1), % only optimize for WH atoms (not Diracs or exps)

    L1 = pow2(s-1); M2 = pow2(K-s); % original oversampling rates

    if(s > 2),
      if(DEBUG), disp('WHMP: >>> optimizing translation rate...'); end;
      L1 = L1/2;    % new oversampling translation rate: L1 = pow2(s-2)
    end;

    if(s < K-1),
      if(DEBUG), disp('WHMP: >>> optimizing modulation rate...'); end;
      M2 = M2/2;    % new oversampling modulation rate: M2 = pow2(K-s-2)
    end;

    if(s > 2 | s < K-1),

      % Copt is an M1 x L2 matrix of inner products, 
      Copt = WHip(x,s,L1,M2); % where L1*M1 = L2*M2 = N

      [maxCopt,rowindxs]=max(abs(Copt));  % column maxima and row indices
      [maxCopt,y2] = max(maxCopt) ;       % max of column maxima and col index
      y1 = rowindxs(y2);            % index of max row

      if(maxCopt > maxC),
	disp('WHMP: >>>>>>>>>> MORE OVERSAMPLING IS USEFUL');
	disp(sprintf('WHMP: >>>>>>>>>> maxCopt = %f, maxC = %f',maxCopt,maxC));
	MaxP(1,2) = (y1-1)*L1;    % translation of new max atom
	MaxP(1,3) = (y2-1)*M2;    % modulation of new max atom
	MaxC(1) = Copt(y1,y2);

	if(DEBUG),
	  cntopt = cntopt+1;
	  DisplayParams('WHMP: (post opt) MaxP(1,:) = ',MaxP(1,:),3);
	  DisplayParams('WHMP:              MaxC(1) = ',MaxC(1),1);
	end;
    
      end;
  
    end;
  end;
end;


%% Relative norm of estimated remainder %%
normx = norm(x);               % equiv: normx = sqrt(x*x');
normx2 = normx^2; 
mcmc = MaxC(1)*conj(MaxC(1));  % equiv: abs(MaxC(1))^2;

% |x|^2 - |<x,gmax>|^2
normDiff = normx2 - mcmc;      

% |Rx|
normRx = sqrt(abs(normDiff));  

% |Rx|/|x|
RxoxE(1) = normRx/normx;       % relative remainder

if(DEBUG), DisplayParams('WHMP: est. |Rx|/|x| = ',RxoxE(1),1); end;

if(DEBUG),
  disp('WHMP:        ...STEP I. complete.');
  disp('------------------------------------------------------------------');
  disp('WHMP: Step II. Update and Iterate');
end; 

n=0; 

while n < MAXITERS,

  n = n+1;

  if(DEBUG), 
    disp(sprintf('------------------------ ITERATION %d ------------------------',n)); 
    disp('WHMP: calling IP routine...');    tt = cputime;
  end;

  % compute 1 x NAtoms vector of inner products
  ip = IP(K,MaxP(n,1),MaxP(n,2),MaxP(n,3));  

  if(DEBUG), 
    iptime = cputime-tt;
    disp(sprintf('WHMP: ...IP done in %f seconds',iptime)); 
  end;

  % update correlations
  C = C - MaxC(n) .* ip;          

  % find atom with maximum correlation
  [maxC,maxCi] = max(abs(C)); 
  MaxC(n+1) = C(maxCi);     % correlation with max absolute value
  MaxP(n+1,:) = P(maxCi,:); % parameters of atom yielding max corr.

  if(DEBUG), 
    DisplayParams('WHMP:            MaxP(n+1,:) = ',MaxP(n+1,:),3);
    DisplayParams('WHMP:            MaxC(n+1) = ',MaxC(n+1),1);
  end;

  %% OPTIMIZE:
  if(OPT),
    s = MaxP(n+1,1);
    if( s > 0 & s < K+1), % only optimize for WH atoms (not Diracs or exps)

      L1 = pow2(s-1); M2 = pow2(K-s); % original oversampling rates

      if(s > 2),
	if(DEBUG), disp('WHMP: >>> optimizing translation rate...'); end;
	L1 = L1/2;    % new oversampling translation rate: L1 = pow2(s-2)
      end;
      % if(s>3), L1=L1/2; end;  % for even finer oversampling: L1=pow2(s-3)

      if(s < K-1),
	if(DEBUG), disp('WHMP: >>> optimizing modulation rate...'); end;
	M2 = M2/2;    % new oversampling modulation rate: M2 = pow2(K-s-2)
      end;
      % if(s<K-2), M2=M2/2; end; % for even finer oversampling: M2=pow2(K-s-3) 

      if(s > 2 | s < K-1),

	% Copt is an M1 x L2 matrix of inner products, 
	if(DEBUG), disp('WHMP: >>> computing <x,g> with finer oversampling'); end;
      
	Copt = WHip(x,s,L1,M2); % where L1*M1 = L2*M2 = N

	if(DEBUG), 
	  disp('WHMP: >>> computing <Rx,g> = <x,g> - sum<Rx,gm><gm,g>'); tt=cputime;
	end;

	%% This is what takes the longest, but it's only avoidable if we're 
	%% willing to store the actual remainder vector Rx for each iteration.
	for nn=1:n,
	  gn = WHatom(K,MaxP(nn,:));
	  ips = WHip(gn,s,L1,M2);
	  Copt = Copt - MaxC(nn).*ips;
	end;

	if(DEBUG), tt=cputime-tt; disp(sprintf('WHMP: ...done in %f seconds',tt)); end;

	[maxCopt,rowindxs]=max(abs(Copt));  % column maxima and row indices
	[maxCopt,y2] = max(maxCopt) ;       % max of column maxima and col index
	y1 = rowindxs(y2);            % index of max row

	if(maxCopt > maxC),
	  disp('WHMP: >>>>>>>>>> MORE OVERSAMPLING IS USEFUL');
	  disp(sprintf('WHMP: >>>>>>>>>> maxCopt = %f, maxC = %f',maxCopt,maxC));
	  MaxP(n+1,2) = (y1-1)*L1;    % translation of new max atom
	  MaxP(n+1,3) = (y2-1)*M2;    % modulation of new max atom
	  MaxC(n+1) = Copt(y1,y2);
	  if(DEBUG),
	    cntopt = cntopt+1;
	    DisplayParams('WHMP: (post opt) MaxP(n+1,:) = ',MaxP(n+1,:),3);
	    DisplayParams('WHMP:            MaxC(n+1) = ',MaxC(n+1),1);
	  end;
	end;
      
      end; % if(s > 2 | s < K-1),
    end; % if(s > 1 & s < K),
  
  end;  % if(OPT)

  if(DEBUG & OPT),
    mcmc = maxC^2;
    normDiff = normRx^2 - mcmc;
    disp(sprintf('WHMP: (pre opt)  |Rx|^2 - |<Rx,g>|^2 = %d',normDiff));
  end;

  %mcmc = MaxC(n+1)*conj(MaxC(n+1)); 
  mcmc = abs(MaxC(n+1))^2;

  % |Rx|^2 - |<Rx,g>|^2
  normDiff = normRx^2 - mcmc; 

  if(DEBUG),
    disp(sprintf('WHMP:            |Rx|^2 - |<Rx,g>|^2 = %d',normDiff));
  end;

  % |Rx|
  normRx = sqrt(abs(normDiff));   
  
  % |Rx|/|x|  
  RxoxE(n+1) = normRx/normx;

  if(normDiff < 0),
    warning('|correlation| > |remainder|');
    warning(sprintf('%g = |<Rx,g>| > |Rx| = %g',abs(MaxC(n+1)),normRx)); 
  end;

  if(DEBUG)
    DisplayParams('WHMP:                  est. |Rx|/|x| = ',RxoxE(n+1),1);    
    disp(sprintf('WHMP: iteration %d complete. hit any key...',n));
    pause;
  end;

  if( RxoxE(n+1) < TOLERANCE ),
    MaxC = MaxC(1:n+1);  MaxP = MaxP(1:n+1,:);  RxoxE = RxoxE(1:n+1); 
%    if(DEBUG),
      disp(sprintf('tol. reached at iteration %d:  |Rx|/|x| < %1.6f',...
	  n+1,TOLERANCE));
%    end;
    n = MAXITERS; % terminate while loop
  end;

end;

if(OPT & DEBUG),
  disp(sprintf('WHMP: Optimization was useful on %d iterations',cntopt));
end;

if(DISP), xEst = Atoms2Sig(K,MaxP,MaxC); end; % construct est signal
x = x(:);  % shape as column
if(DISP),
  figure(DISP); clf; % plot: signal, estimated signal, and error
  subplot(3,1,1); plot(real(x)); grid;  axis([0,N,4.5,5]);%axis([0,512,-1.0,1.0]);
  title('actual signal');
  subplot(3,1,2); plot(real(xEst)); grid; axis([0,N,4.5,5]);%axis([0,512,-1.0,1.0]);
  title('estimated signal');
  subplot(3,1,3); plot(real(x)-real(xEst));grid; axis([0,N,-.2,.2]);
  title('error');
  figure(DISP+1); clf; % plot: signal, estimated signal, and error
  subplot(3,1,1); plot(angle(x));
  title('actual angle');
  subplot(3,1,2); plot(angle(xEst));
  title('estimated angle');
  subplot(3,1,3); plot(angle(x)-angle(xEst));
  title('error');
  figure(DISP+2); clf; % norm of error at each iteration
  if(DEBUG>1),
    subplot(2,1,1);stem(real(RxoxT));
    subplot(2,1,2);stem(real(RxoxE));
  else,
    stem(real(RxoxE));
  end;
end;

if(DEBUG),
  disp('Next step:  >> [WVE,WVI] = WVEnergy(sig,MaxC,MaxP,0,DEBUG,DISP);');
end;

%%% Other display/testing code %%%
%% plot a few of the atoms used
%atom1 = Atoms2Sig(K,P(1,:),C(1)); atom2 = Atoms2Sig(K,P(2,:),C(2));
%atomM = Atoms2Sig(K,P(M,:),C(M));
%figure(3); clf;
%subplot(3,1,1); plot(real(atom1));grid; axis([0,oneper,-1.0,1.0]);
%subplot(3,1,2); plot(real(atom2));grid; axis([0,oneper,-1.0,1.0]);
%subplot(3,1,3); plot(real(atomM));grid; axis([0,oneper,-1.0,1.0]);

% alternate version of IP routine
%[MaxCB, MaxPB] = MaxIP(x,DEBUG);  
%disp('WHMP: testing max from MaxIP routine...');
%DisplayParams('WHMP: MaxPB = ',MaxPB,3);
%gmax = WHatom(K,MaxPB,2); xg = x*gmax';
%if(abs(xg)>abs(MaxCB)+10*eps),
%  reMC = real(MaxCB);  imMC = imag(MaxCB);
%  reCt = real(xg);  imCt = imag(xg);
%  error(sprintf('WHMP: MaxCB=(%d,%d) ~= xg=(%d,%d)',reMC,imMC,reCt,imCt));
%else,  disp('WHMP:  ...test passed'); end;

% Author: William DeMeo <william.demeo@verizon.net>
% Date: 2001 May 4
% Copyright (c) 2001, William DeMeo
% This is Copyrighted Material
% For Copying permissions see COPYING.m
%%  

%% OLD TESTING CODE:

%if(DEBUG>1),
%  disp('WHMP: .......Extra Tests......');
%  %%% For now, compute actual atom (REMOVE FROM FINAL VERSION)
%  gmax = WHatom(K,MaxP(1,:),1); xg = x*gmax';
%  disp('WHMP:     max inner product test...');
%  DisplayParams('WHMP:        true <x,g> = ', xg, 1);
%  DisplayParams('WHMP:       est MaxC(1) = ', MaxC(1), 1);
%  DisplayParams('WHMP:      true |<x,g>| = ',abs(xg),1);
%  srmcmc = sqrt(mcmc);
%  DisplayParams('WHMP:     est |MaxC(1)| = ', srmcmc, 1);
%  normgt = norm(gmax);
%  if(srmcmc > normx*normgt), 
%    disp(sprintf('WHMP:     |x| = %d, |g| = %d, |x||g| = %d', normx, normgt, normx*normgt));
%    disp(sprintf('WHMP:     %d = |MaxC(1)| > |x||g| = %d:',srmcmc,normx*normgt));
%    disp(sprintf('WHMP:     MUST HAVE  |<x,g>| <= |x||g|',srmcmc,normx*normgt));
%    error('WHMP:     ...test failed');
%  else, disp('WHMP:     ...correlation estimate okay.'); end;
%
%  %%% For now, store actual remainder (REMOVE FROM FINAL VERSION)
%  Rx = x - MaxC(1).*gmax; Rxg = Rx*gmax';
%  DisplayParams('WHMP:     <Rx,g> = ',Rxg,1);
%  if(abs(Rxg)>1000*eps),
%    disp('WHMP:     MUST HAVE  <Rx,g> == 0');
%    error('WHMP:     ...test failed');
%  else, disp('WHMP:     ...remainder okay'); end;
%  
%
%  disp(sprintf('WHMP:     |Rx| = sqrt(|x|^2 -|<x,g>|^2) = sqrt(%d) = %d',normDiff,normRx));
%
%  if(normDiff < 0),  
%    warning('WARNING:     normDiff < 0 because |x|^2 < |<x,g>|^2 ');
%    warning(sprintf('WHMP:     |x| = %f < %f = |MaxC(1)|',normx, abs(MaxC(1))));  
%  end;
%  disp('WHMP: .......Extra Tests Complete......');
%end;
%
%

%  if(DEBUG>1),
%    %%% For now, store actual remainder (REMOVE FROM FINAL VERSION)
%    %%    Rx = Rx - MaxC(n+1).*gmax;
%    Rx = Rx - Rxg.*gmax; RxoxT(n+1) = norm(Rx)/normx;
%    % Test that <Rx,gmax>, for new Rx, is 0
%    Rxg = Rx*gmax'; 
%    if(norm(Rxg)> 1000*eps),
%      DisplayParams('WHMP:     <Rx,g> = ',Rxg);
%      error('WHMP:    <Rx,g> ~= 0');
%    end;
%    disp('WHMP: .......Extra Tests Complete......');
%  end;

  %  if(DEBUG>1),
%  disp('WHMP: .......Extra Tests......');
%    %%% Test of Inner Product %%%
%    % For now, compute actual max atom (REMOVE FROM FINAL VERSION)
%    gmaxold = gmax;                  % save old max atom
%    gmax = WHatom(K,MaxP(n+1,:),0);  % get new max atom
%    normgmax = norm(gmax);
%    goldg = gmaxold*gmax'; 
%    ipmax = ip(maxCi); 
%    DisplayParams('WHMP:     ip(maxCi) = ',ipmax,1);
%    DisplayParams('WHMP:      <gold,g> = ',goldg,1);
%    diffip = abs(ipmax - goldg); 
%    TOL = 0.001;
%    if(diffip > TOL),
%      error(sprintf('WHMP:     |ip(%d)-<gold,g>| = %1.10f',maxCi,diffip));
%    else, disp('WHMP:     ...inner product okay'); end;
%
%
%    %%% Test of Correlation Estimate %%%
%    % MaxC(n+1) is our estimate of <Rx,gmax>
%    DisplayParams('WHMP:     MaxC(n+1) = ',MaxC(n+1),1);
%    Rxg = Rx*gmax';
%    DisplayParams('WHMP:     <Rx,gmax> = ',Rxg,1);
%    diff = abs(MaxC(n+1)- Rxg); 
%    TOL = 0.001;
%    if(diff > TOL),
%      error(sprintf('WHMP:     |MaxC(%d)-<Rx,gmax>| = %1.10f',maxCi,diff));
%    else, disp('WHMP:     ...correlation estimate okay'); end;
%  end;
%
%
