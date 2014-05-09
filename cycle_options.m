% handles process of sequentially highlighting options
if (state.index == 0) || (GetSecs - highlight_on > resp_time)
   highlight_on = GetSecs;
   state.index = mod(state.index + 1, num_options);
   if state.index == 0
       state.index = num_options;
   end
   state.highlight = state.option_order(state.index);
   
   paint_screen(win_ptr, state);
end