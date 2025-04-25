income = global.scavenge - 4 + global.oxygen + global.fuel;
global.money += income;
fade = 0;
popup = 0;
alarm[0] = 1;
isVisible = false;
font = global.locale == Locale.En ? fnt_main_big_3 : fnt_main_big_3_ru;
fontSmall = global.locale == Locale.En ? fnt_main_big_2 : fnt_main_big_2_ru;
_red = make_colour_rgb(169, 99, 99);