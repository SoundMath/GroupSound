%  startup.m 
%
%  Put this file in ~/.octaverc to initialize Octave path.
%  Put this file in ~/matlab/startup.m to initialize Matlab path.
%  
  disp('---------------------------------------------------');
  disp(' ');
  disp(' __________________________________________/\  ________');
  disp(' GroupSound Matlab/Octave path setup...      \/        ');
  disp('                                                       ');
  disp(' We assume your git repo lives in HOME/git/GroupSound. ');
  disp(' If not, you must edit the startup.m file.             ');
  disp('                                                       ');
  
  MATLABROOT = fullfile(getenv('HOME'), 'git', 'GroupSound', 'src', 'Matlab');
  disp('    Appending the following to path:');

  % (util)
  dir2add = fullfile(MATLABROOT, 'util');
  if(exist(dir2add)==7),
    disp(sprintf('      %s', dir2add));  addpath(dir2add);
  end;

  % "Group Filters and Image Processing," by An & Tolimieri
  dir2add = fullfile(MATLABROOT, 'GFIP', 'TrnsfFltrsScripts');
  if(exist(dir2add)==7), 
    disp(sprintf('      %s', dir2add));  addpath(dir2add);
  end;

  dir2add = fullfile(MATLABROOT, 'GFIP', 'Documented');
  if(exist(dir2add)==7),
    disp(sprintf('      %s', dir2add));  addpath(dir2add);
  end;


  disp(' ');
  disp('_______________________GroupSound: v.0.01 2013.12.19__');

