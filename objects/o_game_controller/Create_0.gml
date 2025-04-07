global.screenshot_sprite = -1;
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

global.isDebug = false;
global.isPause = false;

startHour = 9//5.8//6;
second = 0;
minute = 0;
hour   = startHour;
time   = startHour;
global.saveTime = 0;

timeScale = 0.001;
soundVolume = 0.8;
musicVolume = 0.2;

global.soundVolume = soundVolume;
global.musicVolume = musicVolume;

if (file_exists("debug.ini")) {

	ini_open("debug.ini")

	global.isDebug = ini_read_real("Data", "Debug", false);

	ini_close();

}

if (global.isDebug) {

	dbg_slider(ref_create(self, "time"), 0, 24, "time", timeScale);
	dbg_slider(ref_create(self, "soundVolume"), 0, 1, "soundVolume", 0.05);
	dbg_slider(ref_create(self, "musicVolume"), 0, 1, "musicVolume", 0.05);
	
}


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