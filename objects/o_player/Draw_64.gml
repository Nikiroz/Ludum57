/// @description Интерфейс

if (is_dead) exit;

var _width = display_get_gui_width(),
	_height = display_get_gui_height();

if (oxygen_meter_active) {
	var _progress = 1 - oxygen / oxygen_capacity,
		_thickness = 16, _xpos = _width - _thickness * 0.5 - 8,
		_length = 120, _y2 = _height - 8, _y1 = _y2 - _length;
	
	draw_set_color(c_navy);
	draw_line_width(_xpos, _y1, _xpos, _y2, _thickness);
	
	draw_set_color(c_aqua);
	draw_line_width(_xpos, _y1 + _length * _progress, _xpos, _y2, _thickness);
	
	draw_set_color(c_white);
}