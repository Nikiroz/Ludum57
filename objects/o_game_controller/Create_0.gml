global.scavenge = 0;
global.fuel = 0;
global.oxygen = 0;

_surface = surface_create(gameWidth * gameZoom, gameHeight * gameZoom);

background_map = ds_map_create();
background_map[? layer_get_id("l_bg_clouds01")] = 0.2;
background_map[? layer_get_id("l_bg_clouds02")] = 0.2;
background_map[? layer_get_id("l_bg_parallax03")] = 0.1;
background_map[? layer_get_id("l_bg_parallax01")] = 0.1;
background_map[? layer_get_id("l_bg_parallax02")] = 0;
background_map[? layer_get_id("l_bg_parallax04")] = 0;
background_map[? layer_get_id("l_bg_stars")] = 0.2;
background_map[? layer_get_id("l_bg_water01")] = -0.5;

startHour = 9;
second = 0;
minute = 0;
hour   = startHour;
time   = startHour;

timeScale = 0 //0.001;

ps_bubbles = part_system_create()
pt_bubbles_count = 5
pt_bubbles_array = array_create(pt_bubbles_count)

for (var i = 0; i < pt_bubbles_count; i ++) {
	var _sprite_bubble = asset_get_index("s_bg_bubbles0" + string(i + 1));
	var _pt_bubble = part_type_create();
	part_type_sprite(_pt_bubble, _sprite_bubble, 1, 1, 0)
	part_type_life(_pt_bubble, 30, 50)
	pt_bubbles_array[i] = _pt_bubble
}

instance_create_layer(0, 0, "water_pre", o_underwater_dark)
