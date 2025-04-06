background_map = ds_map_create();
background_map[? layer_get_id("l_bg_clouds01")] = 0.2;
background_map[? layer_get_id("l_bg_clouds02")] = 0.2;
background_map[? layer_get_id("l_bg_parallax03")] = 0.1;
background_map[? layer_get_id("l_bg_parallax01")] = 0.1;
background_map[? layer_get_id("l_bg_parallax02")] = 0;
background_map[? layer_get_id("l_bg_parallax04")] = 0;
background_map[? layer_get_id("l_bg_water01")] = -0.5;

second = 0;
minute = 0;
hour   = 6;
time   = 0.0;
waterlineY = 245;
alarm[0] = 1;

application_surface_draw_enable(false);