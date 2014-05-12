function blank_screen(win_ptr)
Screen('FillRect', win_ptr, [0 0 0]);
Screen('Flip', win_ptr);