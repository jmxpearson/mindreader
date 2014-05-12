%setup_pars.m

%pre-configure task parameters; save all relevant parameters to the pars
%structure for saving to disk

%%%%%%%%%%%%%%%%% trial parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
trialnum=0;
trialnumdp=0;
numtrials=5000;
continue_running=1; %loop parameter

if exist('invars','var')
    numtrials=invars.numtrials;
end

%%%%%%%%%%%%%%%% task parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%
num_options = 5;  % number of potential choices
num_types = 4;  % number of trial types
type_text = {'Just watch', 'Think "stop"', 'Pretend to select', ...
    'Select the option'};  % instruction text for each trial type
block_counts = [4 4 4 4];  % counts of each trial type in each block
trial_type = block_randomize(block_counts, numtrials);  % list of type of each trial

%%%%%%%%%%%%%%%% timing parameters %%%%%%%%%%%%%%%%%%%%%%%%%%
iti = 1;  % inter-trial interval
resp_time = 1.5;  % time allowed for responses while numbers highlighted
max_highlights = 2 * num_options;  % number of options to highlight before moving on

%%%%%%%%%%% bundle things that don't change into pars for saving %%%%%%%%%%
pars.num_options = num_options;
pars.num_types = num_types;
pars.type_text = type_text;
pars.block_counts = block_counts;
pars.trial_type = trial_type;
pars.iti = iti;
pars.resp_time = resp_time;
pars.max_highlights = max_highlights;
