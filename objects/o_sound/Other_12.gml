/// @description start
if(soundLoop = -1){
	exit;	
}

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_falloff(emitter, ref_amount, max_amount, factor_amount);


var _sound_params =
{
    sound: soundLoop,
    priority: 1,
    gain: 1,
    pitch: 1,
	loop: true,
    emitter: emitter,

};

audio_play_sound_ext(_sound_params);