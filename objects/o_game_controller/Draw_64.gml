if(global.isDebug){
	draw_text(32, 32, string(hour));
	draw_text(32, 64, string(o_sun.angle));
}
// Пауза в дроу
if(global.isPause){
	cursor_sprite = s_cursor;
	
	var _surface = surface_create(gameWidth * gameZoom, gameHeight * gameZoom);
	surface_set_target(_surface);
	
	draw_sprite_ext(screenShot, 0, 0, 0, 1, 1, 0, c_white, 1);
	
	//draw_surface_stretched(application_surface, 0, 0, gameWidth, gameHeight);
	
	with(o_menu){
		event_perform(ev_draw, ev_draw_normal)
        event_perform(ev_draw, ev_gui)
	}
	
	
	surface_reset_target();
	draw_surface(_surface, 0, 0)
		
} else {
	
	cursor_sprite = -1;
}