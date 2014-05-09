Screen('CloseAll') %close screen
if plx
    PL_Close(plx); %close plexon
end
if exist('start_path','var')
    cd(start_path) %return to start directory
end
ListenChar(0) %keyboard input goes back to matlab window