% setup_state.m
% save variables needed to specify trial parameters in the state structure
% for future display

% record start time
state.trial_start_time = trial_start_time;

% get trial type
state.trialnum = trialnum;
state.trial_type = trial_type(state.trialnum); 
state.trial_text = type_text{state.trial_type};

% order in which we highlight items
state.option_order = Shuffle(1:num_options);

% set no option highlighted
state.selection = 0;  % no target selected
state.highlight = 0;  % number of option highlighted
state.target = randi(num_options);  % random option will serve as target
state.index = 0;  % place in sequence of option_order
state.total_highlights = 0;  % how many total options have we highlighted