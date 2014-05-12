%setup_plexon
%allows Matlab to register event timestamps with Plexon for
%electrophysiology

if ~isempty(which('mexPlexDO'))  %test to make sure plexon is here at all
    %try to open communication with plexon server
    %plx is a memory pointer to the Plexon server
    try
        plx=PL_InitClient(0);
        ni =[];
    catch q
        plx=0;

        %if we're not using the MAP to record, prepare to send TTL pulses out
        %through the DIO

        % PlexDO initialization - must be called before any other PlexDO function.
        [numDOCards, deviceNumbers, numBits, numLines] = PL_DOGetDigitalOutputInfo;
        ni=deviceNumbers(1);

        %first test to see if the nidaq is already initialized this session
        %getting a zero result (success) means the nidaq is already initialized, and
        %trying to initialize again will screw everything up (in that case
        %restart matlab)
        tester = PL_DOClearAllBits(ni); 
        if tester~=0
            % Initialize the first available device.  The second parameter should be 1 
            % if the device is also being used by the MAP, otherwise 0.
            tester = PL_DOInitDevice(ni, 0);
        end

        % Set all output bits to 0.
        tester = PL_DOClearAllBits(ni);
    end
else
    disp('No Plexon or NI-DAQ found. Event pulses will not be sent');
    %baseline case: no Plexon, no NI-DAQ
    plx = 0;
    ni = [];
end