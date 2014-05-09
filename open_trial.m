%open_trial.m
%perform basic bookkeeping before trial starts

%basic bookkeeping, increment trial number
result='';
trialnum=trialnum+1;
pts=0; %points on this trial

% set up geometry
% save in state struct

% get trial type
state.trial_type = trial_type(trialnum); %which target

% prepare to run trial
keep_waiting=1;
trial_start_time=GetSecs;
data(trialnum).trial_start_time=trial_start_time;
mark_event('trial_start',plx,1,ni);

%paint screen
%paint_screen(win_ptr,state,0)