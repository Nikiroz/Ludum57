function langueInit(){

    global.locale = Locale.En;
	
	var wordHeight = ds_grid_height(global.locData);
	var translation = ds_map_create();
	
	for (var i = 0; i < wordHeight; ++i) {
		ds_map_add(translation, global.locData[# 0 ,i], i);
	}
	
	global.translation = translation;
}