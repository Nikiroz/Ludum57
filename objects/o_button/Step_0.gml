var _hover = getHover();
click = _hover && mouse_check_button(mb_left);

hover = lerp(hover, _hover, 0.1);
y = lerp(y, ystart - _hover * 3, 0.07);

//mouse enter
if (_hover){
    hasEntered = true;
    /*if(!audio_is_playing(snd_ui_hover) && !isPlayHover) {
	    audio_play_sound(snd_ui_hover, 10, false);
		isPlayHover = true;
	}*/
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

if(_hover && mouse_check_button_released(mb_left) && runScript != noone){
	//script_execute_ext(runScript, scriptArg);	
}

if(_hover && mouse_check_button_pressed(mb_left)){
	audio_play_sound(snd_ui_click, 10, false);
} 