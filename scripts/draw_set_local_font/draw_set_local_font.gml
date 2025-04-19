function draw_set_local_font() {
	if(global.locale == Locale.En){
		font = isSmall ? fnt_main : fnt_main_big;
	} else {
		font = isSmall ? fnt_main_ru : fnt_main_big_ru;
	}
	draw_set_font(font);
}