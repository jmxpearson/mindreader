%parse_input.m

%which target was chosen?
if has_input
    switch this_key
        case {Lkey, Rkey, Jtrig}
            state.pushed=1;
            mark_event('input', plx, 4);
        case stopkey
            state.pushed=-1;
        otherwise
            state.pushed=888;
    end
    
    %now parse input
    switch state.pushed
        case 1
            if state.readywait  % if we've been waiting to begin
                state.readywait = 0;
            else  % if we're in task proper
                state.selection = state.highlight;
            end
        case -1
            if continue_running
                disp('esc pressed while waiting for selection')
            end
            result='aborted';
            state.readywait = 0;
            keep_waiting=0;
            continue_running=0;
    end
    
end