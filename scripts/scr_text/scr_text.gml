/// @function scr_text
/// @param x
/// @param y
/// @param string
/// @param xscale
/// @param [yscale=xscale]
/// @param [color]
/// @param [alpha]
function scr_text(_x, _y, _str, _xscale, _yscale = _xscale, _color = draw_get_color(), _alpha = draw_get_alpha()) {
	draw_text_transformed_color(_x, _y, _str, _xscale, _yscale, 0, _color, _color, _color, _color, _alpha);
}


/// @function scr_text
/// @param x
/// @param y
/// @param string
/// @param xscale
/// @param [yscale=xscale]
/// @param [color]
/// @param [alpha]
/// @description Half-resolution
function scr_text_hl(_x, _y, _str, _xscale, _yscale = _xscale, _color = draw_get_color(), _alpha = draw_get_alpha()) {
	
	scr_text(_x, _y, _str, _xscale * 0.5, _yscale * 0.5, _color, _alpha)
	
}