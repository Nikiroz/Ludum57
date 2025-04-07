depth = -9000;
draw_set_font(fnt_debug);
var hoverColor = make_color_rgb(129,129,139);

if(sprite == noone){
	
	if(click){
		draw_set_color(c_gray);
	} else {
		draw_set_color(merge_color(c_ltgray, c_white, hover));
	}
	
	draw_roundrect(x, y, x + width, y + height, 0);

} else {
	
	var index = 0;
	
	if(getHover()){
		index = 1;	
	}
	if(click){
		index = 2;
	}
	
	draw_sprite_ext(sprite, index, x, y, width / sprite_get_width(sprite), height / sprite_get_height(sprite), 0, c_white, 1);	

}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var textX = x + width / 2;
var textY = y + height / 2 - 3;
var currentColor = textColor;

if(click){
	textY += 2;
	currentColor = hoverColor;
} 

draw_set_color(c_dkgray);
draw_text(textX + 2, textY + 2, text);
draw_set_color(currentColor);
draw_text(textX, textY,  text);
		
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);