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

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var textX = _x + width / 2;
var textY = _y + height / 2 - 12;

draw_text_ext_transformed(_x + width + 10, _y + 3, string(round(display_value)), 10, 300, textSize, textSize, image_angle);
draw_text_ext_transformed(textX, textY, langText, 10, 300, textSize, textSize, image_angle);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_reset_font();