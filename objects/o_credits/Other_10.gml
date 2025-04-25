/// @description смена языка

_art   = getText("art");
_code  = getText("code");
_sound = getText("Sound");
_gamedesign = getText("gamedesign");

if(global.locale == Locale.En){
	font = fnt_main_big_2
	fontSmall = fnt_main_small
} else {
	font = fnt_main_big_2_ru
	fontSmall = fnt_main_small_ru
}