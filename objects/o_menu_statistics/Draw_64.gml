draw_set_font(font);
var _width  = display_get_gui_width();
var _height = display_get_gui_height();
var surf = surface_create(_width, _height);

surface_set_target(surf);

shader_set(shd_white_noise);

shader_set_uniform_f(shader_get_uniform(shd_white_noise, "time"), current_time * 0.001);
shader_set_uniform_f(shader_get_uniform(shd_white_noise, "itensity"), 1.0);

draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(0,0,_width, _height, false);
draw_set_alpha(1);
draw_set_color(c_white);

shader_reset();

surface_reset_target();
draw_surface(surf, 0, 0);
surface_free(surf);

draw_set_alpha(fade);

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

var _y   = global.isLudumBuild ? 9 : 39;
var _x   = gameWidth/2;
var _gap = 15;
var _tab = 80;

var _tab2 = 50

draw_rectangle(30, _y-5 + _tab2, _x - 70, _y - 9  + _tab2, false);
draw_rectangle(_x + 70, _y-5  + _tab2, gameWidth - 30, _y - 9  + _tab2, false);

if(global.locale == Locale.En){
	draw_text_transformed(_x, _y + _tab2, getText("end_of_day") +" "+ string(global.dayNumbers),0.5,0.5,0);
} 

if(global.locale == Locale.Ru){
	draw_text_transformed(_x, _y + _tab2, "Конец " + string(global.dayNumbers) + " дня",0.5,0.5,0);
}
if(global.locale == Locale.Ua){
	draw_text_transformed(_x, _y + _tab2, "Кінець " + string(global.dayNumbers) + " дня",0.5,0.5,0);
}

draw_set_font(fontSmall);
draw_set_halign(fa_left);

draw_text_transformed(_x - 100, _y + _gap * 1 + _tab, getText("scrap_value") + " ",0.5,0.5,0);
draw_set_color(_red);
draw_text_transformed(_x - 100, _y + _gap * 3 + _tab, getText("food") + " ",0.5,0.5,0);
draw_text_transformed(_x - 100, _y + _gap * 4 + _tab, getText("oxygen") + " ",0.5,0.5,0);
draw_text_transformed(_x - 100, _y + _gap * 5 + _tab, getText("fuel") + " ",0.5,0.5,0);

draw_set_halign(fa_right);
draw_set_color(c_white);
draw_text_transformed(_x + 100, _y + _gap * 1 + _tab, "+" + string(global.scavenge) + "$",0.5,0.5,0);
draw_set_color(_red);
draw_text_transformed(_x + 100, _y + _gap * 3 + _tab, "-"+string(4)+"$",0.5,0.5,0);
draw_text_transformed(_x + 100, _y + _gap * 4 + _tab, string(global.oxygen) + "$",0.5,0.5,0);
draw_text_transformed(_x + 100, _y + _gap * 5 + _tab, string(global.fuel) + "$",0.5,0.5,0);

draw_set_color(c_white);
draw_rectangle( _x - 100, _y + _gap * 7 + _tab -6, 
				_x + 100, _y + _gap * 7 + _tab -5,  
				false);
				

draw_set_halign(fa_right);

if(income<0){
	draw_set_color(_red);
}

draw_text_transformed(_x + 100, _y + _gap * 8 + _tab, string(global.money) + "$",0.5,0.5,0);
draw_set_color(c_white);

draw_set_alpha(1);

//draw_set_color(c_red)
//draw_rectangle(gameWidth - 100, gameHeight - 80, gameWidth, gameHeight, false);
//draw_rectangle(gameWidth - 100, 0, gameWidth, 80, false);