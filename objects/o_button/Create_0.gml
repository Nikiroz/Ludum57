width		= 280;
height		= 80;
text		= "";
sprite		= s_button_blank;
labelSprite = noone;
click		= false;
textColor   = c_white;
hover		= 0;
scriptArg	= [];
isPlayHover = false;
hasEntered  = false;
clickSound  = snd_ui_click;
_x		    = x;
_y		    = y;
_ystart	    = _y
scale	    = 0.5;
font	    = fnt_main
langText    = getText(text);
alarm[0]    = 1;
isSmall		= false;
hasAnimate  = true;

function getHover(){	
	return point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _x, _y, _x + width, _y + height);
}