function y=conv2sdp(f,g,gp)
% 2-D generalized convolution.
%
% INPUT
%   f & NxN2 array
%   g & NxN2 array
%   gp & (int) indicates which group to use.
%
% OUTPUT
%   y & NxN2 array storing 2-D convolution product C(f)g.
%
% REMARKS
%   o  This is a modified version of Myoung An's Matlab program CNNV2.  
%
%   o  "Ordinary" convolution is specified with third argument gp==1.
%      Generalized convolutions have gp==2, or 3, or 4, and for these 
%      we assume the N x N2 arrays, f and g, are both shaped like this:
%
%            ------- N2 -------
%           |                 |
%           N  NxN      NxN   N
%           |                 |
%            ------- N2 -------
% 
%      where N2 = 2*N; that is, f has 2 sub-arrays, each of size NxN; 
%      same goes for g.
%
% See also: cn_2
%
% HISTORY
%   2002.07.05 & Myoung An     & original program (named cnnv2)
%   2004.03.23 & William DeMeo & docs, comments, minor mods/additions
%
% REFERENCES
% [1] Myoung An and Richard Tolimieri, "Group Filters and Image
%     Processing." Psypher Press, 2003.
[N,N2]=size(f);
if (N2~=2*N),
  error("unexpected matrix dimensions; HELP CONV2SDP for more info");
end;
if (gp==1),                           % "ordinary" convolution
    ftf=fft2(f);  
    ftg=fft2(g);
    ftfg=ftf.*ftg;
    y=ifft2(ftfg);
else,                                 % "generalized" convolution
    ftf1=fft2(f(1:N,1:N));
    ftf2=fft2(f(1:N,1+N:N2));
    ftg1=fft2(g(1:N,1:N));
    ftg2=fft2(g(1:N,1+N:N2));
      if (gp==2)                        %(zx=xz, zy=yz)   
        y=[ifft2(ftf1.*ftg1+ftf2.*ftg2) ifft2(ftf1.*ftg2+ftf2.*ftg1)];
      end   
      if (gp==3)             %(z x^k y^l = x^-k y^-l z)
        ff1(1,1)=ftf2(1,1)*ftg2(1,1);
        ff2(1,1)=ftf2(1,1)*ftg1(1,1);
        for k2=2:N
          rk2=N-k2+2;
          ff1(1,k2)=ftf2(1,k2)*ftg2(1,rk2);
          ff2(1,k2)=ftf2(1,k2)*ftg1(1,rk2);
        end
        for k1=2:N
          rk1=N-k1+2;
          ff1(k1,1)=ftf2(k1,1)*ftg2(rk1,1);
          ff2(k1,1)=ftf2(k1,1)*ftg1(rk1,1);
          for k2=2:N
            rk2=N-k2+2;
            ff1(k1,k2)=ftf2(k1,k2)*ftg2(rk1,rk2);
            ff2(k1,k2)=ftf2(k1,k2)*ftg1(rk1,rk2);
          end
        end   
        y=[ifft2(ftf1.*ftg1+ff1) ifft2(ftf1.*ftg2+ff2)];
      end   
      if (gp==4)                 %(z x^k y^l = x^l y^k z)
        y=[ifft2(ftf1.*ftg1+ftf2.*ftg2.') ifft2(ftf1.*ftg2+ftf2.*ftg1.')];
      end   
end;
