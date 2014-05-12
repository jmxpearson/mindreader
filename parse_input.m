%parse_input.m

%which target was chosen?
if has_input
    switch this_key
        case {Lkey, Rkey, Jtrig}
            state.pushed=1;
            mark_event('input',plx,3);
        case stopkey
            state.pushed=-1;
        otherwise
            state.pushed=888;
    end
    
    %now parse input
    switch state.pushed
        case 1
            state.selection = state.highlight;
        case -1
            if continue_running
                disp('esc pressed while waiting for selection')
            end
            result='aborted';
            keep_waiting=0;
            continue_running=0;
    end
    
end