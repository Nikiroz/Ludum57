draw_set_font(font);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(textColor);
draw_text_transformed(_x, _y, langText, 0.5, 0.5, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_reset_font();