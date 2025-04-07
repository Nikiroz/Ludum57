scr_draw_ropes();

var _x = camera_get_view_x(view_camera[0]),
	_y = camera_get_view_y(view_camera[0]);
	
boatAngle = cos(o_game_controller.time * 8) * 0.5 + boatSpeed;
draw_surface_ext(boatSurface, _x, _y, 1, 1,
	boatAngle, c_white, 1)


