function paint_screen(window,state)
%draws the output for the task
%window is a ptr to the appropriate window
%state contains screen info

border_rect = 15 * [-1 -1 1 1];

% draw numbers
for ind = 1:state.num_options
    DrawFormattedText(window, num2str(ind), state.xcoords(ind), ...
        state.ycoords(ind), [178 34 34]);
end

% draw border around specified number
if (state.highlight > 0) && (state.highlight <= state.num_options)
    Screen('FrameRect', window, [178 34 34], state.rects{state.highlight}...
        + border_rect, 10);
end

%flip
Screen(window,'flip');