function mark_event(eventname, plx, channel, ni)
% marks an event and timestamp within the state structure for the current
% trial
% in addition, sends a TTL pulse to Plexon (if present) on the given
% channel
% if Plexon not present, but the NI-DAQ is, send ONLY events on channel 1
% as 5ms TTL pulses

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
elseif ni && (channel == 1)
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