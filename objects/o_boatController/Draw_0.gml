var _x = camera_get_view_x(view_camera[0]),
	_y = camera_get_view_y(view_camera[0]);

draw_surface_ext(boatSurface, _x, _y, 1, 1,
	cos(o_game_controller.time * 8) * 0.5 + boatSpeed, c_white, 1)

#region Отрисовка лебёдки

#macro mcr_ropeRenderThickness 2
#macro mcr_ropeRenderColor #696757

//
draw_set_color(mcr_ropeRenderColor);

with (o_rope_simple) {
	if (instance_exists(parent)) {
		draw_line_width(x, y, parent.x, parent.y, mcr_ropeRenderThickness)
	}
}

draw_set_color(c_white);


#endregion