draw_set_font(font);
draw_set_color(c_ltgray);
draw_rectangle(_x, _y, _x + width, _y + height, false);
draw_set_color(c_gray);
draw_rectangle(_x, _y, _x + (width * _value), _y + height, false);
var knob_x = _x + (width * _value);
draw_set_color(c_white);
draw_rectangle(knob_x - knobWidth/2, _y - 2, knob_x + knobWidth/2, _y + height + 2, false);
var display_value = _min + (_max - _min) * _value;
draw_set_color(c_white);



var textX = _x + width / 2;
var textY = _y + height / 2 - 5;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(_x + width + 10, _y + 3, string(round(display_value)), 0.5,0.5, 0);
draw_set_valign(fa_bottom);
draw_text_transformed(textX, textY, langText, 0.5,0.5, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_reset_font();