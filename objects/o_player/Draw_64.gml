/// @description Интерфейс

if (is_dead) exit;

var _width = display_get_gui_width(),
	_height = display_get_gui_height();

if (oxygen_meter_active) {
	var surf = surface_create(_width, _height);
	surface_set_target(surf);
	
	draw_clear_alpha(c_black, 0);
	smoothDepthMeter = lerp(smoothDepthMeter, depthmeterY, 0.05);
	
	draw_set_color(c_white);
	var _count = 15
	var _gap = 2;
	var _propotion = _height / _count;
	var _firstY;

	for (var i = 0; i < 100; ++i) {
		if(i == 0){	_firstY = - smoothDepthMeter; }
		var _lastY  = _firstY + _propotion;
		draw_rectangle(_width - 7, _gap + _firstY, _width - 6, _lastY, false);
		draw_set_font(fnt_number);
		draw_set_halign(fa_right);
		draw_text_transformed(_width - 10, _gap + _firstY - 6, string(i - 9), 1, 1, 0);	
		_firstY = _lastY;
	}

	var _progress = 1 - oxygen / oxygen_capacity;
	var	_thickness = 17;
	var _xpos = _width - _thickness * 0.5 - 29;
	var	_length = 70;
	var _y2 = _height - 8;
	var _y1 = _y2 - _length;

	if(global.isDebug){
		draw_text(10,10,string(_progress))
	}
	
	if(_progress < 0.95){	
		draw_set_color(make_color_rgb(118, 130, 142));
	}
	else{
		draw_set_color(make_color_rgb(138, 0, 0));
	}	

	draw_line_width(_xpos, _y1 + _length * _progress, _xpos, _y2, _thickness);

	gpu_set_blendmode(bm_subtract);
	
	draw_sprite(s_tank_mask, 0, _width - 25, _height + 8);
	
	draw_set_color(c_red);
	
	var _x = _width - 20;
	var _y = (_height / 2) - 5;

	draw_rectangle(_x + 12, _y, _x + 20, _y + 10, false);
	
	draw_rectangle(_x, 0, _x + 20, 10, false);
	draw_rectangle(_x, _height - 10, _x + 20, _height, false);
	
	gpu_set_blendmode(bm_normal);

	draw_sprite(s_arrow, 0, _width - 4, _height / 2);
	draw_sprite(s_tank, 0, _width - 25, _height + 8);
		
	draw_set_color(c_white);
	
	surface_reset_target();
	draw_surface(surf, 0, 0);
	surface_free(surf);
	
}
	
	draw_set_color(c_black);
	draw_set_font(font);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	
	var _x   = 5;
	var _y   = _height - 10;
	var _gap = 2;
	
	draw_set_alpha(slotFade1);	
	if(slot1LangText != ""){
		draw_sprite(s_interact_button, 0, _x, _y);
		draw_text_transformed( _x + 2, _y-1, actionKey, 0.5, 0.5, 0);
	}
	
	draw_set_alpha(1);
	draw_set_alpha(slotFade2);	
	
	if(slot2LangText != ""){
		draw_sprite(s_interact_button, 0, _x, _y - _gap - 10);
		draw_text_transformed( _x + 2,  _y - _gap - 10-1, action2Key, 0.5, 0.5, 0);
	}
	
	draw_set_alpha(1);
	draw_set_alpha(slotFade3);	
	
	if(slot3LangText != ""){
		draw_sprite(s_interact_button, 0, _x,  _y - _gap - 22);
		draw_text_transformed( _x + 2, _y - _gap - 22-1, action3Key, 0.5, 0.5, 0);
	}
	
	draw_set_alpha(1);
	
	draw_set_font(font)

	draw_set_color(c_white);
	draw_set_alpha(slotFade1);	
	if(slot1LangText != ""){
		draw_text_transformed(_x + 12, _y, slot1LangText, 0.5, 0.5, 0);
	}
	draw_set_alpha(1);
	draw_set_alpha(slotFade2);	
	if(slot2LangText != ""){
		draw_text_transformed(_x + 12, _y - _gap - 10, slot2LangText, 0.5, 0.5, 0);
	}
	draw_set_alpha(1);
	draw_set_alpha(slotFade3);	
	if(slot3LangText != ""){
		draw_text_transformed(_x + 12, _y - _gap - 22, slot3LangText, 0.5, 0.5, 0);
	}
	draw_set_alpha(1);	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);	
	draw_reset_font();