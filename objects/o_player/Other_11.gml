/// @description Смена языка

slot1LangText = getText(slot1Text);
slot2LangText = getText(slot2Text);
slot3LangText = getText(slot3Text);

if(global.locale == Locale.En){
	font = fnt_main_small
} else {
	font = fnt_main_small_ru
}
