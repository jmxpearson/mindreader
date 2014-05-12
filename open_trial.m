%open_trial.m
%perform basic bookkeeping before trial starts

%basic bookkeeping, increment trial number
result = '';
trialnum = trialnum+1;

setup_state

% prepare to run trial
keep_waiting = 1;
trial_start_time = GetSecs;
mark_event('trial_start',plx,1,ni);