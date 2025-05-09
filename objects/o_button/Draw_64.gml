draw_set_local_font()

var hoverColor = make_color_rgb(129,129,139);

if(sprite == noone){
	
	if(click){
		draw_set_color(c_gray);
	} else {
		draw_set_color(merge_color(c_ltgray, c_white, hover));
	}
	
	draw_roundrect(_x, _y, _x + width, _y + height, 0);

} else {
	
	var index = 0;
	
	if(getHover()){
		index = 1;	
	}
	if(click){
		index = 2;
	}
	
	draw_sprite_ext(sprite, index, _x, _y, 0.5, 0.5, 0, c_white, 1);	

}

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

var textX = _x + width / 2;
var textY = _y + height / 2 - 3;
var currentColor = textColor;

if(click){
	textY += 2;
	currentColor = hoverColor;
} 
if(global.isDebug){
	draw_set_color(c_red);
	draw_rectangle(_x, _y, _x + width, _y + height, true);
}

draw_set_color(c_dkgray)
draw_text_transformed(textX + 2, textY + 2, langText, 0.5, 0.5, 0);
draw_set_color(currentColor);
draw_text_transformed(textX + 2, textY + 2, langText, 0.5, 0.5, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_reset_font();