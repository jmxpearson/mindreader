%setup_geometry
%get screen resolution and define useful locations (origin, text locations,
%etc.) with respect to it

%get screen resolution
res_info=Screen('Resolution',which_screen);
horz=res_info.width;
vert=res_info.height;

%set various convenient screen locations (0,0) is upper-left monitor corner
% basic rectangles
origin = [horz/2 vert/2];
text_origin = origin - [45 25];
origin2=[origin origin];

%err_rect=70*[-1 -1 1 1];

%set up target array
border=[50 50]; %borders from edge of screen
red_bounds=[horz vert]-2*border; %remaining screen
