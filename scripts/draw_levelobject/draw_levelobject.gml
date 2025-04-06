function draw_levelobject(_sprite, _frame, _x, _y, _xscale, _yscale, _angle, _blend, _alpha) {
	
	_xscale *= facing;
	
	draw_sprite_ext(_sprite, _frame, _x, _y, _xscale, _yscale, _angle, _blend, _alpha);
	
}