if(global.isDebug){

	draw_set_color(c_lime);
	draw_circle(x + offsetX, y + offsetY, ref_amount, true);

	draw_set_color(c_purple);
	draw_circle(x + offsetX, y + offsetY, max_amount, true);
}

if(sprite_index != -1 && sprite_index != -4){
	draw_set_color(c_white);
	draw_self();
}
