% respond_to_input.m

if (state.trial_type == 4) && ...  % "move" condition
    (state.selection ~= 0) && ...  % and we've selected an option
    (state.selection == state.target)  % and we selected the right target
        keep_waiting = 0;
elseif (state.trial_type ~=4) && (state.total_highlights > max_highlights)
    keep_waiting = 0;
end