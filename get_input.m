% check for keyboard input
[keyIsDown,secs,keyCode] = KbCheck;
pushed=find(keyCode,1);

% if we have a joystick present, check for clicks
if joy_present
    [jx,jy,jz,buttons]=WinJoystickMex(0);
    jdev=jx-jcenter(1);
    if buttons(1)
        jclicked=1;
    else
        jclicked=[];
    end
else
    jclicked=[];
end

if ~isempty(pushed)||~isempty(jclicked)
    %break 'ties' by randomly sorting keypresses and choosing first
    all_in=[pushed(:) ; jclicked(:)];
    all_in=all_in(randperm(numel(all_in)));
    this_key=all_in(1);
    has_input=1;
else
    has_input=0;
end