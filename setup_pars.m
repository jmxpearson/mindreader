%setup_pars.m

%pre-configure task parameters; save all relevant parameters to the pars
%structure for saving to disk

%%%%%%%%%%%%%%%%% trial parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
trialnum=0;
trialnumdp=0;
numtrials=50000;
continue_running=1; %loop parameter

if exist('invars','var')
    numtrials=invars.numtrials;
end

%%%%%%%%%%%%%%%% sound parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%sound files go here
setup_audio
[cashsnd,~]=wavread('cash.wav');
[firesnd,~]=wavread('bbhit.wav');
[buzzsnd,~]=wavread('buzz.wav');

%%%%%%%%%%%%%%%% image textures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
noimg=imread('rfrog2.jpg');
norect=size(noimg);
norect=[0 0 norect([2 1])]; %images have x and y dimensions flipped
notxt=Screen('MakeTexture',win_ptr,noimg);

goimg=imread('gfrog2.jpg');
gorect=size(goimg);
gorect=[0 0 gorect([2 1])]; %images have x and y dimensions flipped
gotxt=Screen('MakeTexture',win_ptr,goimg);

defimg=imread('lilypad.jpg');
defrect=size(defimg);
defrect=[0 0 defrect([2 1])]; %images have x and y dimensions flipped
deftxt=Screen('MakeTexture',win_ptr,defimg);

bkimg=imread('pond.jpg');
bktxt=Screen('MakeTexture',win_ptr,bkimg);

clear noimg goimg defimg bkimg

%%%%%%%%%%%%%%%% go/no-go parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%
max_rt=1.5; %maximum reaction time in seconds
frac_nogo=0.4; %fraction of no-go trials
max_onset=4; %maximum onset time for target
min_onset=1.5; %minimum onset time for target
pts_per_correct=50; %number of points for correct response
pts_decay=0.5; %timescale for exponential decay of points earned for a correct hit (in s)
pts_offset=0.350; %rt after which decay starts (in s)
grid=[3 3]; %number of targets in each row, col
numtargs=grid(1)*grid(2); %total number of targets

%%%%%%%%%%%%%%%%% response parameters, points, etc. %%%%%%%%%%%%%%%
iti=1; %inter-trial interval (not currently used)
iti_jitter=0.25; %jitter for iti
disp_resp=0.75; %interval for displaying response
disp_resp_jitter=0.25;

state.pts=0;
state.this_val=0;
do_rotate=0;
rot_frac=1;
rot_dur=0.05;
target_ison=0;

%%%%%%%%%%% bundle things that don't change into pars for saving %%%%%%%%%%
pars.max_rt=max_rt;
pars.frac_nogo=frac_nogo;
pars.max_onset=max_onset;
pars.min_onset=min_onset;
pars.pts_per_correct=pts_per_correct;
pars.pts_decay=pts_decay;
pars.pts_offset=pts_offset;
pars.grid=grid;
pars.numtargs=numtargs;
pars.iti=iti;
pars.iti_jitter=iti_jitter;
pars.disp_resp=disp_resp;
pars.disp_resp_jitter=disp_resp_jitter;
pars.rot_dur=rot_dur;
pars.seed=seed;