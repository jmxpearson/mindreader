warning('off','MATLAB:dispatcher:InexactMatch');
Screen('Preference', 'SkipSyncTests',2); %disables all testing -- use only if ms timing is not at all an issue
Screen('Preference','VisualDebugLevel', 0);
Screen('Preference', 'SuppressAllWarnings', 1);
Screen('CloseAll')
HideCursor; % turn off mouse cursor
% InitializeMatlabOpenGL([],[],1);
ListenChar(2); %keeps keyboard input from going to Matlab window

%which screen do we display to?
which_screen=1;

%open window
[win_ptr, screenRect] = Screen('OpenWindow',which_screen,[0 0 0],[],32);

%set font parameters
Screen(win_ptr,'TextFont','Helvetica');
Screen(win_ptr,'TextSize',36);

WaitSecs(1); %for some reason, PTB screws up Screen redraw 
%the first time we use pause, so do it here