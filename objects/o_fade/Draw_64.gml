var _width  = display_get_gui_width();
var	_height = display_get_gui_height();
draw_set_alpha(fade);
draw_set_color(c_black);
draw_rectangle(0,0,_width,_height,false);
draw_set_color(c_white);
draw_set_alpha(1);