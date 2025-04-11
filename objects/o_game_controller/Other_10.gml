/// @description Capture screenshot

application_surface_draw_enable(false);

if (sprite_exists(global.screenshot_sprite)){
	sprite_delete(global.screenshot_sprite)
}

global.screenshot_sprite = sprite_create_from_surface(_surface, 0, 0, view_wport[0], view_hport[0], 0, 0, 0, 0); 
application_surface_draw_enable(true);
