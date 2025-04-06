background_map = ds_map_create();
background_map[? layer_get_id("l_bg_clouds01")] = 0.2;
background_map[? layer_get_id("l_bg_clouds02")] = 0.2;
background_map[? layer_get_id("l_bg_parallax03")] = 0.1;
background_map[? layer_get_id("l_bg_parallax01")] = 0.1;
background_map[? layer_get_id("l_bg_parallax02")] = 0;
background_map[? layer_get_id("l_bg_parallax04")] = 0;
background_map[? layer_get_id("l_bg_stars")] = 0.2;
background_map[? layer_get_id("l_bg_water01")] = -0.5;

global.isDebug = false;

startHour = 10//6;
second = 0;
minute = 0;
hour  = startHour;
time  = startHour;

timeScale = 0//0.05;

waterlineY = 245;

application_surface_draw_enable(false);

draw_set_font(fnt_debug)

if (file_exists("debug.ini")) {
	
	ini_open("debug.ini")
	
	global.isDebug = ini_read_real("Data", "Debug", false);
	
	ini_close()
}