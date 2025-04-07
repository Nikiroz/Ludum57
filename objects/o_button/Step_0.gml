var _hover = getHover();
click = _hover && mouse_check_button(mb_left);

hover = lerp(hover, _hover, 0.1);
_y = lerp(_y, _ystart - _hover * 3, 0.07);

//mouse enter
if (_hover){
    hasEntered = true;
    if(!audio_is_playing(snd_ui_switch) && !isPlayHover) {
	    audio_play_sound(snd_ui_switch, 10, false);
		isPlayHover = true;
	}
}

//mouse leave
if (!_hover && hasEntered){
    isPlayHover = false;
}

if(click){
	if(_hover && mouse_check_button_pressed(mb_left)){
		audio_play_sound(snd_ui_click, 10, false);
	} 	
} 

if(_hover && mouse_check_button_released(mb_left)){
	event_user(1);	
}

if(_hover && mouse_check_button_pressed(mb_left)){
	audio_play_sound(snd_ui_click, 10, false);
} 