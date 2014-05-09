%close_trial.m
%end of trial bookkeeping; save data

%save trial data and print result here
% if is_nogo
%     ttype='No Go';
% else
%     ttype='Go';
% end
% out_line=sprintf('Trial %d: Type: %s  Result: %s  RT: %0.3g  Correct: %d  Points: %d',...
%     trialnumdp,ttype,result,rt,correct,pts);
% disp(out_line)

%restore screen


curtime=GetSecs;

%for now, no iti, since outcome period pauses action
mark_event('trial_over',plx,8)

%record data
% data(trialnum).result = result;
% data(trialnum).onset=onset;
% data(trialnum).rt=rt;
% data(trialnum).pts=state.pts;
% data(trialnum).is_nogo=is_nogo;
% data(trialnum).correct=correct;

save(fname,'data','pars');