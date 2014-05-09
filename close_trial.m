%close_trial.m
%end of trial bookkeeping; save data

display_results

%restore screen


curtime=GetSecs;

%for now, no iti, since outcome period pauses action
mark_event('trial_over',plx,8)

save_data