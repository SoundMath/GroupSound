function [q11, q12, q21, q22] = quads(N, DISPLAY)
% Generate numbered quadrants scene.
%
% HISTORY
%   2004.04.26 & William DeMeo & initial file
%   2004.04.29 & William DeMeo & minor mods
%
% SEE ALSO
%   ex_10_7, fig_1077, rt1.m, ee_22.m
%

if nargin < 2, DISPLAY=0; end;
n=N/2;          %                 => n = 32,  64, 128
hn=n/2;         %                 => hn= 16,  32,  64  ("half n")
qn=n/4;         %                 => qn=  8,  16,  32  ("quarter n") 
                %    
                %     |<---------------------- N ---------------------->|
                %      _________________________________________________
                %     |                   (q11)|                   (q12)|
                %     |                        |                        |
                %     |         111            |       2222222222       |
                %     |           1            |                2       |
                %     |           1            |                2       |
                %     |           1            |       2222222222       |
                %     |           1            |       2                |
                %     |           1            |       2                |
                %     |      11111111111       |       2222222222       |
                %     |                        |                        |
                %     |<---------------------- | ---------------------->|
                %     |                   (q21)|                   (q22)|
                %     |      3333333333        |      4      4          |
                %     |      3        3        |      4      4          |
                %     |               3        |      4      4          |
                %     |         3333333        |      4444444444        |
                %     |               3        |             4          |
                %     |               3        |             4          |
                %     |               3        |             4          |
                %     |      3333333333        |             4          |
                %     |________________________|________________________|
                %     |<---------------------- N ---------------------->|
                %      <---------- n --------->|
                %      <----hn---->|
                %      <-qn->|

q11=zeros(n); q12=zeros(n);
q21=zeros(n); q22=zeros(n);

n30 = (-3:0);        % n30 = [-3 -2 -1 0]
iqn = (1:qn);        % e.g.  iqn = 1:8
ihn = (1:hn);        % e.g.  ihn = 1:16

% set relative magnitudes here:
one=1; two=1; three=1; four=1;

% q11 (first quadrant)
q11(qn, n30+hn) = one;  % left side of the 4
q11(hn+qn, ihn+qn)=one; % bottom of the 1
q11(ihn+qn, hn)=one;     % middle of the 4

% q12 (second quadrant)
q12(qn:qn+4,qn+1)=two;  % mark
q12(qn,ihn+qn)=two;     % top of the 2
q12(iqn+qn,hn+qn)=two;  % right side of the 2
q12(hn,ihn+qn)=two;     % middle of the 2
q12(iqn+hn,qn+1)=two;   % left side of the 2
q12(hn+qn,ihn+qn)=two;  % foot of the 2

% q21 (third quadrant)
q21(qn:qn+4,qn+1)=three;  % mark
q21(qn,ihn+qn)=three;     % top of the 3
q21(hn,iqn+hn)=three;     % middle of the 3
q21(hn+qn,ihn+qn)=three;  % foot of the 3
q21(ihn+qn, hn+qn)=three; % right side of the 3

% q22 (fourth quadrant)
q22(ihn+qn, hn+qn/2)=four; % right side of the 4
q22(iqn+qn, qn) = four;    % left side of the 4
q22(hn,ihn+qn)=four;       % middle of the 4

%gg = [q11 q12; q21 q22];

if DISPLAY,
%  subplot(2,2,1),imagesc(q11); xlabel('q11');  axis image
%  subplot(2,2,2),imagesc(q12); xlabel('q12');  axis image
%  subplot(2,2,3),imagesc(q21); xlabel('q21');  axis image
%  subplot(2,2,4),imagesc(q22); xlabel('q22');  axis image
  imagesc(gg); xlabel('gg');
  axis image
end;

