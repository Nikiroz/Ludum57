event_inherited();
var _x = camera_get_view_x(view_camera[0]),
	_y = camera_get_view_y(view_camera[0]);
	
boatAngle = cos(current_time /1000) * 0.5 + boatSpeed;
draw_surface_ext(boatSurface, _x, _y, 1, 1,
	boatAngle, c_white, 1)


