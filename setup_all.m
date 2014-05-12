%initialize data structure for recording
global data state;
data = [];

% add subdirectories to path
toppath = fileparts(which('mindreader'));
addpath([toppath filesep 'setup']);
addpath([toppath filesep 'helpers']);

%parse inputs
parse_inits

%re-seed random number generator
setup_rng
    
%setup joystick
setup_joystick

%setup plexon
setup_plexon

%PTB settings (it tends to complain on PCs)
setup_ptb

%setup pars
setup_pars

%setup geometry
setup_geometry

%bind keys
setup_keys

%set up data file
setup_data_file