function paint_screen(window,state)
%draws the output for the task
%window is a ptr to the appropriate window
%state contains screen info

border_rect = 15 * [-1 -1 1 1];
target_rect = 10 * [-1 -1 1 1];

% draw instructions
voffset = 50;
DrawFormattedText(window, ['This trial: ' state.trial_text], 'center', ...
    voffset, [255 255 255]);

% draw numbers
for ind = 1:state.num_options
    DrawFormattedText(window, num2str(ind), state.xcoords(ind), ...
        state.ycoords(ind), [178 34 34]);
end

%highlight target
Screen('FrameRect', window, [150 150 150], state.rects{state.target}...
        + target_rect, 10);

% draw border around specified number
if (state.highlight > 0) && (state.highlight <= state.num_options)
    Screen('FrameRect', window, [178 34 34], state.rects{state.highlight}...
        + border_rect, 10);
end



%flip
Screen(window,'flip');