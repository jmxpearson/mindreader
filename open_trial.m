%open_trial.m
%perform basic bookkeeping before trial starts

%basic bookkeeping, increment trial number
trialnum = trialnum+1;

% prepare to run trial
keep_waiting = 1;
trial_start_time = GetSecs;

setup_state

mark_event('trial_start', plx, 1, ni);

paint_screen(win_ptr, state);