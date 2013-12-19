%  startup.m 
%
%  Put this file in ~/.octaverc  to initialize Octave path.
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
    addpath(dir2add,1);
  end;

  % "Group Filters and Image Processing," by An & Tolimieri
  dir2add = fullfile(MATLABROOT, 'GFIP', 'TrnsfFltrsScripts');
  if(exist(dir2add)==7), addpath(dir2add); end;

  dir2add = fullfile(MATLABROOT, 'GFIP', 'Documented');
  if(exist(dir2add)==7), addpath(dir2add); end;


  disp(' ');
  disp('_______________________GroupSound: v.0.01 2013.12.19__');

  % The following is not being used now, but I left it in because 
  % it shows an alternative way to add directories to the Octave path.
  if 0,
    dir2add = fullfile(Toolbox, 'stsa');
    if(exist(dir2add)==7),
      addpath( ...
          [Toolbox filesep 'stsa'], ...
          [Toolbox filesep 'stsa' filesep 'demos'], ...
          [Toolbox filesep 'stsa' filesep 'display'], ...
          [Toolbox filesep 'stsa' filesep 'eval'], ...
          [Toolbox filesep 'stsa' filesep 'fileio'], ...
          [Toolbox filesep 'stsa' filesep 'gaintabs'], ...
          [Toolbox filesep 'stsa' filesep 'noise'], ...
          [Toolbox filesep 'stsa' filesep 'pcptmdls'], ...
          [Toolbox filesep 'stsa' filesep 'postproc'], ...
          [Toolbox filesep 'stsa' filesep 'preproc'], ...
          [Toolbox filesep 'stsa' filesep 'specmod'], ...
          [Toolbox filesep 'stsa' filesep 'stft'], ...
          [Toolbox filesep 'stsa' filesep 'suprules'], ...
          [Toolbox filesep 'stsa' filesep 'suprules' filesep 'base']);
    end;
  end;