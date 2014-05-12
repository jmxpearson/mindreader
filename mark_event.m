function mark_event(eventname, plx, channel, ni)

global state

if ~exist('plx','var')
    plx=0;
end

if ~exist('ni','var')
    ni=[];
end

if plx
    try
        PL_SendUserEvent(plx,channel);
    end
elseif ni
    PL_DOPulseBit(ni, 1, 5); %send a 5ms TTL pulse through the NIDAQ
end

eventtime=GetSecs-state.trial_start_time;

if isfield(state,'ev')
    state.ev{end+1}=eventname;
    state.evt(end+1)=eventtime*1000;
else
    state.ev{1}=eventname;
    state.evt(1)=eventtime*1000;
end
end