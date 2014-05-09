function mindreader(varargin)
%runs the mind-reading task
%varargin can contain the following string-argument pairs
%outfile is a character string forming the stub of the output file

try

%run setup scripts
setup_all

%main task loop
while continue_running   
    open_trial %set up trial variables
    
    while keep_waiting
        handle_animation %code related to drawing screen
        
        check_rt %check to see if we've exceeded allotted response time
        
        get_input %get input from keyboard, joystick, etc.
        
        handle_input %go figure out whether something interesting happened
        
        run_outcome %take care of screen animation, outcome, and saving results
        
        esc_check %did we try to exit?
    end

    close_trial %save variables, increment trial number
    
    esc_check %did we try to exit?
    
end %of main task loop

close_shop %housekeeping before we exit

catch q
    close_shop %housekeeping before we exit
    keyboard %pause for user input
end 

end