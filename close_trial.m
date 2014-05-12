%close_trial.m
%end of trial bookkeeping; save data

display_results

save_data

%blank screen and start inter-trial-interval
blank_screen(win_ptr)
mark_event('trial_over', plx, 2)
WaitSecs(iti);