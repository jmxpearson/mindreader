%record data
% data(trialnum).result = result;
% data(trialnum).onset=onset;
% data(trialnum).rt=rt;
% data(trialnum).pts=state.pts;
% data(trialnum).is_nogo=is_nogo;
% data(trialnum).correct=correct;
data = [data, state];

save(fname,'data','pars');