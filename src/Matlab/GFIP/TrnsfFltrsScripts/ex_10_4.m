% Examples of section 10.4 (page 215) of [1] (figs 10.4.1--10.4.6)
% 
% HISTORY
%   2004.03.29 & William DeMeo & initial file
%   2004.04.29 & William DeMeo & minor mods
%
% REFERENCES
%   [1] An and Tolimieri, "Group Filters and Image Processing"
%
% SEE ALSO
%   fline.m 

clear;

%% GFIP figures, page 215
figure(1); clf; colormap(gray);
% figure 10.4.1
N=64; 
a=1; b=0; 
ff=fline(N,a,b);
subplot(2,2,1),imagesc(ff), title('L(1,0)');
a=0; b=1; 
ff=fline(N, a, b);
subplot(2,2,2),imagesc(ff), title('L(0,1)');
% figures 10.4.2 and 10.4.3
a=1; b=1;
ff=fline(N,a,b);
subplot(2,2,3),imagesc(ff), title('L(1,1)');
a=1; b=2;
ff=fline(N,a,b);
subplot(2,2,4),imagesc(ff), title('L(1,2)');

%% GFIP figures, pages 216--218
figure(2); clf; colormap(gray);

% figure 10.4.4
a=1; b=1; c=0; d=20;
ff=fline(N, a, b, c, d);
subplot(2,2,1),imagesc(ff), title('(0,20) + L(1,1)');

% figure 10.4.5
a=1; b=-1;
ff=fline(N, a, b);
subplot(2,2,2),imagesc(ff), title('L(1,-1)');

% figure 10.4.6
N=64; a=1; b=-2;
ff=fline(N, a, b);
subplot(2,2,3),imagesc(ff), title('L(1,-2)');


