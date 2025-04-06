#macro outline_left     1
#macro outline_top      2
#macro outline_right    4
#macro outline_bottom   8
#macro outline_nobottom 7
#macro outline_full     15

function draw_sprite_outline(_outline_mask, _sprite, _frame, _x, _y, _xscale, _yscale, _angle, _color, _alpha) {
	if (_outline_mask != 0) {
		if (_alpha < 1) {
			if (_alpha <= 0) exit
			
			static _surface = -1
			
			if (!surface_exists(_surface))
				_surface = surface_create(400, 400)
			
			var _ox = sprite_get_xoffset(_sprite),
				_oy = sprite_get_yoffset(_sprite),
				_cx = 200 + _ox,
				_cy = 200 + _oy
			
			sprite_set_offset(_sprite, 0, 0)
			
			surface_set_target(_surface)
			draw_clear_alpha(c_black, 0)
			
			//
				gpu_set_fog(true, c_white, 0, 0)
				
				if (_outline_mask & 1) draw_sprite(_sprite, _frame, 199, 200)
				if (_outline_mask & 2) draw_sprite(_sprite, _frame, 201, 200)
				if (_outline_mask & 4) draw_sprite(_sprite, _frame, 200, 199)
				if (_outline_mask & 8) draw_sprite(_sprite, _frame, 200, 201)
				
				gpu_set_fog(0, 0, 0, 0)
				draw_sprite(_sprite, _frame, 200, 200)
				
				gpu_set_fog(true, c_white, 0, 0)
				draw_sprite_ext(_sprite, _frame, 200, 200, 1, 1, 0, c_white, 0.25)
				
				gpu_set_fog(0, 0, 0, 0)
			//
			
			surface_reset_target()
			
			sprite_set_offset(_sprite, _ox, _oy)
			draw_surface_origin(_surface, _x, _y, _cx, _cy, _xscale, _yscale, _angle, _color, _alpha)
			
			exit
		}
		
		gpu_set_fog(true, c_white, 0, 0)
		if (_outline_mask & 1) draw_sprite_ext(_sprite, _frame, _x - 1, _y, _xscale, _yscale, _angle, _color, _alpha)
		if (_outline_mask & 2) draw_sprite_ext(_sprite, _frame, _x + 1, _y, _xscale, _yscale, _angle, _color, _alpha)
		if (_outline_mask & 4) draw_sprite_ext(_sprite, _frame, _x, _y - 1, _xscale, _yscale, _angle, _color, _alpha)
		if (_outline_mask & 8) draw_sprite_ext(_sprite, _frame, _x, _y + 1, _xscale, _yscale, _angle, _color, _alpha)
		gpu_set_fog(0, 0, 0, 0)
		
		gpu_set_fog(true, c_white, 0, 0)
		draw_sprite_ext(_sprite, _frame, _x, _y, _xscale, _yscale, _angle, _color, _alpha * 0.5)
		gpu_set_fog(0, 0, 0, 0)
	}
	
	draw_sprite_ext(_sprite, _frame, _x, _y, _xscale, _yscale, _angle, _color, _alpha)
}

function draw_surface_origin(surface, x, y, xorig, yorig, xscale = 1, yscale = xscale, angle = 0, blend = c_white, alpha = draw_get_alpha()) {
	//
	// props to: https://forum.gamemaker.io/index.php?threads/how-to-change-origin-of-surface.5413/post-637264
	//
	
	var ox = xorig,
		oy = yorig
	
	x -= xorig
	y -= yorig
	
	xorig += x
	yorig += y
	
	// Define the steps (-translate, rotate, translate)
	var matrix_translate_origin =    matrix_build(-xorig, -yorig, 0,    0, 0, 0,        1, 1, 1);
	var matrix_rotate_and_scale =    matrix_build(0, 0, 0,              0, 0, angle,    xscale, yscale, 1);
	var matrix_translate_back =      matrix_build(xorig, yorig, 0,      0, 0, 0,        1, 1, 1);
	
	// Combine the matrices
	var matrix_new_origin = matrix_multiply(matrix_translate_origin, matrix_rotate_and_scale);
	matrix_new_origin = matrix_multiply(matrix_new_origin, matrix_translate_back);
	
	// Apply the final matrix
	matrix_set(matrix_world, matrix_new_origin)
	
	if surface_exists(surface)
		draw_surface_ext(surface, x, y, 1, 1, 0, blend, alpha)
	
	matrix_set(matrix_world, matrix_build_identity());
}