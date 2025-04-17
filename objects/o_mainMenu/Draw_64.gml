/*
draw_set_color(c_black);
draw_set_alpha(fade);
draw_rectangle(0,0,gameWidth, gameHeight, false);
draw_set_alpha(1);
draw_set_color(c_white);
*/
var _width  = display_get_gui_width();
var	_height = display_get_gui_height();
draw_set_alpha(fade);
draw_set_color(c_black);
draw_rectangle(0,0,_width,_height,false);
draw_set_color(c_white);
draw_set_alpha(alpha);
draw_sprite(s_logo_sign_2, 0, _width / 2, 70);
draw_sprite(s_logo_sign_1, 0, _width / 2, _height - 50);
draw_set_alpha(1);