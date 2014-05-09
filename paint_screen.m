function paint_screen(window,state)
%draws the output for the task
%window is a ptr to the appropriate window
%state contains screen info

border_rect = 15 * [-1 -1 1 1];

%draw numbers
for ind = 1:state.num_options
    DrawFormattedText(window, num2str(ind), state.xcoords(ind), ...
        state.ycoords(ind), [178 34 34]);
    Screen('FrameRect', window, [178 34 34], state.rects{ind}...
        + border_rect, 10);
end

%draw total score
% DrawFormattedText(window,['Total Points: ' num2str(state.pts)],0,0,[178 34 34]); %total score

% switch mode
%     case 0 %target array
%         %Screen('FillRect',window,state.color,state.rect') %targets
%         Screen('DrawTextures',window,state.def_img,state.def_rect,state.rect') %image backgrounds
%     case 1 %specific target turned on
%         if state.rfrac==-1
%             %Screen('FillRect',window,state.color,state.rect') %targets
%             Screen('DrawTextures',window,state.def_img,state.def_rect,state.rect') %image backgrounds
%             %Screen('Fillrect',window,state.t_color,state.rect(state.which_target,:)) %target
%             Screen('DrawTexture',window,state.t_img,state.img_rect,state.rect(state.which_target,:)) %image
%         else
%             RR=state.rect;
%             RR(state.which_target,:)=[]; %remove active target
%             %Screen('FillRect',window,state.color,RR') %targets
%             Screen('DrawTextures',window,state.def_img,state.def_rect,RR') %image backgrounds
%             rr=state.rect(state.which_target,:);
%             wid=((rr(3)-rr(1))/2)*abs(state.rfrac); %scale width
%             mid=(rr(3)+rr(1))/2;
%             rr=[mid-wid/2 rr(2) mid+wid/2 rr(4)]; %scale along x axis
%             switch state.rfrac>0
%                 case 1 %paint target back
%                    % Screen('Fillrect',window,state.color,rr) 
%                     Screen('DrawTextures',window,state.def_img,state.def_rect,rr)
%                 case 0
%                    % Screen('Fillrect',window,state.t_color,rr) 
%                     Screen('DrawTexture',window,state.t_img,state.img_rect,rr)
%             end
%         end
%     case 2 %outcome phase
%         %figure out how big text will be
%         tcoords=findtxtcoords(window,num2str(state.this_val));
%         pos=state.pos(state.which_target,:);
%         txtpos=tcoords(1:2)+pos;
%         
%         %draw stuff
%         %Screen('FillRect',window,state.color,state.rect') %targets
%         Screen('DrawTextures',window,state.def_img,state.def_rect,state.rect') %image backgrounds
%         Screen('Fillrect',window,[255 255 255],state.rect(state.which_target,:)+bord_rect) %border
%         %Screen('Fillrect',window,state.t_color,state.rect(state.which_target,:)) %target   
%         Screen('DrawTexture',window,state.t_img,state.img_rect,state.rect(state.which_target,:)) %image
%         DrawFormattedText(window,num2str(state.this_val),txtpos(1),txtpos(2),[255 255 255]); %point value at vertical offset%flip
%     case 3 %for premature firing
%         %Screen('FillRect',window,state.color,state.rect') %targets
%         Screen('DrawTextures',window,state.def_img,state.def_rect,state.rect') %image backgrounds
%         %figure out how big text will be
%         tcoords=findtxtcoords(window,num2str(state.this_val));
%         pos=sz(3:4)/2; %origin
%         txtpos=tcoords(1:2)+pos;
%         %draw text at origin:
%         DrawFormattedText(window,num2str(state.this_val),txtpos(1),txtpos(2),[255 255 255]); %point value at vertical offset%flip
% 
% end

%flip
Screen(window,'flip');