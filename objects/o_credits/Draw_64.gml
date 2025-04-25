
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
var _x1 = gameWidth/2 - 60;
var _x2 = gameWidth/2 + 60;
var _y   = 145;
var _gap = 10;

draw_set_font(font);
draw_text_transformed(_x1, _y, _art, 0.5, 0.5, 0);
draw_set_font(fontSmall);

draw_text_transformed(_x1, _y + _gap * 1, "Hope42morrow", 0.5, 0.5, 0);
draw_text_transformed(_x1, _y + _gap * 2, "Dape", 0.5, 0.5, 0);
draw_text_transformed(_x1, _y + _gap * 3, "kurutta", 0.5, 0.5, 0);
draw_text_transformed(_x1, _y + _gap * 4, "twofaced", 0.5, 0.5, 0);
draw_text_transformed(_x1, _y + _gap * 5, "ivelsoul", 0.5, 0.5, 0);

draw_set_font(font);
draw_text_transformed(_x2, _y, _code, 0.5, 0.5, 0);
draw_set_font(fontSmall);

draw_text_transformed(_x2, _y + _gap * 1, "Nikita Feshkin", 0.5, 0.5, 0);
draw_text_transformed(_x2, _y + _gap * 2, "Anton Grishchenko", 0.5, 0.5, 0);
draw_text_transformed(_x2, _y + _gap * 3, "toncho_", 0.5, 0.5, 0);
draw_text_transformed(_x2, _y + _gap * 4, "Nikita Beliaev", 0.5, 0.5, 0);

draw_set_font(font);
draw_text_transformed(_x1, _y + _gap * 6 + 20, _gamedesign, 0.5, 0.5, 0);
draw_set_font(fontSmall);
draw_text_transformed(_x1, _y + _gap * 7 + 20, "Wayfinder", 0.5, 0.5, 0);

draw_set_font(font);
draw_text_transformed(_x2, _y + _gap * 6 + 20, _sound, 0.5, 0.5, 0);
draw_set_font(fontSmall);
draw_text_transformed(_x2, _y + _gap * 7 + 20, "Nokkard", 0.5, 0.5, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_reset_font();