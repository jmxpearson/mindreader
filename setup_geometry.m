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

%set up number array
border=[50 50]; %borders from edge of screen
reduced_bounds=[horz vert]-2*border; %remaining screen
number_box_width = 20;
number_box_height = 20;
number_box = [-number_box_width/2 -number_box_height/2 number_box_width...
    number_box_height];  % box surrounding a given number
number_box_min_spacing = 20;
boxes_per_row = floor(reduced_bounds(1) / (number_box_width + number_box_spacing));

if num_options <= boxes_per_row  % we can fit all numbers on same row
    %calculate locations of box centers
    number_box_spacing = (reduced_bounds(1) - num_options * ...
        number_box_width) / num_options;
    
    offset = border(1) + number_box_width/2;
    skip = number_box_spacing + number_box_width;
    
    number_x_coords = offset + (0:(num_options - 1)) * skip;
    number_y_coords = vert/2 * ones(1, num_options) - number_box_height/2;
end

%find borders of each text label
number_box_rects = cell(num_options);
for ind = 1:num_options
    this_x_center = number_x_coords(ind);
    this_y_center = number_y_coords(ind);
    this_pos = [this_x_center  this_y_center this_x_center  this_y_center];
    
    number_box_rects{ind} = Screen('TextBounds', win_ptr, num2str(ind)) ...
        + this_pos; 

end

% save relevant outputs to state structure
state.num_options = num_options;
state.xcoords = number_x_coords;
state.ycoords = number_y_coords;
state.rects = number_box_rects;