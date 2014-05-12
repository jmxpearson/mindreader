% setup_state.m
% save variables needed to specify trial parameters in the state structure
% for future display

% get trial type
state.trial_type = trial_type(trialnum); 
state.trial_text = 'Select';

% order in which we highlight items
state.option_order = Shuffle(1:num_options);

% set no option highlighted
state.highlight = 0;  % number of option highlighted
state.target = randi(num_options);  % random option will serve as target
state.index = 0;  % place in sequence of option_order