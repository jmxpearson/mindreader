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
%now grid out remaining screen max target size will be the smaller
%dimension of each grid square
t_max_size=floor(red_bounds./grid); %grid is defined in setup_pars
t_scale=0.5; %fraction by which to scale square
t_size=t_scale*min(t_max_size);
%get centers of grid
t_xcenters=border(1)-t_max_size(1)/2+(1:grid(1))*t_max_size(1);
t_ycenters=border(2)-t_max_size(2)/2+(1:grid(2))*t_max_size(2);
[t_posx,t_posy]=meshgrid(t_xcenters,t_ycenters);
t_pos=[t_posx(:) t_posy(:)];

t_rects=repmat(t_pos,1,2)+(t_size/2)*repmat([-1 -1 1 1],numtargs,1); %target rectangle

go_color=[0 255 0]; %green means go
stop_color=[255 0 0]; %red means stop
def_color=[125 125 125]; %neutral color