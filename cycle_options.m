% handles process of sequentially highlighting options
if (state.index == 0) || (GetSecs - highlight_on > resp_time)
   highlight_on = GetSecs;
   state.total_highlights = state.total_highlights + 1;
   state.index = mod(state.total_highlights, num_options);
   if state.index == 0
       state.index = num_options;
   end
   state.highlight = state.option_order(state.index);
   
   mark_event('highlight', plx, 4);
   paint_screen(win_ptr, state);
end